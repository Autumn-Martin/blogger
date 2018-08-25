require 'rails_helper'

describe 'user edits an article' do
  describe 'they link from a show page' do
    describe 'they fill in an edit field and submit' do
      it 'displays the updated information' do
        article = Article.create!(title: "Hitchhiker's Guide to the Galaxy", body: "An adventure in space!")

        visit articles_path
        click_link article.title
        click_link "Edit"

        expect(current_path).to eq(edit_article_path(article))

        fill_in "article[title]", with: "Year Zero: A Novel"
        click_on "Update Article"

        expect(page).to have_content( "Year Zero: A Novel")
        expect(page).to_not have_content("Hitchiker's Guide to the Galaxy")
        expect(page).to have_content("Article Year Zero: A Novel was updated!")
      end
    end
  end
end
