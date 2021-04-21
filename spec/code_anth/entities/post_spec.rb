RSpec.describe Post, type: :entity do
  it 'can be initialized with attributes' do
    post = Post.new(
      title: "Computers and language",
      author: "Code Anth",
      content: "Hello, this is the first post. It has two sentences."
    )
    expect(post.title).to eq("Computers and language")
  end
end
