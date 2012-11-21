require "order_direction/version"
require "order_direction/order_direction"

ActionController::Base.send :include, OrderDirection::ControllerExtension

module OrderDirection
  def self.ipsum
    "Lorem ipsum dolor sit amet, consectetur adipisicing ...."
  end
end
