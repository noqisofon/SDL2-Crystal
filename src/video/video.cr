@[Link("SDL2")]
lib LibSDL2
  # enum SDL_BlendMode -> blendmode.cr

  enum HitTestResult
    NORMAL
    DRAGGABLE
    RESIZE_TOPLEFT
    RESIZE_TOP
    RESIZE_TOPRIGHT
    RESIZE_RIGHT
    RESIZE_BOTTOMRIGHT
    RESIZE_BOTTOM
    RESIZE_BOTTOMLEFT
    RESIZE_LEFT
  end

  # enum SDL_MessageBoxButtonFlags
  # enum SDL_MessageBoxColorType
  # enum SDL_MessageBoxFlags

  enum WindowEventID
    NONE
    SHOWN
    HIDDEN
    EXPOSED
    MOVED
    RESIZED
    SIZE_CHANGED
    MINIMIZED
    MAXIMIZED
    RESTORED
    ENTER
    LEAVE
    FOCUS_GAINED
    FOCUS_LOST
    CLOSE
    TAKE_FOCUS
    HIT_TEST
  end

  enum WindowFlags
    FULLSCREEN         = 0x00000001
    OPENGL             = 0x00000002
    SHOWN              = 0x00000004
    HIDDEN             = 0x00000008
    BORDERLESS         = 0x00000010
    RESIZABLE          = 0x00000020
    MINIMIZED          = 0x00000040
    MAXIMIZED          = 0x00000080
    INPUT_GRABBED      = 0x00000100
    INPUT_FOCUS        = 0x00000200
    MOUSE_FOCUS        = 0x00000400
    FULLSCREEN_DESKTOP = FULLSCREEN | 0x00001000
    FOREIGN            = 0x00000800
    ALLOW_HIGHDPI      = 0x00002000
    MOUSE_CAPTURE      = 0x00004000
    ALWAYS_ON_TOP      = 0x00008000
    SKIP_TASKBAR       = 0x00010000
    UTILITY            = 0x00020000
    TOOLTIP            = 0x00040000
    POPUP_MENU         = 0x00080000
    VULKAN             = 0x10000000
    METAL              = 0x20000000
  end

  struct DisplayMode
    format : UInt32
    w : Int32
    h : Int32
    refresh_rate : Int32
    driverdata : Pointer(Void)
  end

  enum DisplayOrientation
    UNKNOWN           # The display orientation can't be determined
    LANDSCAPE         # The display is in landscape mode, with the right side up, relative to portrait mode
    LANDSCAPE_FLIPPED # The display is in landscape mode, with the left side up, relative to portrait mode
    PORTRAIT          # The display is in portrait mode
    PORTRAIT_FLIPPED  # The display is in portrait mode, upside down
  end

  enum FlashOperation
    CANCEL        # Cancel any window flash state
    BRIEFLY       # Flash the window briefly to get attention
    UNTIL_FOCUSED # Flash the window until it gets focus
  end

  alias GLContext = Pointer(Void)
  alias EGLConfig = Pointer(Void)
  alias EGLSurface = Pointer(Void)
  # alias EGLAttrib = LibC::IntPtrT
  alias EGLAttrib = Int64
  alias EGLint = Int32

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
  fun set_window_hit_test = SDL_SetWindowHitTest(window : Pointer(Window), callback : SDL_HitTest, callback_data : Pointer(Void)) : Int32
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
  fun show_window = SDL_ShowWindow(window : Pointer(Window)) : Void
  fun update_Window_surface = SDL_UpdateWindowSurface(window : Pointer(Window)) : Int32
  fun update_window_surface_rects = SDL_UpdateWindowSurfaceRects(window : Pointer(Window), rects : Pointer(Rect), numrects : Int32) : Int32
  fun video_init = SDL_VideoInit(driver_name : Pointer(UInt8)) : Int32
  fun video_quit = SDL_VideoQuit : Void

  type SDL_HitTest = Pointer(Window), Pointer(Point), Pointer(Void) -> HitTestResult
end
