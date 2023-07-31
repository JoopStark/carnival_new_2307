require_relative "spec_helper"

describe Visitor do
  let (:visitor1) {visitor1 = Visitor.new('Bruce', 54, '$10')}
  describe "set-up" do
    it "exists and has attribures" do 
      expect(visitor1).to be_a Visitor
      expect(visitor1.name).to eq ('Bruce')
      expect(visitor1.height).to eq (54)
      expect(visitor1.spending_money).to eq (10)
      expect(visitor1.preferences).to eq ([])
    end
  end
  
  describe "method: add_preferences" do
    it "starts with no preferences the can add them" do
      expect(visitor1.preferences).to eq ([])
      
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:thrilling)
      
      expect(visitor1.preferences).to eq ([:gentle, :thrilling])
    end
  end

  describe "method: tall_enough?" do
    it "tell if they are tall enough to meet the parameter" do 
      visitor2 = Visitor.new('Tucker', 36, '$5')
      visitor3 = Visitor.new('Penny', 64, '$15')

      expect(visitor1.tall_enough?(54)).to be true
      expect(visitor2.tall_enough?(54)).to be false
      expect(visitor3.tall_enough?(54)).to be true
      expect(visitor1.tall_enough?(64)).to be false
    end
  end
end



