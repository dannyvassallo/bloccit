require 'rails_helper'

describe Vote do
  
  descibe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        up_vote = Vote.new(value: 1)
        expect(v.valid?).to eq(true)

        down_vote = Vote.new(value: -1)
        expect(v2.valid?).to eq(true)

        invalid_vote = Vote.new(value: 2)
        expect(bad_v.valid?).to eq(false)
      end
    end
  end
end