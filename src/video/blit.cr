@[Link("SDL2")]
lib LibSDL2
  struct BlitInfo
    src : Pointer(UInt8)
    src_w, src_h : Int32

    r, g, b, a : UInt8
  end

  type SDL_BlitFunc = Pointer(BlitInfo) ->

  struct BlitMap
    dst : Pointer(Surface)
    identity : Int32
    blit : SDL_blit
    data : Pointer(Void)
    info : BlitInfo

    dst_palette_version : UInt32
    src_palette_version : UInt32
  end
end
