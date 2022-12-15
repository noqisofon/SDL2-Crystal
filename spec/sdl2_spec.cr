require "./spec_helper"

describe "SDL2" do
  # TODO: Write tests

  it "sanity check" do
    answer = LibSDL2.init( LibSDL2::INIT_EVERYTHING )

    answer.should eq 0

    LibSDL2.quit
  end
end
