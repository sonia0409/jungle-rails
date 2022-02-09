# Jungle

A mini e-commerce application built with Rails 4.2 with stripe verification API.

## Features
- User can see list of all products.
- Product with zero quantity left is marked as 'SOLD OUT!'.
- User can sort the products based on the category.
- User can add the product to 'My Cart'.
- User can increase or decrease or delete the product from 'My Cart'.
- User can place the order with the test strip, credit card number.
- Only Admin has previlige to add the new product and category in the list.
- Admin authorization is required.
## Screenshots of the app
!['home-page'](https://github.com/sonia0409/jungle-rails/blob/master/docs/home_page.png)
!['my-cart'](https://github.com/sonia0409/jungle-rails/blob/master/docs/my_cart.png)
!['sorted-list-of-products'](https://github.com/sonia0409/jungle-rails/blob/master/docs/sorted_by_Electronic_category.png)


## Additional Steps for Apple M1 Machines
1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup
1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server
9. Run browser at localhost:3000

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
