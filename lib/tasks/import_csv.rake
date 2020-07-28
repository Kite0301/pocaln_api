require 'csv'

CSV_DIRECTORY = 'db/csv'

namespace :import_csv do
  task :attributes => :environment do
    ::Attribute.delete_all
    # ActiveRecord::Base.connection.execute('ALTER TABLE attributes AUTO_INCREMENT = 1')
    CSV.foreach("#{CSV_DIRECTORY}/attributes.csv") do |row|
      id, name = row
      ::Attribute.create!(id: id, name: name)
    end
  end
end
