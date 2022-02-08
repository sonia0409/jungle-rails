require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
 #SETUP 
 before :each do
  @category = Category.create! name: 'Apparel'

  10.times do |n|
    @category.products.create!(
      name: Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end 
end

scenario "On click they see the detail of the clicked product" do
  # ACT
  visit root_path
  #click_link 'My Cart'
  first('.btn-primary').click

  # DEBUG 
  save_screenshot

  # VERIFY
  expect(page).to have_content('1')

end
end
