require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "validations" do
    it "validate presence of post required fields" do
      should validate_presence_of(:title)
      should validate_presence_of(:content)
      # Comentado por cambio en la validacion del modelo de presence a incusion method
      # should validate_presence_of(:published)
      should validate_presence_of(:user_id)
    end
  end
end
