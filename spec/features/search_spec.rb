require 'rails_helper'

feature 'A user wanting to enlarge his knowledge' do
  let!(:product) { create(:product) }

  before do
    Product.reindex
  end

  context 'searches for an existing product' do
    before do
      visit root_path
      fill_in 'query', with: product.name
      click_on 'Rechercher'
    end

    scenario 'sees the query' do
      expect(page).to have_content("Résultats de la recherche pour le terme : #{product.name}")
    end

    scenario 'sees the link to the product' do
      expect(page).to have_link(product.name)
    end
  end

  context 'searches for a product which does not exist' do
    before do
      visit root_path
      fill_in 'query', with: 'abarfoo'
      click_on 'Rechercher'
    end

    scenario 'sees a proposal for product creation using the query' do
      expect(page).to have_link('Créer : abarfoo')
    end
  end
end
