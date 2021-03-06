# frozen_string_literal: true
describe RuboCop::Cop::Gemfile::SingleGroup do
  subject(:cop) { described_class.new }

  context 'Single group' do
    let(:source) do
      <<-RUBY
group :test do
end
      RUBY
    end

    it_behaves_like 'no offences'
  end

  context 'Muiliple group' do
    let(:source) do
      <<-RUBY
group :test, :development do
end
      RUBY
    end

    it do
      inspect_source(cop, source)

      aggregate_failures do
        expect(cop.messages).to eq ['`group` should not have multiple groups']
        expect(cop.offenses.size).to eq 1
        expect(cop.highlights).to eq([':test, :development'])
      end
    end
  end
end
