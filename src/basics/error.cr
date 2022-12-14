@[Link("SDL2")]
lib LibSDL2
  fun clear_error = SDL_ClearError : Void
  fun get_error = SDL_GetError : Pointer(UInt32)
  fun set_error = SDL_SetError(fmt : Pointer(UInt32), ...) : Int32
end
