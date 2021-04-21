RSpec.describe Web::Views::Readings::Index, type: :view do
 let(:past_reading) {
      Reading.new(
        title: "Rita's stories",
        author: "Rita",
        url: 'www.rita.com',
        meeting_date: 1.week.ago
      )}
 let(:next_reading) {
      Reading.new(
        title: "Rita's stories",
        author: "Rita",
        url: 'www.rita.com',
        meeting_date: 1.week.from_now
      )}
  let(:template)  { Hanami::View::Template.new('apps/web/templates/readings/index.html.erb') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  context 'when there are no future readings' do
   let(:exposures) { Hash[next_reading: [], past_reading: [past_reading]] }

   it 'exposes readings' do
      expect(view.past_reading).to eq exposures.fetch(:past_reading)
    end

    it 'has a title' do
      expect(rendered).to include('next reading')
    end

    it 'shows future readings placeholder' do
      expect(rendered).to include('the next reading group')
    end
  end

  context "when there is a future meeting" do
    let(:exposures) { Hash[past_reading: [past_reading], next_reading: [next_reading]] }
    let(:view)      { described_class.new(template, exposures) }
    let(:rendered)  { view.render }

    it "only shows all future readings" do
      expect(rendered.scan(/class="next_reading"/).length).to eq(1)
      expect(rendered).to include(next_reading.title)
      expect(rendered).to include(next_reading.meeting_date.strftime('%d/%m/%y'))
    end

    it 'hides the placeholder message' do
      expect(rendered).to_not include('Nothing Scheduled')
    end
  end
end
