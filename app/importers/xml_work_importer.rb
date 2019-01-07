class XmlWorkImporter

  def initialize(file)
    @file = file
    #@user = ::User.batch_user
  end

  require 'nokogiri'
  require 'open-uri'

  def import
      # Fetch and parse HTML document
      #doc = Nokogiri::XML(open("spec/fixtures/Named_Collection_Example_PARTS_RECORDS_v3.6_20181207.xml"))
      doc = Nokogiri::XML(open(@file))
      puts "### Search for nodes by xpath"
      doc.xpath("//xmlns:ROW").each do |link|
        work = Work.new
        work.depositor = "cataloger@tcd.ie"
        #fs = FileSet.new
        #fs.title = ["testing title for fileset"]
        #fs.save
        #work.members << fs

        byebug
        # title -> Title
        link.xpath("xmlns:Title").each do |aTitle|
          if !aTitle.content.blank?
            work.title = [aTitle.content]
          end
        end

        # creator -> AttributedArtist
        link.xpath("xmlns:AttributedArtist").each do |anArtist|
          if !anArtist.content.blank?
            anArtist.xpath("xmlns:DATA").each do |individual|
                work.creator.push(individual.content)
            end
          end
        end

        # keyword -> SubjectTMG
        link.xpath("xmlns:SubjectTMG").each do |subjects|
          if !subjects.content.blank?
            subjects.xpath("xmlns:DATA").each do |aSubject|
              work.keyword.push(aSubject.content)
            end
          end
        end

        # rights_statement -> CopyrightStatus
        link.xpath("xmlns:CopyrightStatus").each do |statuses|
          if !statuses.content.blank?
            statuses.xpath("xmlns:DATA").each do |aStatus|
              work.rights_statement.push(aStatus.content)
            end
          end
        end

        work.save
      end
  end
end
