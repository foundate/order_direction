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
      
      # #paramsを引数で渡せば@_paramsが使用可能
      # def order_director(params)
      #   if params.key?('sort') && params.key?('direction')
      #   else
      #     order(:id)
      #   end
      #   
      #   binding.pry
      #   
      #   # @column = (@_params[:sort].present?)? @_params[:sort] : ''
      #   # @direction = (@_params[:direction].present?)? @_params[:direction] : ''
      #   # order_by_direction
      # end
      # 
      # def get_column
      #   
      #   binding.pry
      #   
      #   # Convention.column_names.include?(@column) ? @column : "years"
      # end
      # 
      # def get_direction
      #   %w[asc desc].include?(@direction) ? @direction : "desc"
      # end
      # 
      # def order_by_direction
      #   get_column + " " + get_direction
      # end
      # 
      # 
      # # def load_sort_director
      # #   binding.pry
      # # end
      
    end

    # module InstanceMethods
    #   
    #   #paramsを引数で渡せば@_paramsが使用可能
    #   def order_director(params)
    #     @column = (@_params[:sort].present?)? @_params[:sort] : ''
    #     @direction = (@_params[:direction].present?)? @_params[:direction] : ''
    #     order_by_direction
    #   end
    #   
    #   def get_column
    #     Convention.column_names.include?(@column) ? @column : "years"
    #   end
    #   
    #   def get_direction
    #     %w[asc desc].include?(@direction) ? @direction : "desc"
    #   end
    #   
    #   def order_by_direction
    #     get_column + " " + get_direction
    #   end
    #   
    # end
    
  end
end