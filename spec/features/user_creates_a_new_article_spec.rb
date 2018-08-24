require "rails_helper"

describe "user creates a new article" do
  describe "they link from the articles index" do
    describe "they fill in a title and body" do
      it "creates a new article" do
        visit articles_path
        click_link "Create a New Article"

        expect(current_path).to eq(new_article_path)

        fill_in "article[title]", with: "Frankenstein"
        fill_in "article[body]", with: "The origin of a monster"
        click_on "Create Article"
        
        expect(page).to have_content("Frankenstein")
        expect(page).to have_content("The origin of a monster")
      end
    end
  end
end
