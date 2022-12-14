@[Link("SDL2")]
lib LibSDL2
  # enum SDL_BlendFactor     -> blendmode.cr
  # enum SDL_BlendOperation  -> blendmode.cr

  enum RendererFlags
    SOFTWARE      = 0x00000001
    ACCELERATED   = 0x00000002
    PRESENTVSYNC  = 0x00000004
    TARGETTEXTURE = 0x00000008
  end

  enum ScaleMode
    NEAREST # nearest pixel sampling
    LINEAR  # linear filtering
    BEST    # anisotropic filtering
  end

  enum RendererFlip
    NONE       = 0x00000000
    HORIZONTAL = 0x00000001
    VERTICAL   = 0x00000002
  end

  enum TextureAccess
    STATIC
    STREAMING
    TARGET
  end

  enum TextureModulate
    NONE  = 0x00000000
    COLOR = 0x00000001
    ALPHA = 0x00000002
  end

  # struct SDL_Renderer -> sysrender.cr

  struct RendererInfo
    name : Pointer(UInt8)
    flags : UInt32
    num_texture_formats : UInt32
    texture_formats : UInt32[16]
    max_texture_width : Int32
    max_texture_height : Int32
  end

  # struct SDL_Texture

  fun create_renderer = SDL_CreateRenderer(window : Pointer(Window), index : Int32, flags : UInt32) : Pointer(Renderer)
  fun create_software_renderer = SDL_CreateSoftwareRenderer(surface : Pointer(Surface)) : Pointer(Renderer)
  fun create_texture = SDL_CreateTexture(renderer : Pointer(Renderer), format : UInt32, access : Int32, w : Int32, h : Int32) : Pointer(Texture)
  fun create_texture_from_surface = SDL_CreateTextureFromSurface(renderer : Pointer(Renderer), surface : Pointer(Surface)) : Pointer(Texture)
  fun create_window_and_renderer = SDL_CreateWindowAndRenderer(width : Int32, height : Int32, window_flags : UInt32, window : Pointer(Pointer(Window)), renderer : Pointer(Pointer(Renderer))) : Int32
  fun destroy_renderer = SDL_DestroyRenderer(renderer : Pointer(Renderer)) : Void
  fun destroy_texture = SDL_DestroyTexture(texture : Pointer(Texture)) : Void
  fun gl_bind_texture = SDL_GL_BindTexture(texture : Pointer(Texture), texw : Pointer(Float32), texh : Pointer(Float32)) : Int32
  fun gl_unbind_texture = SDL_GL_UnbindTexture(texture : Pointer(Texture)) : Int32
  fun get_num_render_drivers = SDL_GetNumRenderDrivers : Int32
  fun get_render_draw_blend_mode = SDL_GetRenderDrawBlendMode(renderer : Pointer(Renderer), blendMode : Pointer(BlendMode)) : Int32
  fun get_render_draw_color = SDL_GetRenderDrawColor(renderer : Pointer(Renderer), r : Pointer(UInt8), g : Pointer(UInt8), b : Pointer(UInt8), a : Pointer(UInt8)) : Int32
  fun get_render_driver_info = SDL_GetRenderDriverInfo(index : Int32, info : Pointer(RendererInfo)) : Int32
  fun get_render_target = SDL_GetRenderTarget(renderer : Pointer(Renderer)) : Pointer(Texture)
  fun get_renderer = SDL_GetRenderer(window : Pointer(Window)) : Pointer(Renderer)
  fun get_renderer_info = SDL_GetRendererInfo(renderer : Pointer(Renderer), info : Pointer(RendererInfo)) : Int32
  fun get_renderer_output_size = SDL_GetRendererOutputSize(renderer : Pointer(Renderer), w : Pointer(Int32), h : Pointer(Int32)) : Int32
  fun get_texture_alpha_mod = SDL_GetTextureAlphaMod(texture : Pointer(Texture), alpha : Pointer(UInt8)) : Int32
  fun get_texture_blend_Mode = SDL_GetTextureBlendMode(texture : Pointer(Texture), blendMode : Pointer(BlendMode)) : Int32
  fun lock_texture = SDL_LockTexture(texture : Pointer(Texture), rect : Pointer(Rect), pixels : Pointer(Pointer(Void)), pitch : Pointer(Int32)) : Int32
  fun query_texture = SDL_QueryTexture(texture : Pointer(Texture), format : Pointer(UInt32), access : Pointer(Int32), w : Pointer(Int32), h : Pointer(Int32)) : Int32
  fun render_clear = SDL_RenderClear(renderer : Pointer(Renderer)) : Int32
  fun render_copy = SDL_RenderCopy(renderer : Pointer(Renderer), texture : Pointer(Texture), srcrect : Pointer(Rect), dstrect : Pointer(Rect)) : Int32
  fun render_copy_ex = SDL_RenderCopyEx(renderer : Pointer(Renderer), texture : Pointer(Texture), srcrect : Pointer(Rect), dstrect : Pointer(Rect), angle : Float64, center : Pointer(Point), flip : Pointer(RendererFlip)) : Int32
  fun render_draw_line = SDL_RenderDrawLine(renderer : Pointer(Renderer), x1 : Int32, y1 : Int32, x2 : Int32, y2 : Int32) : Int32
  fun render_draw_lines = SDL_RenderDrawLines(renderer : Pointer(Renderer), points : Pointer(Point), count : Int32) : Int32
  fun render_draw_point = SDL_RenderDrawPoint(renderer : Pointer(Renderer), x : Int32, y : Int32) : Int32
  fun render_draw_points = SDL_RenderDrawPoints(renderer : Pointer(Renderer), points : Pointer(Point), count : Int32) : Int32
  fun render_draw_rect = SDL_RenderDrawRect(renderer : Pointer(Renderer), rect : Pointer(Rect)) : Int32
  fun render_draw_rects = SDL_RenderDrawRects(renderer : Pointer(Renderer), rects : Pointer(Rect), count : Int32) : Int32
  fun render_fill_rect = SDL_RenderFillRect(renderer : Pointer(Renderer), rect : Pointer(Rect)) : Int32
  fun render_fill_rects = SDL_RenderFillRects(renderer : Pointer(Renderer), rects : Pointer(Rect), count : Int32) : Int32
  fun render_get_clip_rect = SDL_RenderGetClipRect(renderer : Pointer(Renderer), rect : Pointer(Rect)) : Void
  fun render_get_integer_scale = SDL_RenderGetIntegerScale(renderer : Pointer(Renderer)) : Bool
  fun render_get_logical_size = SDL_RenderGetLogicalSize(renderer : Pointer(Renderer), w : Int32, h : Int32) : Void
  fun render_get_scale = SDL_RenderGetScale(renderer : Pointer(Renderer), scaleX : Pointer(Float32), scaleY : Pointer(Float32)) : Void
  fun render_get_viewport = SDL_RenderGetViewport(renderer : Pointer(Renderer), rect : Pointer(Rect)) : Void
  fun render_is_clip_enabled = SDL_RenderIsClipEnabled(renderer : Pointer(Renderer)) : Bool
  fun render_present = SDL_RenderPresent(renderer : Pointer(Renderer)) : Void
  fun render_read_pixels = SDL_RenderReadPixels(renderer : Pointer(Renderer), rect : Pointer(Rect), format : UInt32, pixels : Pointer(Void), pitch : Int32) : Int32
  fun render_set_clip_rect = SDL_RenderSetClipRect(renderer : Pointer(Renderer), rect : Pointer(Rect)) : Int32
  fun render_set_integer_scale = SDL_RenderSetIntegerScale(renderer : Pointer(Renderer), enable : Bool) : Int32
  fun render_set_logical_size = SDL_RenderSetLogicalSize(renderer : Pointer(Renderer), w : Int32, h : Int32) : Int32
  fun render_set_scale = SDL_RenderSetScale(renderer : Pointer(Renderer), scaleX : Float32, scaleY : Float32) : Int32
  fun render_set_viewport = SDL_RenderSetViewport(renderer : Pointer(Renderer), rect : Pointer(Rect)) : Int32
  fun render_target_supported = SDL_RenderTargetSupported(renderer : Pointer(Renderer)) : Bool
  fun set_render_draw_blend_mode = SDL_SetRenderDrawBlendMode(renderer : Pointer(Renderer), blendMode : Pointer(BlendMode)) : Int32
  fun set_render_draw_color = SDL_SetRenderDrawColor(renderer : Pointer(Renderer), r : UInt8, g : UInt8, b : UInt8, a : UInt8) : Int32
  fun set_render_target = SDL_SetRenderTarget(renderer : Pointer(Renderer), texture : Pointer(Texture)) : Int32
  fun set_texture_alpha_mod = SDL_SetTextureAlphaMod(texture : Pointer(Texture), alpha : UInt8) : Int32
  fun set_texture_blend_mode = SDL_SetTextureBlendMode(texture : Pointer(Texture), blendMode : Pointer(BlendMode)) : Int32
  fun set_texture_color_mod = SDL_SetTextureColorMod(texture : Pointer(Texture), r : UInt8, g : UInt8, b : UInt8) : Int32
  fun unlock_texture = SDL_UnlockTexture(texture : Pointer(Texture)) : Void
  fun update_texture = SDL_UpdateTexture(texture : Pointer(Texture), rect : Pointer(Rect), pixels : Pointer(Void), pitch : Int32) : Int32
  fun update_yuv_texture = SDL_UpdateYUVTexture(texture : Pointer(Texture), rect : Pointer(Rect), yplane : Pointer(UInt8), ypitch : Int32, uplane : Pointer(UInt8), upitch : Int32, vplane : Pointer(UInt8), vpitch : Int32) : Int32
end
