require "rails_helper"

describe "user sees all articles" do
  describe "they visit /articles" do
    it "displays all articles" do
      article_1 = Article.create!(title: "Hitchhiker's Guide to the Galaxy", body: "An adventure in space!")
      article_2 = Article.create!(title: "The Odyssey", body: "A very long tale")

      visit '/articles'

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_2.title)
    end
  end
end
