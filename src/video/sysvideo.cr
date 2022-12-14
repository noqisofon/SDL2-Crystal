@[Link("SDL2")]
lib LibSDL2
  # struct VideoDisplay
  # struct VideoDevice

  struct WindowShaper
    window : Pointer(Window)
    userx : UInt32
    usery : UInt32
    mode : WindowShapeMode
    hasshape : Bool
    driverdata : Pointer(Void)
  end

  struct ShapeDriver
    createShaper : Pointer(Window) -> WindowShaper
    setWindowShape : Pointer(WindowShaper), Pointer(Surface), WindowShapeMode -> Int32
    resizeWindowShape : -> Pointer(Window)
  end

  struct WindowUserData
    name : Pointer(Char)
    data : Pointer(Void)
    next : Pointer(WindowUserData)
  end

  struct Window
    magic : Pointer(Void)
    id : Uint32
    title : Pointer(Char)
    icon : Pointer(Surface)
    x : Int32
    y : Int32
    w : Int32
    h : Int32
    min_w : Int32
    min_h : Int32
    max_w : Int32
    max_h : Int32
    flags : UInt32
    last_fullscreen_flags : UInt32
    display_index : UInt32

    windowed : Rect

    fullscreen_mode : DisplayMode

    opacity : Float32

    surface : Pointer(Surface)
    surface_valid : Bool

    is_hiding : Bool
    is_destroying : Bool

    mouse_rect : Rect

    shaper : Pointer(WindowShaper)

    hit_test : HitTest
    hit_test_data : Point(Void)

    data : Pointer(WindowUserData)

    driverdata : Pointer(Void)

    prev : Pointer(Window)
    next : Pointer(Window)
  end

  struct VideoDisplay
    name : Pointer(Char)
    max_display_modes : Int32
    num_display_modes : Int32
    display_modes : Pointer(DisplayMode)
    desktop_mode : DisplayMode
    current_mode : DisplayMode
    orientation : DisplayOrientation

    fullscreen_window : Pointer(Window)

    device : Pointer(VideoDevice)
  end

  # struct SDL_SysWMinfo

  enum DeviceQuirkFlags
    VIDEO_DEVICE_QUIRK_DISABLE_DISPLAY_MODE_SWITCHING       = 0x01
    VIDEO_DEVICE_QUIRK_DISABLE_UNSET_FULLSCREEN_ON_MINIMIZE = 0x02
  end

  struct VideoDevice
    name : Pointer(Char)

    videoInit : Pointer(VideoDevice) -> Int32

    videoQuit : Pointer(VideoDevice) ->

    resetTouch : Pointer(VideoDevice) ->

    refreshDisplays : Pointer(VideoDevice) ->

    getDisplayBounds : Pointer(VideoDevice), Pointer(VideoDisplay), Rect -> Int32

    getDisplayUsableBounds : Pointer(VideoDevice), Pointer(VideoDisplay), Rect -> Int32

    getDisplayDPI : Pointer(VideoDevice), Pointer(VideoDisplay), Pointer(Float32), Pointer(Float32), Pointer(Float32) -> Int32

    getDisplayMode : Pointer(VideoDevice), Pointer(VideoDisplay), Pointer(DisplayMode) -> Int32

    createSDLWindow : Pointer(VideoDevice), Pointer(Window) -> Int32
    createSDLWindowFrom : Pointer(VideoDevice), Pointer(Window), Pointer(Void) -> Int32
    setWindowTitle : Pointer(VideoDevice), Pointer(Window) ->
    setWindowIcon : Pointer(VideoDevice), Pointer(Window), Pointer(Surface) ->
    setWindowPosition : Pointer(VideoDevice), Pointer(Window) ->
    setWindowSize : Pointer(VideoDevice), Pointer(Window) ->
    setWindowMinimumSize : Pointer(VideoDevice), Pointer(Window) ->
    setWindowMaximumSize : Pointer(VideoDevice), Pointer(Window) ->
    getWindowBordersSize : Pointer(VideoDevice), Pointer(Window), Pointer(Int32), Pointer(Int32), Pointer(Int32), Pointer(Int32) -> Int32
    getWindowOpacity : Pointer(VideoDevice), Pointer(Window), Float32 ->
    setWindowModalFor : Pointer(VideoDevice), Pointer(Window), Pointer(Window) -> Int32
    setWindowInputFocus : Pointer(VideoDevice), Pointer(Window) -> Int32
    showWindow : Pointer(VideoDevice), Pointer(Window) ->
    hideWindow : Pointer(VideoDevice), Pointer(Window) ->
    raiseWindow : Pointer(VideoDevice), Pointer(Window) ->
    maximizeWindow : Pointer(VideoDevice), Pointer(Window) ->
    minimizeWindow : Pointer(VideoDevice), Pointer(Window) ->
    restoreWindow : Pointer(VideoDevice), Pointer(Window) ->
    setWindowBordered : Pointer(VideoDevice), Pointer(Window), Bool ->
    setWindowResizable : Pointer(VideoDevice), Pointer(Window), Bool ->
    setWindowAlwaysOnTop : Pointer(VideoDevice), Pointer(Window), Bool ->
    setWindowFullscreen : Pointer(VideoDevice), Pointer(Window), Pointer(VideoDisplay), Bool ->
    getWindowICCProfile : Pointer(VideoDevice), Pointer(Window) ->
    setWindowDisplayIndex : Pointer(VideoDevice), Pointer(Window), UInt32 -> Int32
    setWindowMouseRect : Pointer(VideoDevice), Pointer(Window) ->
    setWindowMouseGrab : Pointer(VideoDevice), Pointer(Window), Bool ->
    setWindowKeyboardGrab : Pointer(VideoDevice), Pointer(Window), Bool ->
    destoryWindow : Pointer(VideoDevice), Pointer(Window) ->
    createWindowFramebuffer : Pointer(VideoDevice), Pointer(Window), Pointer(UInt32), Pointer(Pointer(Void)), Pointer(Int32) -> Int32
    updateWindowFramebuffer : Pointer(VideoDevice), Pointer(Window), Pointer(Rect), Int32 -> Int32
    destroyWindowFramebuffer : Pointer(VideoDevice), Pointer(Window) ->
    onWindowEnter : Pointer(VideoDevice), Pointer(Window) ->
    flashWindow : Pointer(VideoDevice), Pointer(Window), FlashOperation ->

    #
    # Shaped-window functions
    #
    shape_driver : ShapeDriver

    getWindowWMInfo : Pointer(VideoDevice), Pointer(Window), Pointer(SysWMinfo) -> Int32

    #
    # OpenGL support
    #
    gl_LoadLibrary : Pointer(VideoDevice), Pointer(Char) -> Int32
    gl_GetProcAddress : Pointer(VideoDevice), Pointer(Char) ->
    gl_UnloadLibrary : Pointer(VideoDevice) ->
    gl_CreateContext : Pointer(VideoDevice), Pointer(Window) -> GLContext
    gl_MakeCurrent : Pointer(VideoDevice), Pointer(Window), GLContext -> Int32
    gl_GetDrawableSize : Pointer(VideoDevice), Pointer(Window), Pointer(Int32), Pointer(Int32) -> Int32
    gl_GetEGLSurface : Pointer(VideoDevice), Pointer(Window) -> EGLSurface
    gl_SetSwapInterval : Pointer(VideoDevice), Int32 -> Int32
    gl_GetSwapInterval : Pointer(VideoDevice), Pointer(Window) -> Int32
    gl_DeleteContext : Pointer(VideoDevice), GLContext ->
    gl_DefaultProfileConfig : Pointer(VideoDevice), Pointer(Int32), Pointer(Int32), Pointer(Int32) ->

    #
    # Vulkan support
    #
    vulkan_LoadLibrary : Pointer(VideoDevice), Pointer(Char) -> Int32
    vulkan_UnloadLibraray : Pointer(VideoDevice) ->
    vulkan_GetInstanceExtensions : Pointer(VideoDevice), Pointer(Window), Pointer(UInt32), Pointer(Pointer(Char)) -> Bool
    vulkan_CreateSurface : Pointer(VideoDevice), Pointer(Window), VkInstance, Pointer(VkSurfaceKHR) -> Bool
    vulkan_GetDrawableSize : Pointer(VideoDevice), Pointer(Window), Pointer(Int32), Pointer(Int32) ->

    #
    # Metal support
    #
    metal_CreateView : Pointer(VideoDevice), Pointer(Window) -> MetalView
    metal_DestroyView : Pointer(VideoDevice), MetalView ->
    metal_GetLayer : Pointer(VideoDevice), MetalView ->
    metal_GetDrawableSize : Pointer(VideoDevice), Pointer(Window), Pointer(Int32), Pointer(Int32) ->

    #
    # Event manager functions
    #
    waitEventTimeout : Pointer(VideoDevice), Int64 -> Int32
    sendWakeupEvent : Pointer(VideoDevice), Pointer(Window) ->
    pumpEvents : Pointer(VideoDevice) ->

    # Suspend the screensaver
    suspendScreenSaver : Pointer(VideoDevice) ->

    # Text input
    startTextInput : Pointer(VideoDevice) ->
    stopTextInput : Pointer(VideoDevice) ->
    setTextInputRect : Pointer(VideoDevice), Pointer(Rect) ->
    clearComposition : Pointer(VideoDevice) ->
    isTextInputShown : Pointer(VideoDevice) -> Bool

    # Screen keyboard
    hasSceenKeyboardSupport : Pointer(VideoDevice) -> Bool
    showScreenKeyboard : Pointer(VideoDevice), Pointer(Window) ->
    hideScreenKeyboard : Pointer(VideoDevice), Pointer(Window) ->
    isScreenKeyboardShown : Pointer(VideoDevice), Pointer(Window) -> Bool

    # Clipboard
    setClipboardText : Pointer(VideoDevice), Pointer(Char) -> Int32
  end
end
