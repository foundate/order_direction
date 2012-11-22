# -*- coding: utf-8 -*-
require 'spec_helper'

# rspec -fs -c spec/order_direction_helper_spec.rb
# -fs by specdoc
# -c  by color

# describe ActiveRecord::OrderDirection do
describe "OrderDirectionHelper Gem Test" do
  
  before(:each) do
    @helper = class Helper
      include OrderDirectionHelper
    end.new
  end
  
  describe "helper method test" do
    
    it "should ClassMethod order_direction_default" do
    end

  end
  
end
