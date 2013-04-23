require 'spec_helper'

describe 'Admin' do
  it "can create a new post and view it" do
    visit new_admin_post_url

    expect {
      fill_in 'post_title',   with: "Hello world!"
      fill_in 'post_content', with: "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat."
      page.check('post_is_published')
      click_button "Save"
    }.to change(Post, :count).by(1)

    page.should have_content "Published: true"
    page.should have_content "Post was successfully saved."
  end

  it "can mark an existing post as unpublished" do
    pending # remove this line when you're working on implementing this test

    page.should have_content "Published: false"
  end
end