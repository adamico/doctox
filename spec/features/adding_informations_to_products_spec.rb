require 'rails_helper'

feature 'A user wanting to contribute to the knowledge about a product' do
  scenario 'successfully adds a new piece of information' do
    create_product('abarfoo')

    click_on 'Rajouter une information'
    fill_in 'information_name', with: 'Dose Toxique'
    fill_in 'information_contents', with: 'The foobar'
    click_on 'Enregistrer'
    expect(page).to have_content('Information Dose Toxique pour le produit abarfoo créée avec succès')

    # contents = '# foobar'
    # page.execute_script(
    #   %($('.CodeMirror')[0].CodeMirror.setValue('#{contents}'))
    # )
    # click_on 'Aperçu'
    # sleep 2
    # expect(page.html).to include('<h1>foobar</h1')
    # click_on 'Ecrire'
    # sleep 2
    # expect(page).to have_content(contents)
  end
end
