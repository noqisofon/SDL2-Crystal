@[Link("SDL2")]
lib LibSDL2
  struct DRect
    x : Float64
    y : Float64
    w : Float64
    h : Float64
  end

  struct Texture
    magic : Pointer(Void)
    format : UInt32
    access : Int32
    w : Int32
    h : Int32
    modMode : Int32
    blendMode : BlendMode
    scaleMode : ScaleMode
    color : Color

    renderer : Pointer(Renderer)

    native : Pointer(Texture)
    yuv : SW_YUVTexture
    pixels : Pointer(Void)
    pitch : Int32
    locked_rect : Rect
    locked_surface : Surface

    last_command_generation : UInt32

    driverdata : Pointer(Void)
    userdata : Pointer(Void)

    priv : Pointer(Texture)
    next : Pointer(Texture)
  end

  struct Renderer
    magic : Pointer(Void)

    # ...
  end
end
