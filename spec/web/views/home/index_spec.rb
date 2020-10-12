# frozen_string_literal: true

RSpec.describe Web::Views::Home::Index, type: :view do
  let(:exposures) { Hash[format: :html] }
  let(:template)  do
    Hanami::View::Template.new('apps/web/templates/home/index.html.erb')
  end
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    expect(view.format).to eq exposures.fetch(:format)
  end

  it 'has a title' do
    expect(view.title).to include('CODE_ANTH')
  end
end
