namespace :retrieve do
  task :ga => :environment do
    GaReport.fetch_ga_lists
  end
end
