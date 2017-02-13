require 'rails_helper'

feature 'A user wanting to contribute to the knowledge' do
  scenario 'creates a product through an unfructuous search' do
    search_product('abarfoo')
    click_on 'Créer : abarfoo'
    click_on 'Créer ce Produit'
    expect(page).to have_content('Produit abarfoo créé avec succès')
  end
end
