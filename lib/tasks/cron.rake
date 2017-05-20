desc "This task runs nightly"
task :cron => :environment do
  Parallel.each(Repository.all, in_threads: 4) do |r|
    begin
      puts "updating #{r.name}"
      r.update_count
      r.update_stats
    rescue => e
      puts "     oops! - #{e}"
      Rails.logger.error("error updating #{r.name} - #{e.inspect}")
    end
  end

  puts "making CSV export"
  CsvExport.update
end
