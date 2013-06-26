require 'spec_helper'

describe Post do
  it "title should be automatically titleized before save" do
    post = Post.new(title: "fancy title!", content: "This is some content. Yes it is.")
    post.title != post.title.titleize
    post.save
    post.title == "Fancy Title!"
  end

  it "post should be unpublished by default" do
    post = Post.create(title: "funky post", content: "yup, this is another test")
    post.is_published == false
  end

  # a slug is an automaticaly generated url-friendly
  # version of the title
  it "slug should be automatically generated" do
    post = Post.new
    post.title   = "New post!"
    post.content = "A great story"
    post.slug.should be_nil
    post.save

    post.slug.should eq "new-post"
  end
end
