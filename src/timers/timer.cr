@[Link("SDL2")]
lib LibSDL2
  MS_PER_SECOND =       1000
  US_PER_SECOND =    1000000
  NS_PER_MD     = 1000000000
  NS_PER_MS     =    1000000
  NS_PER_US     =       1000

  fun get_ticks = SDL_GetTicks : UInt64
  fun get_ticks_ns = SDL_GetTicksNS : UInt64
  fun get_performance_counter = SDL_GetPerformanceCounter : UInt64
  fun get_performance_frequency = SDL_GetPerformanceFrequency : UInt64
  fun delay = SDL_Delay(ms : UInt32)
  fun delay_ns = SDL_DelayNS(ns : UInt64)

  type SDL_TimerCallback = UInt32, Pointer(Void) -> UInt32

  alias TimerID = Int32

  fun add_timer = SDL_AddTimer(interval : UInt32, callback : SDL_TimerCallback, param : Pointer(Void)) : TimerID
  fun remove_timer = SDL_RemoveTimer(id : TimerID) : Bool
end
