require 'rails_helper'

describe Product do

  context "when the product has comments" do

    let(:product) { Product.create!(name: "Fawn", description: "This handmade 100% cotton baby bonnet is for babies first months. Take care: Bonnets should hand-wash cold, dry flat. Iron if necessary. Do not bleach or use oxidizing agents. ", image_url: "/home/jenny/myapp/app/assets/images/BraunBonnet2web.jpg", colour: "Brown", price: "19.95") }
    let(:user) { User.create!(email: "jenny_wjertzoch@yahoo.de",first_name: "Jennifer", last_name: "Wjertzoch", password: "Test123") }

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful!")
      product.comments.create!(rating: 3, user: user, body: "Ok!")
      product.comments.create!(rating: 5, user: user, body: "Great!")
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3
    end
  end

    it "is not valid without a name" do
      expect(Product.new(name: "test")).not_to be_valid
    end

    it "is not valid without a discription" do
      expect(Product.new(description: "test")).not_to be_valid
    end

    it "is not valid without a price" do
      expect(Product.new(price: "19.95")).not_to be_valid
    end

    it "is not valid without a colour" do
      expect(Product.new(colour: "brown")).not_to be_valid
    end

    it "is not valid without a image_url" do
      expect(Product.new(image_url: "bonnet.jpg")).not_to be_valid
    end
end
