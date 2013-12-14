require 'rspec'
require_relative '../lib/gdocr2/cell'

describe Cell do
  before(:each) do
    @cell = Cell.new
    @cell.alive = true
  end

  describe "alive" do
    context "should die" do
      it 'if under populated' do
        @cell.neighbours = 1
        @cell.is_alive?.should be_false
      end

      it 'by overcrowding' do
        @cell.neighbours = (4..100).to_a.sample
        @cell.is_alive?.should be_false
      end
    end
    context "should stay alive" do
      it 'with two' do
        @cell.neighbours = 2
        @cell.is_alive?.should be_true
      end
      it 'with three' do
        @cell.neighbours = 3
        @cell.is_alive?.should be_true
      end
    end
  end

  describe "dead" do
    context "should ressurect" do
      it 'with exactly three' do
        @cell.alive = false
        @cell.neighbours = 3
        @cell.is_alive?.should be_true
      end
    end
    context "should stay dead" do
      it 'with two' do
        @cell.alive = false
        @cell.neighbours = 2
        @cell.is_alive?.should be_false
      end
    end
  end
end
