require "./spec_helper"

describe "SDL2" do
  it "Returns 0 if initialization succeeds" do
    begin
      answer = LibSDL2.init(LibSDL2::INIT_EVERYTHING)

      answer.should eq 0
    ensure
      LibSDL2.quit
    end
  end

  it "Check for subsystems successfully initialized by was_init" do
    begin
      answer = LibSDL2.init(LibSDL2::INIT_EVERYTHING)

      answer.should eq 0

      sybsystem_init = LibSDL2.was_init(LibSDL2::INIT_EVERYTHING)

      (sybsystem_init | LibSDL2::INIT_TIMER).should_not eq 0
      (sybsystem_init | LibSDL2::INIT_AUDIO).should_not eq 0
      (sybsystem_init | LibSDL2::INIT_VIDEO).should_not eq 0
      (sybsystem_init | LibSDL2::INIT_GAMECONTROLLER).should_not eq 0
    ensure
      LibSDL2.quit
    end
  end

  it "get_ticks should return 5000 or more after 5000ms delay" do
    begin
      answer = LibSDL2.init(LibSDL2::INIT_EVERYTHING)

      answer.should eq 0

      LibSDL2.delay( 5000 )

      ticks = LibSDL2.get_ticks
      (ticks >= 5000).should be_true
    ensure
      LibSDL2.quit
    end
  end
end
