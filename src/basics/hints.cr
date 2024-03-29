@[Link("SDL2")]
lib LibSDL2
  HINT_ACCELEROMETER_AS_JOYSTICK                = "SDL_ACCELEROMETER_AS_JOYSTICK"
  HINT_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION  = "SDL_ANDROID_APK_EXPANSION_MAIN_FILE_VERSION"
  HINT_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION = "SDL_ANDROID_APK_EXPANSION_PATCH_FILE_VERSION"
  HINT_ANDROID_SEPARATE_MOUSE_AND_TOUCH         =
    HINT_APPLE_TV_CONTROLLER_UI_EVENTS = "SDL_APPLE_TV_CONTROLLER_UI_EVENTS"
  HINT_APPLE_TV_REMOTE_ALLOW_ROTATION          = "SDL_APPLE_TV_REMOTE_ALLOW_ROTATION"
  HINT_BMP_SAVE_LEGACY_FORMAT                  = "SDL_BMP_SAVE_LEGACY_FORMAT"
  HINT_EMSCRIPTEN_KEYBOARD_ELEMENT             = "SDL_EMSCRIPTEN_KEYBOARD_ELEMENT"
  HINT_FRAMEBUFFER_ACCELERATION                = "SDL_FRAMEBUFFER_ACCELERATION"
  HINT_GAMECONTROLLERCONFIG                    = "SDL_GAMECONTROLLERCONFIG"
  HINT_GRAB_KEYBOARD                           = "SDL_GRAB_KEYBOARD"
  HINT_IDLE_TIMER_DISABLED                     = "SDL_IOS_IDLE_TIMER_DISABLED"
  HINT_IME_INTERNAL_EDITING                    = "SDL_IME_INTERNAL_EDITING"
  HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS        = "SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS"
  HINT_MAC_BACKGROUND_APP                      = "SDL_MAC_BACKGROUND_APP"
  HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK      = "SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK"
  HINT_MOUSE_FOCUS_CLICKTHROUGH                = "SDL_MOUSE_FOCUS_CLICKTHROUGH"
  HINT_MOUSE_RELATIVE_MODE_WARP                = "SDL_MOUSE_RELATIVE_MODE_WARP"
  HINT_NO_SIGNAL_HANDLERS                      = "SDL_NO_SIGNAL_HANDLERS"
  HINT_ORIENTATIONS                            = "SDL_IOS_ORIENTATIONS"
  HINT_RENDER_DIRECT3D11_DEBUG                 = "SDL_RENDER_DIRECT3D11_DEBUG"
  HINT_RENDER_DIRECT3D_THREADSAFE              = "SDL_RENDER_DIRECT3D_THREADSAFE"
  HINT_RENDER_DRIVER                           = "SDL_RENDER_DRIVER"
  HINT_RENDER_OPENGL_SHADERS                   = "SDL_RENDER_OPENGL_SHADERS"
  HINT_RENDER_SCALE_QUALITY                    = "SDL_RENDER_SCALE_QUALITY"
  HINT_RENDER_VSYNC                            = "SDL_RENDER_VSYNC"
  HINT_RPI_VIDEO_LAYER                         = "SDL_RPI_VIDEO_LAYER"
  HINT_THREAD_STACK_SIZE                       = "SDL_THREAD_STACK_SIZE"
  HINT_TIMER_RESOLUTION                        = "SDL_TIMER_RESOLUTION"
  HINT_VIDEO_ALLOW_SCREENSAVER                 = "SDL_VIDEO_ALLOW_SCREENSAVER"
  HINT_VIDEO_HIGHDPI_DISABLED                  = "SDL_VIDEO_HIGHDPI_DISABLED"
  HINT_VIDEO_MAC_FULLSCREEN_SPACES             = "SDL_VIDEO_MAC_FULLSCREEN_SPACES"
  HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS            = "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS"
  HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT         = "SDL_VIDEO_WINDOW_SHARE_PIXEL_FORMAT"
  HINT_VIDEO_WIN_D3DCOMPILER                   = "SDL_VIDEO_WIN_D3DCOMPILER"
  HINT_VIDEO_X11_NET_WM_PING                   = "SDL_VIDEO_X11_NET_WM_PING"
  HINT_VIDEO_X11_XINERAMA                      = "SDL_VIDEO_X11_XINERAMA"
  HINT_VIDEO_X11_XRANDR                        = "SDL_VIDEO_X11_XRANDR"
  HINT_VIDEO_X11_XVIDMODE                      = "SDL_VIDEO_X11_XVIDMODE"
  HINT_WINDOWS_DISABLE_THREAD_NAMING           = "SDL_WINDOWS_DISABLE_THREAD_NAMING"
  HINT_WINDOWS_ENABLE_MESSAGELOOP              = "SDL_WINDOWS_ENABLE_MESSAGELOOP"
  HINT_WINDOWS_NO_CLOSE_ON_ALT_F4              = "SDL_WINDOWS_NO_CLOSE_ON_ALT_F4"
  HINT_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN = "SDL_WINDOW_FRAME_USABLE_WHILE_CURSOR_HIDDEN"
  HINT_WINRT_HANDLE_BACK_BUTTON                = "SDL_WINRT_HANDLE_BACK_BUTTON"
  HINT_WINRT_PRIVACY_POLICY_LABEL              = "SDL_WINRT_PRIVACY_POLICY_LABEL"
  HINT_WINRT_PRIVACY_POLICY_URL                = "SDL_WINRT_PRIVACY_POLICY_URL"
  HINT_XINPUT_ENABLED                          = "SDL_XINPUT_ENABLED"
  HINT_XINPUT_USE_OLD_JOYSTICK_MAPPING         = "SDL_XINPUT_USE_OLD_JOYSTICK_MAPPING"

  enum HintPriority
    HINT_DEFAULT
    HINT_NORMAL
    HINT_OVERRIDE
  end

  type SDL_HintCallback = Pointer(Void), Pointer(Char), Pointer(Char), Pointer(Char) -> Void

  fun add_hint_callback = SDL_AddHintCallback(name : Pointer(Char), callback : SDL_HintCallback, userdata : Pointer(Void)) : Void
  fun clear_hints = SDL_ClearHints : Void
  fun del_hint_callback = SDL_DelHintCallback(name : Pointer(Char), callback : SDL_HintCallback, userdata : Pointer(Void)) : Void
  fun get_hint = SDL_GetHint(name : Pointer(Char)) : Pointer(Char)
  fun get_hint_boolean = SDL_GetHintBoolean(name : Pointer(Char), default_value : Bool) : Bool
  fun set_hint = SDL_SetHint(name : Pointer(Char), value : Pointer(Char)) : Bool
  fun set_hint_with_priority = SDL_SetHintWithPriority(name : Pointer(Char), value : Pointer(Char), priority : HintPriority) : Bool
end
