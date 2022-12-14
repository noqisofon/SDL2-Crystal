@[Link("SDL2")]
lib LibSDL2

  struct Surface
    flags: UInt32
    format: Pointer(PixelFormat)
    w: Int32
    h: Int32
    pitch: Int32

    pixels: Pointer(Void)

    userdata: Pointer(Void)

    locked: Int32

    list_blitmap: Pointer(Void)

    clip_rect: Rect

    map: Pointer(BlitMap)

    refcount: Int32
  end

  type SDL_blit = Pointer(Surface), Pointer(Rect), Pointer(Surface), Pointer(Rect) -> Int32

end