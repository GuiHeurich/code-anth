RSpec.describe Web::Controllers::Posts::Create, type: :action do
  let(:action)     { described_class.new }
  let(:repository) { PostRepository.new }

  before do
    repository.clear
  end

  context 'with valid params' do
    let(:params) { Hash[post: { title: "a", author: "b", content: "c"}] }

    it 'creates a new post' do
      action.call(params)
      post = repository.last

      expect(post.id).to_not be_nil
    end

    it 'redirects user to the posts listing' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/posts')
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[post: {}] }

    it 'returns HHTP client error' do
      response = action.call(params)
      expect(response[0]).to eq(422)
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:post, :title)).to eq(['is missing'])
      expect(errors.dig(:post, :author)).to eq(['is missing'])
    end
  end
end
