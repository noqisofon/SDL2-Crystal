@[Link("SDL2")]
lib LibSDL2
  enum GLattr
    GL_RED_SIZE
    GL_GREEN_SIZE
    GL_BLUE_SIZE
    GL_ALPHA_SIZE
    GL_BUFFER_SIZE
    GL_DOUBLEBUFFER
    GL_DEPTH_SIZE
    GL_STENCIL_SIZE
    GL_ACCUM_RED_SIZE
    GL_ACCUM_GREEN_SIZE
    GL_ACCUM_BLUE_SIZE
    GL_ACCUM_ALPHA_SIZE
    GL_STEREO
    GL_MULTISAMPLEBUFFERS
    GL_MULTISAMPLESAMPLES
    GL_ACCELERATED_VISUAL
    GL_RETAINED_BACKING
    GL_CONTEXT_MAJOR_VERSION
    GL_CONTEXT_MINOR_VERSION
    GL_CONTEXT_EGL
    GL_CONTEXT_FLAGS
    GL_CONTEXT_PROFILE_MASK
    GL_SHARE_WITH_CURRENT_CONTEXT
    GL_FRAMEBUFFER_SRGB_CAPABLE
    GL_CONTEXT_RELEASE_BEHAVIOR
    GL_CONTEXT_RESET_NOTIFICATION
    GL_CONTEXT_NO_ERROR
  end

  enum GLcontextFlag
    GL_CONTEXT_DEBUG_FLAG              = 0x0001
    GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 0x0002
    GL_CONTEXT_ROBUST_ACCESS_FLAG      = 0x0004
    GL_CONTEXT_RESET_ISOLATION_FLAG    = 0x0008
  end

  enum GLprofile
    GL_CONTEXT_PROFILE_CORE          = 0x0001
    GL_CONTEXT_PROFILE_COMPATIBILITY = 0x0002
    GL_CONTEXT_PROFILE_ES            = 0x0004
  end

  fun gl_create_context = SDL_GL_CreateContext(window : Pointer(Window)) : GLContext
  fun gl_delete_context = SDL_GL_DeleteContext(context : GLContext) : Void
  fun gl_extension_supported = SDL_GL_ExtensionSupported(extension : Pointer(Int8)) : Bool
  fun gl_get_attribute = SDL_GL_GetAttribute(attr : GLattr, value : Pointer(Int32)) : Int32
  fun gl_get_current_context = SDL_GL_GetCurrentContext : GLContext
  fun gl_get_current_window = SDL_GL_GetCurrentWindow : Pointer(Window)
  fun gl_get_drawable_size = SDL_GL_GetDrawableSize(window : Pointer(Window), w : Pointer(Int32), h : Pointer(Int32)) : Void
  fun gl_get_proc_address = SDL_GL_GetProcAddress(proc : Pointer(Int8)) : Pointer(Void)
  fun gl_get_swap_interval = SDL_GL_GetSwapInterval : Int32
  fun gl_load_library = SDL_GL_LoadLibrary(path : Pointer(Int8)) : Int32
  fun gl_make_current = SDL_GL_MakeCurrent(window : Pointer(Window), context : GLContext) : Int32
  fun gl_reset_attributes = SDL_GL_ResetAttributes : Void
  fun gl_set_attribute = SDL_GL_SetAttribute(attr : GLattr, value : Int32) : Int32
  fun gl_set_swap_interval = SDL_GL_SetSwapInterval(interval : Int32) : Int32
  fun gl_swap_window = SDL_GL_SwapWindow(window : Pointer(Window)) : Void
  fun gl_unload_library = SDL_GL_UnloadLibrary : Void
end
