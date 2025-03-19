require './lib/world_cup'
require './lib/team'
require './lib/player'
require 'pry'

RSpec.describe WorldCup do
  before(:each) do
    @france = Team.new("France")
    @mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})   
    @pogba = Player.new({name: "Paul Pogba", position: "midfielder"})   
    @croatia = Team.new("Croatia")
    @modric = Player.new({name: "Luka Modric", position: "midfielder"})
    @vida = Player.new({name: "Domagoj Vida", position: "defender"})

    @world_cup = WorldCup.new(2018, [@france, @croatia])
  end

  describe "initialize" do
    it "exists" do
      expect(@world_cup).to be_a(WorldCup)
    end
    it "has a year" do
      expect(@world_cup.year).to eq(2018)
    end
    it"has teams" do
      expect(@world_cup.teams).to eq([@france, @croatia])
    end
  end
  describe 'active_players_by_position("midfielder")' do
    it 'returns the active_players_by_position' do
      @france.add_player(@mbappe)
      @france.add_player(@pogba)
      @croatia.add_player(@modric)
      @croatia.add_player(@vida)

      #expect(@world_cup.active_players_by_position("midfielder")).to eq [@pogba, @modric]

      @croatia.eliminated = true

      expect(@world_cup.active_players_by_position("midfielder")).to eq([@pogba])
    end
  end

  describe 'all_players_by_position("midfielder")' do
    it 'returns the all_players_by_position' do
      @france.add_player(@mbappe)
      @france.add_player(@pogba)
      @croatia.add_player(@modric)
      @croatia.add_player(@vida)

      expected = {
            "forward" => [@mbappe],
            "midfielder" => [@pogba, @modric],
            "defender" => [@vida]
          }
      expect(@world_cup.all_players_by_position).to eq(expected)
    end
  end
end
