# acts_as_decimal

A simple gem for Rails 3 to make an attribute behave like it is floating point,
being stored as an integer in the database. Tested with Ruby 1.8.7, 1.9.2, Rubinius 2.0.0pre and JRuby 1.6.2.

Add it to your Gemfile:

````ruby
  gem 'acts_as_decimal'
````

And put this in your model, let's say a Product with a `#price` attribute:

````ruby
  class Product < ActiveRecord::Base
    acts_as_decimal :price                    # Defaults to 2 decimal floating point values, or...
    acts_as_decimal :price, :decimals => 5    # ...as you wish!
  end
````

Now you store and retrieve `#price` as a floating point:
  
````ruby
  product = Product.new
  product.price = 12.30   
  product.price              # => 12.30
````

But you still have access to the raw database integer value through `#price_raw`:

````ruby
  product.price_raw          # => 1230
  product.price_raw = 4309   # product.price == 43.09
````

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history. (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Codegram. See LICENSE for details.


