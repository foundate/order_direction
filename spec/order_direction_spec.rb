# -*- coding: utf-8 -*-
require 'spec_helper'

class Convention < ::ActiveRecord::Base
  
  order_direction_default :years
  
end

# rspec -fs -c spec/order_direction_spec.rb
# -fs by specdoc
# -c  by color

# describe ActiveRecord::OrderDirection do
describe "OrderDirection Gem Test" do

  let(:convention_db_init) { 
    Convention.create(:years => 2010, :title => 'test data')
    Convention.create(:years => 2011, :title => 'test data')
    Convention.create(:years => 2012, :title => 'test data')
  }

  before(:each) do
    convention_db_init
  end
  
  describe "method test" do
    
    it "should ClassMethod order_direction_default" do
      Convention.order_direction_options == {:default_order => "years"}
    end
    
    it "should object ActiveRecord Record respond_to? order_director method" do
      Convention.respond_to?('order_director').should be_true
    end
    
    it "should object ActiveRecord Relation respond_to? order_director method" do
      Convention.select(:id).respond_to?('order_director').should be_true
    end
    
    it "should object ActiveRecord Record respond_to? order_director method" do
      Convention.order_director().select(:id).to_sql == "SELECT id FROM \"conventions\"  ORDER BY years"
    end
    
    it "#order_director No Parameters Default Order" do
      Convention.select(:id).order_director().to_sql.should == "SELECT id FROM \"conventions\"  ORDER BY years"
    end
    
    it "#order_director Not column_names Default Order" do
      params = {"direction"=>"asc", "sort"=>"yearsers"}
      Convention.select(:id).order_director().to_sql.should == "SELECT id FROM \"conventions\"  ORDER BY years"
    end
    
    it "#order_director direction1" do
      params = {"direction"=>"asc", "sort"=>"years"}
      Convention.select(:id).order_director(params).to_sql.should == "SELECT id FROM \"conventions\"  ORDER BY years asc"
    end
    
    it "#order_director direction2" do
      params = {"direction"=>"desc", "sort"=>"created_at"}
      Convention.select(:id).order_director(params).to_sql.should == "SELECT id FROM \"conventions\"  ORDER BY created_at desc"
    end

  end
  
end
