require 'rails_helper'

RSpec.describe Destination, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:trip) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
