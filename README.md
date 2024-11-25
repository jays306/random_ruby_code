# random_ruby_code
## XML Scripts
### How to validate a XML file against its corresponding XSD
#### Open your terminal and run the following
```ruby
irb
load './xml_scripts.rb'

# Replace with your XML and XSD file paths
xml_file_path = "/Users/jaewoongshin/Downloads/mysubmission.xml"

# Note: Make sure all associated XSD files that are configured in your parent XSD file exist in the right paths
# E.g: The XSD file you load can load other XSD files by <xsd:include schemaLocation="../../../Common/someCommonTypes.xsd"/>
xsd_file_path = "/Users/jaewoongshin/Documents/TaxDocuments/JayIRS/2021v7.7/EmploymentTax/940/Return940.xsd"


validate_xml(xml_file_path, xsd_file_path)

```
#### If there is any errors, you will see error messages in your terminal
```shell
[#<Nokogiri::XML::SyntaxError: 30:0: ERROR: Element '{http://www.yolo.hi/efile}DaytimePhoneNum': [facet 'pattern'] The value '123-456-7890' is not accepted by the pattern '[0-9]{10}'.>,
#<Nokogiri::XML::SyntaxError: 38:0: ERROR: Element '{http://www.yolo.hi/efile}YOLO940_940PR': This element is not expected. Expected is ( {http://www.irs.gov/efile}IRS940 ).>]
```
