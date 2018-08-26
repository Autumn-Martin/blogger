require "rails_helper"

describe "user sees one article" do
  describe "they link from the articles index" do
    it "displays information for one article" do
      article = Article.create!(title: "Harry Potter and the Sorcerer's Stone", body: "A book about a rock.")
      comment_1 = article.comments.create(author_name: "Moi", body: "This code is magic.")
      comment_2 = article.comments.create(author_name: "Cat", body: "This code makes me want to lay on your keyboard.")
      visit articles_path
      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end
end
