require './lib/team'
require './lib/player'
require './lib/world_cup'


RSpec.describe Team do
  before(:each) do
    @team = Team.new("France") 
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
  end
  describe "initialize" do
    it "exists" do
      expect(@team).to be_a(Team)
    end
    it "has a country" do
      expect(@team.country).to eq("France")
    end
    it "can be eliminated?" do
      expect(@team.eliminated?).to eq(false)
    end
  end

  describe "eliminated?" do
    it "is eliminated?"do
      expect(@team.eliminated?).to eq(false)
      @team.eliminated = true
      expect(@team.eliminated?).to eq(true)
    end
  end

  describe "adds player to the team" do
    it "adds players" do
      @team.add_player(@mbappe)
      @team.add_player(@pogba)

      expect(@team.players).to eq([@mbappe, @pogba])
    end

  end

  describe "players_by_position" do
    it " returns the midfielder" do
      @team.add_player(@mbappe)
      @team.add_player(@pogba)
      @team.players_by_position("midfielder")

      expect(@team.players_by_position("midfielder")).to eq([@pogba])
    end

    it "returns the defender" do
      @team.add_player(@mbappe)
      @team.add_player(@pogba)
      @team.players_by_position("defender")
      
      expect(@team.players_by_position("defender")).to eq([])
    end
  end


  
end