require 'active_record'

module ActiveRecord
  class Relation
    
    def order_director(params = nil)
      if params.instance_of?(ActiveSupport::HashWithIndifferentAccess) || params.instance_of?(Hash)
        if params.key?('sort') && params.key?('direction')
          @column = params['sort'].to_s;
          @direction = params['direction'].to_s
          return reorder("#{order_by_direction}")
        end
      end
      return self
    end
      
    def order_by_direction
      get_column + " " + get_direction
    end
      
    private
      def get_column
        klass.column_names.include?(@column) ? @column : klass.column_names.first
      end
      def get_direction
        %w[asc desc].include?(@direction) ? @direction : "desc"
      end
    end
end