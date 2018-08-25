require "rails_helper"

describe "user deletes an article" do
  describe "they link from the show page" do
    it "displays all articles without the deleted entry" do
      article_1 = Article.create!(title: "Hatchet", body: "A survival in the woods story")
      article_2 = Article.create!(title: "Z for Zachariah", body: "A zombie apocalypse")
      article_3 = Article.create!(title: "Ready Player One", body: "A virtual reality universe.")

      visit article_path(article_1)
      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(page).to have_content(article_3.title)
      # expect(page).to_not have_content(article_1.title)
      expect(page).to have_content("Article Hatchet was deleted!")
    end
  end
end
