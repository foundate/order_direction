require "order_direction/version"
require "order_direction/order_direction"
require "order_direction/order_direction_helper"

# ActionController::Base.send :include, OrderDirection::ControllerExtension
# ActiveRecord::Base.send :extend, OrderDirection::ModelExtension

ActiveRecord::Base.send(:include, ActiveRecord::OrderDirection)
ActionView::Base.send(:include, OrderDirectionHelper)