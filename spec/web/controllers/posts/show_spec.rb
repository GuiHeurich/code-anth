RSpec.describe Web::Controllers::Posts::Show, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  context "when the post exists" do
    let(:repository) { PostRepository.new }
    let(:content) {
      "Greece will take a first step towards reopening its tourism industry by dropping quarantine rules for travellers from more than 30 nations if they’ve been vaccinated or tested negative for Covid-19 &" \
      "From next week, incoming citizens from across the European Union and five other countries, including the UK, will no longer be required to self-isolate, officials said. The new regime is expected to come into effect on 19 April, in the run-up to the country formally reopesaning up its tourism sector from mid-May. &" \
      "They are baby steps before the country opens as planned for tourists on 14 May,” a senior tourism ministry official said. “Nine airports will open at the same time that the restriction is lifted.” &" \
      "Passengers from the 27-member EU, as well as the US, Britain, Serbia, Israel and the United Arab Emirates, will be able to fly into airports in popular destinations without being forced to go into isolation on arrival – provided they meet the conditions. &" \
      "Under the plan, airports will reopen in Kos, Mykonos, Santorini, Rhodes, Corfu, Athens, Thessaloniki and Chania and Heraklion on Crete,” she said. “We’re not expecting tourists to start arriving en masse but the system needs to be tested. It can’t be switched on, in one go, overnight. &" \
    }

    before do
      repository.clear

      repository.create(title: "First Post", author: "Gui Heurich", content: content)
    end

    let(:post) { repository.all.first }
    let(:params) { Hash[id: post.id]}

    it 'is successful' do
      response = action.call(params)
      expect(response[0]).to eq 200
    end

    it "finds the correct post" do
      action.call(params)
      expect(action.exposures[:post].id).to eq(post.id)
    end

    it "splits content into paragraphs according to separator" do
      action.call(params)
      expect(action.exposures[:content].count).to eq 5
    end
  end
end
