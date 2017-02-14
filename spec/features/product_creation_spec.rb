require 'rails_helper'

feature 'A user wanting to contribute to the knowledge' do
  scenario 'creates a product through an unfructuous search' do
    search_product('abarfoo')
    click_on 'Créer : abarfoo'
    click_on 'Créer ce Produit'
    expect(page).to have_content('Produit abarfoo créé avec succès')
  end

  scenario 'modifies an existing product' do
    product = create(:product)
    visit edit_product_path(product)
    fill_in 'product_name', with: 'new name'
    click_on 'Modifier ce Produit'
    expect(page).to have_content('Produit new name mis à jour avec succès')
  end
end
