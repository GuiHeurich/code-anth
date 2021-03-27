RSpec.describe Web::Views::Posts::Index do
  let(:exposures) { Hash[posts: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/posts/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #posts' do
    expect(view.posts).to eq(exposures.fetch(:posts))
  end

  context 'when there are posts' do
    let(:post_one)    { Post.new(title: "a", author: "b", content: "c")}
    let(:post_two)    { Post.new(title: "d", author: "e", content: "f")}
    let(:exposures)   { Hash[posts: [post_one, post_two]]}

    it 'lists them all' do
      expect(rendered.scan(/class="post"/).length).to eq(2)
      expect(rendered).to include("a")
      expect(rendered).to include("d")
    end
  end
end
