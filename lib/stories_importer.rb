class StoriesImporter

  def initialize(filename=File.dirname(__FILE__) + "/../db/data/stories_data.csv")
    @filename = filename
  end

  def import
    field_names = ['story', 'user_id', 'forked_from_id', 'created_at', 'updated_at']

    print "Importing stories from #{@filename}: "
    Story.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        story = Story.create!(attribute_hash)
        print "."; STDOUT.flush
      end
    end
    puts "\nDONE"
  end

end