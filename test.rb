require 'erb'
require 'ostruct'

require_relative "./parser.rb"

# The template render will render the ERB template
# The initializer takes the header and the data tables
class TemplateRenderer

  attr_accessor :headers
  attr_accessor :data_set
  attr_accessor :state

  def initialize(headers, data_set)
    self.headers = headers
    self.data_set = data_set
  end

  def render_erb(template_text)
    begin
      # set up the open struct for the bindings to the ERB template
      table_data_set_struct = OpenStruct.new(table_headers: headers, table_data: data_set)
      template_render_object = ERB.new(template_text)
      # return the evalution
      return template_render_object.result(table_data_set_struct.instance_eval {binding})
    rescue Exception => e
      puts "Error rendering the template"
      self.state = "Error returning the template"
      return self.state
    end
  end
end
