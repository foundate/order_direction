# OrderDirection

OrderDirection provides the ability to easily sort

## Installation

Add this line to your application's Gemfile:

    gem 'order_direction', :git => 'git://github.com/foundate/order_direction.git'

And then execute:

    $ bundle install

## Usage

		class Sample < ::ActiveRecord::Base
		  order_direction_default :years
		end

order_direction_default :years ← Default Order Colmun

		Convention.order_director().select(:id).to_sql #SELECT id FROM conventions ORDER BY years
		Convention.select(:id).order_director().to_sql #SELECT id FROM conventions ORDER BY years"
		Convention.select(:id).order_director(params).to_sql #SELECT id FROM conventions ORDER BY years asc

params = {"direction"=>"asc", "sort"=>"years"}
「params」Parameter provides us with a helper

## Helper

	sortable_direction :created_at, 'created_at'

<a href="/direction=desc&sort=created_at">created_at</a>
<i class="icon-arrow-down"></i>
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
