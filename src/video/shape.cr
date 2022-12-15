@[Link("SDL2")]
lib LibSDL2
  fun create_shape_window = SDL_CreateShapedWindow(title : Pointer(Char), x : UInt32, y : UInt32, w : UInt32, h : UInt32, flags : UInt32) : Pointer(Window)
  fun is_shaped_window = SDL_IsShapedWindow(window : Pointer(Window)) : Bool

  enum WindowShapeMode
    Default
    BinarizeAlpha
    ReverseBinarizeAlpha
    ColorKey
  end
end
