module OrderDirection
  module ControllerExtension
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
    end
    
    module ClassMethods

      # def load_sort_director
      #   binding.pry
      # end
      
    end

    module InstanceMethods
      
      #paramsを引数で渡せば@_paramsが使用可能
      def order_director(params)
        @column = (@_params[:sort].present?)? @_params[:sort] : ''
        @direction = (@_params[:direction].present?)? @_params[:direction] : ''
        order_by_direction
      end
      
      def get_column
        Convention.column_names.include?(@column) ? @column : "years"
      end
      
      def get_direction
        %w[asc desc].include?(@direction) ? @direction : "desc"
      end
      
      def order_by_direction
        get_column + " " + get_direction
      end
      
    end
    
  end

end
