@[Link("SDL2")]
lib LibSDL2
  struct Color
    r : UInt8
    g : UInt8
    b : UInt8
    a : UInt8
  end

  struct Palette
    ncolors : Int32
    colors : Pointer(Color)
    version : UInt32
    refcount : Int32
  end

  struct PixelFormat
    format : UInt32
    palette : Pointer(Palette)
    bitsPerPixel : UInt8
    bytesPerPixel : UInt8
    padding : UInt8[2]
    rmask : UInt32
    gmask : UInt32
    bmask : UInt32
    amask : UInt32
    rloss : UInt8
    gloss : UInt8
    bloss : UInt8
    rshift : UInt8
    gshift : UInt8
    bshift : UInt8
    ashift : UInt8
    refcount : Int32
    next : Pointer(PixelFormat)
  end

  fun get_pixel_format_name = SDL_GetPixelFormatName(format : UInt32) : Pointer(Char)
end
