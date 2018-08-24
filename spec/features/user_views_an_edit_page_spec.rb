require 'rails_helper'

describe 'user sees an edit page' do
  describe 'they link from the show page' do
    describe 'they fill in and edit field and submit' do
      it 'edits an article' do
        article = Article.create!(title: "Hitchhiker's Guide to the Galaxy", body: "An adventure in space!")

        visit articles_path
        click_link article.title
        click_link "Edit"

        expect(current_path).to eq(edit_article_path)

        fill_in "article[title]", with: "Year Zero: A Novel"

        click_on "Submit"

        expect(page).to have_content("Year Zero: A Novel")
        expect(page).to_not have_content("Hitchiker's Guide to the Galaxy")
      end
    end
  end
end
