namespace :retrieve do
  task :ga => :environment do
    GaReport.fetch_ga_lists
  end
  puts "Successfully fetched GA Lists"
end
