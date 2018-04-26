require 'rails_helper'

describe User do
  context "Testing validations" do

    it 'requires email address' do
      expect(User.new(first_name: "Jennifer", last_name: "Wjertzoch", email: nil)).not_to be_valid
    end
  end
end
