@[Link("SDL2")]
lib LibSDL2
  struct SW_YUVTexture
    format : UInt32
    target_format : UInt32
    w, h : Int32
    pixels : Pointer(Void)

    pitches : UInt16[3]
    planes : UInt8[3]

    stretch : Pointer(Surface)
    display : Pointer(Surface)
  end
end
