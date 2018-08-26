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
      expect(page).to have_content("Comments (#{article.comments.size})")
    end
  end
  describe 'they fill in a comment form' do
    it 'displays the comment on the article show' do
      article = Article.create!(title: 'Hitchhikers Guide to the Galaxy', body: 'an adventure in space')

      visit article_path(article)

      fill_in 'comment[author_name]', with: 'Dolphin'
      fill_in 'comment[body]', with: 'So long and thanks for all the fish!'
      click_on 'Submit'

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content('Post a Comment')
      expect(page).to have_content('Dolphin')
      expect(page).to have_content('So long and thanks for all the fish!')
    end
  end
end
