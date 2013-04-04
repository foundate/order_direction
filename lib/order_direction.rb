require "order_direction/version"
require "order_direction/order_direction"
require "order_direction/order_direction_helper"

ActionView::Base.send(:include, OrderDirectionHelper)