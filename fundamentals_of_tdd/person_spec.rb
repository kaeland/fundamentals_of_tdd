# Use TDD principles to build out name functionality for a Person.
# Here are the requirements:
# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.
require 'pry'

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  # implement your behavior here
  def full_name
    if @middle_name.nil? == false
      "#{@first_name} #{@middle_name} #{@last_name}"
    else
      "#{@first_name} #{@last_name}"
    end
  end
  
  def full_name_with_middle_initial
    if @middle_name.nil? == false
      "#{@first_name} #{@middle_name[0]}. #{@last_name}"
    else
      "#{@first_name} #{@last_name}"
    end
  end
  
  def initials
    if @middle_name.nil? == false
      "#{@first_name[0] + @middle_name[0] + @last_name[0]}"
    else
      "#{@first_name[0] + @last_name[0]}"
    end
  end
end

# binding.pry 

RSpec.describe Person do
  describe "#full_name" do
    it "concatenates first name, middle name, and last name with spaces" do
      sarah = Person.new(first_name: "Sarah", middle_name: "Lehann", last_name: "James")
      
      expect(sarah.full_name).to eq("Sarah Lehann James")
    end
    it "does not add extra spaces if middle name is missing" do 
      sarah = Person.new(first_name: "Sarah", last_name: "James")
      
      expect(sarah.full_name).to eq("Sarah James")
    end
  end
  
  describe "#full_name_with_middle_initial" do
    it "returns the full name and middle initial of a person" do
      sarah = Person.new(first_name: "Sarah", middle_name: "Lehann", last_name: "James")

      expect(sarah.full_name_with_middle_initial).to eq("Sarah L. James")
    end
    
    it "does not include extra spaces or a period if the middle name is missing" do
      sarah = Person.new(first_name: "Sarah", last_name: "James")
      
      expect(sarah.full_name_with_middle_initial).to eq("Sarah James")
    end
  end
  
  describe "#initials" do
    it "should return the initials of the person's name" do
      sarah = Person.new(first_name: "Sarah", middle_name: "Lehann", last_name: "James")
      
      expect(sarah.initials).to eq("SLJ")
    end
    
    it "returns two characters if the person instance does not have a middle name" do
      sarah = Person.new(first_name: "Sarah", last_name: "James")
      
      expect(sarah.initials).to eq("SJ")
    end
  end
end