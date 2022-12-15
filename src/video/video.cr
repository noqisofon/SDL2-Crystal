@[Link("SDL2")]
lib LibSDL2
  # enum SDL_BlendMode -> blendmode.cr

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

  enum HitTestResult
    HITTEST_NORMAL
    HITTEST_DRAGGABLE
    HITTEST_RESIZE_TOPLEFT
    HITTEST_RESIZE_TOP
    HITTEST_RESIZE_TOPRIGHT
    HITTEST_RESIZE_RIGHT
    HITTEST_RESIZE_BOTTOMRIGHT
    HITTEST_RESIZE_BOTTOM
    HITTEST_RESIZE_BOTTOMLEFT
    HITTEST_RESIZE_LEFT
  end

  # enum SDL_MessageBoxButtonFlags
  # enum SDL_MessageBoxColorType
  # enum SDL_MessageBoxFlags

  enum WindowEventID
    WINDOWEVENT_NONE
    WINDOWEVENT_SHOWN
    WINDOWEVENT_HIDDEN
    WINDOWEVENT_EXPOSED
    WINDOWEVENT_MOVED
    WINDOWEVENT_RESIZED
    WINDOWEVENT_SIZE_CHANGED
    WINDOWEVENT_MINIMIZED
    WINDOWEVENT_MAXIMIZED
    WINDOWEVENT_RESTORED
    WINDOWEVENT_ENTER
    WINDOWEVENT_LEAVE
    WINDOWEVENT_FOCUS_GAINED
    WINDOWEVENT_FOCUS_LOST
    WINDOWEVENT_CLOSE
    WINDOWEVENT_TAKE_FOCUS
    WINDOWEVENT_HIT_TEST
  end

  enum WindowFlags
    WINDOW_FULLSCREEN         = 0x00000001
    WINDOW_OPENGL             = 0x00000002
    WINDOW_SHOWN              = 0x00000004
    WINDOW_HIDDEN             = 0x00000008
    WINDOW_BORDERLESS         = 0x00000010
    WINDOW_RESIZABLE          = 0x00000020
    WINDOW_MINIMIZED          = 0x00000040
    WINDOW_MAXIMIZED          = 0x00000080
    WINDOW_INPUT_GRABBED      = 0x00000100
    WINDOW_INPUT_FOCUS        = 0x00000200
    WINDOW_MOUSE_FOCUS        = 0x00000400
    WINDOW_FULLSCREEN_DESKTOP = WINDOW_FULLSCREEN | 0x00001000
    WINDOW_FOREIGN            = 0x00000800
    WINDOW_ALLOW_HIGHDPI      = 0x00002000
    WINDOW_MOUSE_CAPTURE      = 0x00004000
    WINDOW_ALWAYS_ON_TOP      = 0x00008000
    WINDOW_SKIP_TASKBAR       = 0x00010000
    WINDOW_UTILITY            = 0x00020000
    WINDOW_TOOLTIP            = 0x00040000
    WINDOW_POPUP_MENU         = 0x00080000
    WINDOW_VULKAN             = 0x10000000
    WINDOW_METAL              = 0x20000000
  end

  struct DisplayMode
    format : UInt32
    w : Int32
    h : Int32
    refresh_rate : Int32
    driverdata : Pointer(Void)
  end

  enum DisplayOrientation
    ORIENTATION_UNKNOWN           # The display orientation can't be determined
    ORIENTATION_LANDSCAPE         # The display is in landscape mode, with the right side up, relative to portrait mode
    ORIENTATION_LANDSCAPE_FLIPPED # The display is in landscape mode, with the left side up, relative to portrait mode
    ORIENTATION_PORTRAIT          # The display is in portrait mode
    ORIENTATION_PORTRAIT_FLIPPED  # The display is in portrait mode, upside down
  end

  enum FlashOperation
    FLASH_CANCEL        # Cancel any window flash state
    FLASH_BRIEFLY       # Flash the window briefly to get attention
    FLASH_UNTIL_FOCUSED # Flash the window until it gets focus
  end

  # struct SDL_MessageBoxButtonData
  # struct SDL_MessageBoxColor
  # struct SDL_MessageBoxColorScheme
  # struct SDL_MessageBoxData
  # struct SDL_WindowEvent

  fun create_window = SDL_CreateWindow(title : Pointer(UInt8), x : Int32, y : Int32, w : Int32, h : Int32, flags : UInt32) : Pointer(Window)
  fun create_window_and_renderer = SDL_CreateWindowAndRenderer(width : Int32, height : Int32, window_flags : UInt32, window : Pointer(Pointer(Window)), renderer : Pointer(Pointer(Renderer))) : Int32
  fun create_window_from = SDL_CreateWindowFrom(data : Pointer(Void)) : Pointer(Window)
  fun destroy_window = SDL_DestroyWindow(window : Pointer(Window)) : Void
  fun disable_screen_saver = SDL_DisableScreenSaver : Void
  fun enable_screen_saver = SDL_EnableScreenSaver : Void
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
  fun get_closest_display_mode = SDL_GetClosestDisplayMode(displayIndex : Int32, mode : Pointer(DisplayMode), closest : Pointer(DisplayMode)) : Pointer(DisplayMode)
  fun get_current_display_mode = SDL_GetCurrentDisplayMode(displayIndex : Int32, mode : Pointer(DisplayMode)) : Int32
  fun get_current_video_driver = SDL_GetCurrentVideoDriver : Pointer(Int8)
  fun get_desktop_display_Mode = SDL_GetDesktopDisplayMode(displayIndex : Int32, mode : Pointer(DisplayMode)) : Int32
  fun get_display_bounds = SDL_GetDisplayBounds(displayIndex : Int32, rect : Pointer(Rect)) : Int32
  fun get_display_DPI = SDL_GetDisplayDPI(displayIndex : Int32, ddpi : Pointer(Float32), hdpi : Pointer(Float32), vdpi : Pointer(Float32)) : Int32
  fun get_display_mode = SDL_GetDisplayMode(displayIndex : Int32, modeIndex : Int32, mode : Pointer(DisplayMode)) : Int32
  fun get_display_name = SDL_GetDisplayName(displayIndex : Int32) : Pointer(Int8)
  fun get_display_usable_bounds = SDL_GetDisplayUsableBounds(displayIndex : Int32, rect : Pointer(Rect)) : Int32
  fun get_grabbed_window = SDL_GetGrabbedWindow : Pointer(Window)
  fun get_num_display_modes = SDL_GetNumDisplayModes(displayIndex : Int32) : Int32
  fun get_num_video_displays = SDL_GetNumVideoDisplays : Int32
  fun get_num_video_drivers = SDL_GetNumVideoDrivers : Int32
  fun get_video_driver = SDL_GetVideoDriver(index : Int32) : Pointer(Int8)
  fun get_window_borders_size = SDL_GetWindowBordersSize(window : Pointer(Window), top : Pointer(Int32), left : Pointer(Int32), bottom : Pointer(Int32), right : Pointer(Int32)) : Int32
  fun get_window_brightness = SDL_GetWindowBrightness(window : Pointer(Window)) : Float32
  fun get_window_data = SDL_GetWindowData(window : Pointer(Window), name : Pointer(Int8)) : Pointer(Void)
  fun get_window_display_index = SDL_GetWindowDisplayIndex(window : Pointer(Window)) : Int32
  fun get_window_display_mode = SDL_GetWindowDisplayMode(window : Pointer(Window), mode : Pointer(DisplayMode)) : Int32
  fun get_window_flags = SDL_GetWindowFlags(window : Pointer(Window)) : UInt32
  fun get_window_from_id = SDL_GetWindowFromID(id : UInt32) : Pointer(Window)
  fun get_window_gamma_ramp = SDL_GetWindowGammaRamp(window : Pointer(Window), red : Pointer(UInt16), green : Pointer(UInt16), blue : Pointer(UInt16)) : Int32
  fun get_window_grab = SDL_GetWindowGrab(window : Pointer(Window)) : Bool
  fun get_window_id = SDL_GetWindowID(window : Pointer(Window)) : UInt32
  fun get_window_maximum_size = SDL_GetWindowMaximumSize(window : Pointer(Window), w : Pointer(Int32), h : Pointer(Int32)) : Void
  fun get_window_minimum_size = SDL_GetWindowMinimumSize(window : Pointer(Window), w : Pointer(Int32), h : Pointer(Int32)) : Void
  fun get_window_opacity = SDL_GetWindowOpacity(window : Pointer(Window), opacity : Pointer(Float32)) : Int32
  fun get_window_pixel_format = SDL_GetWindowPixelFormat(window : Pointer(Window)) : UInt32
  fun get_window_position = SDL_GetWindowPosition(window : Pointer(Window), x : Pointer(Int32), y : Pointer(Int32)) : Void
  fun get_window_size = SDL_GetWindowSize(window : Pointer(Window), w : Pointer(Int32), h : Pointer(Int32)) : Void
  fun get_window_surface = SDL_GetWindowSurface(window : Pointer(Window)) : Pointer(Surface)
  fun get_window_title = SDL_GetWindowTitle(window : Pointer(Window)) : Pointer(UInt8)
  fun get_window_wm_info = SDL_GetWindowWMInfo(window : Pointer(Window), info : Pointer(SysWMinfo)) : Bool
  fun hide_window = SDL_HideWindow(window : Pointer(Window)) : Void
  fun is_screen_saver_enabled = SDL_IsScreenSaverEnabled : Bool
  fun maximize_window = SDL_MaximizeWindow(window : Pointer(Window)) : Void
  fun minimize_window = SDL_MinimizeWindow(window : Pointer(Window)) : Void
  fun raise_window = SDL_RaiseWindow(window : Pointer(Window)) : Void
  fun restore_window = SDL_RestoreWindow(window : Pointer(Window)) : Void
  fun set_window_bordered = SDL_SetWindowBordered(window : Pointer(Window), bordered : Bool) : Void
  fun set_window_brightness = SDL_SetWindowBrightness(window : Pointer(Window), brightness : Float32) : Int32
  fun set_window_data = SDL_SetWindowData(window : Pointer(Window), name : Pointer(UInt8), userdata : Pointer(Void)) : Pointer(Void)
  fun set_window_display_mode = SDL_SetWindowDisplayMode(window : Pointer(Window), mode : Pointer(DisplayMode)) : Int32
  fun set_window_fullscreen = SDL_SetWindowFullscreen(window : Pointer(Window), flags : UInt32) : Int32
  fun set_window_gamma_ramp = SDL_SetWindowGammaRamp(window : Pointer(Window), red : Pointer(UInt16), green : Pointer(UInt16), blue : Pointer(UInt16)) : Int32
  fun set_window_grab = SDL_SetWindowGrab(window : Pointer(Window), grabbed : Bool) : Void
  fun set_window_hit_test = SDL_SetWindowHitTest(window : Pointer(Window), callback : HitTest, callback_data : Pointer(Void)) : Int32
  fun set_window_icon = SDL_SetWindowIcon(window : Pointer(Window), icon : Pointer(Surface)) : Void
  fun set_window_input_focus = SDL_SetWindowInputFocus(window : Pointer(Window)) : Int32
  fun set_window_maximum_size = SDL_SetWindowMaximumSize(window : Pointer(Window), max_w : Int32, max_h : Int32) : Void
  fun set_window_minimum_size = SDL_SetWindowMinimumSize(window : Pointer(Window), min_w : Int32, min_h : Int32) : Void
  fun set_window_modal_for = SDL_SetWindowModalFor(modal_window : Pointer(Window), parent_window : Pointer(Window)) : Int32
  fun set_window_opacity = SDL_SetWindowOpacity(window : Pointer(Window), opacity : Float32) : Int32
  fun set_window_position = SDL_SetWindowPosition(window : Pointer(Window), x : Int32, y : Int32) : Void
  fun set_window_resizable = SDL_SetWindowResizable(window : Pointer(Window), resizable : Bool) : Void
  fun set_window_size = SDL_SetWindowSize(window : Pointer(Window), w : Int32, h : Int32) : Void
  fun set_window_title = SDL_SetWindowTitle(window : Pointer(Window), title : Pointer(UInt8)) : Void
  fun show_message_box = SDL_ShowMessageBox(messageboxdata : Pointer(MessageBoxData), buttonid : Ponter(Int32)) : Int32
  fun show_simple_message_box = SDL_ShowSimpleMessageBox(flags : UInt32, title : Pointer(UInt8), message : Pointer(UInt8), window : Pointer(Window)) : Int32
  fun show_window = SDL_ShowWindow(window : Pointer(Window)) : Void
  fun update_Window_surface = SDL_UpdateWindowSurface(window : Pointer(Window)) : Int32
  fun update_window_surface_rects = SDL_UpdateWindowSurfaceRects(window : Pointer(Window), rects : Pointer(Rect), numrects : Int32) : Int32
  fun video_init = SDL_VideoInit(driver_name : Pointer(UInt8)) : Int32
  fun video_quit = SDL_VideoQuit : Void

  type SDL_HitTest = Pointer(Window), Pointer(Point), Pointer(Void) -> HitTestResult
end
