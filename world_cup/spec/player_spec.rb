require './lib/player'
require 'pry'

RSpec.describe Player do
  before(:each) do
    @player = Player.new({name: "Luka Modric", position: "midfielder"})
  end

  describe "exists" do
    it "exists" do
      expect(@player).to be_a(Player)
    end

    it "has a attributes" do
      expect(@player.name).to eq("Luka Modric")
      expect(@player.position).to eq("midfielder")
    end
  end
end