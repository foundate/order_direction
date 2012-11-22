require 'active_record'

module ActiveRecord
  class Relation
    
    def order_director(params = nil)
      if params.instance_of?(Hash)
        if params.key?('sort') && params.key?('direction')
          @column = params['sort'].to_s;
          @direction = params['direction'].to_s
          return order("#{order_by_direction}")
        end
      end
      order(klass.order_direction_options[:default_order])
    end
      
    def order_by_direction
      get_column + " " + get_direction
    end
      
    private
      def get_column
        klass.column_names.include?(@column) ? @column : klass.order_direction_options[:default_order]
      end
      def get_direction
        %w[asc desc].include?(@direction) ? @direction : "desc"
      end
  end
end


module ActiveRecord
  module OrderDirection
    
    def self.included(base)
      base.extend(ClassMethods)
      # base.send(:include, InstanceMethods)
    end
    
    module ClassMethods
      
      def order_direction_default(colmun)
        
        class_attribute :order_direction_options
        
        self.order_direction_options = {
          :default_order => colmun.to_s,
        }

      end
      
      def order_director(params = nil)
        self.scoped.order_director(params)
      end

    end
 
  end
end