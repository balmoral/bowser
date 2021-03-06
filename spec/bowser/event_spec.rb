require 'bowser/event'

module Bowser
  describe Event do
    describe '#prevented?' do
      it 'returns true when native event is prevented' do
        event = Event.new(`{ defaultPrevented: true }`)
        expect(event).to be_prevented
      end

      it 'returns false when native is not prevented' do
        event = Event.new(`{ defaultPrevented: false }`)
        expect(event).not_to be_prevented
      end
    end

    describe '#prevent' do
      it 'delegates to native preventDefault' do
        prevented = false
        native = `{ preventDefault: #{-> { prevented = true }} }`
        event = Event.new(native)
        event.prevent

        expect(prevented).to be_truthy
      end
    end

    %w(shift ctrl alt meta).each do |modifier|
      describe "##{modifier}?" do
        it "returns the native #{modifier}Key property" do
          native = {
            shiftKey: false,
            ctrlKey: false,
            altKey: false,
            metaKey: false,
          }.to_n
          event = Event.new(native)

          expect(event.send("#{modifier}?")).to be_falsy

          Native(native)["#{modifier}Key"] = true

          expect(event.send("#{modifier}?")).to be_truthy
        end
      end
    end

    describe '#code' do
      it 'returns the native keyCode property' do
        native = `{ keyCode: 13 }`
        event = Event.new(native)

        expect(event.code).to eq 13
      end
    end

    describe 'dynamic properties' do
      it 'returns the native property' do
        native = `{ omgLol: 'wtf' }`
        event = Event.new(native)

        expect(event.omg_lol).to eq 'wtf'
      end
    end
  end
end
