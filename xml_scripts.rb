require 'nokogiri'

def validate_xml(xml_file_path, xsd_file_path)
  # Read the XML file
  xml_doc = File.open(xml_file_path) { |file| Nokogiri::XML(file) }

  # Read the XSD file
  xsd_doc = File.open(xsd_file_path) { |file| Nokogiri::XML::Schema(file) }

  # Validate XML against XSD
  errors = xsd_doc.validate(xml_doc)

  if errors.empty?
    puts "XML is valid!"
  else
    puts "XML is invalid. Errors:"
    errors.each { |error| puts error.message }
  end
end

