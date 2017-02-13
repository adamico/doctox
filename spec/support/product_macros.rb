module ProductMacros
  def search_product(product_name)
    visit root_path
    fill_in 'query', with: product_name
    click_on 'Rechercher'
  end
end

RSpec.configure do |config|
  config.include ProductMacros
end
