@[Link("SDL2")]
lib LibSDL2
  struct MessageColor
    r, g, b : UInt8
  end

  enum MessageBoxColorType
    MESSAGEBOX_COLOR_BACKGROUND
    MESSAGEBOX_COLOR_TEXT
    MESSAGEBOX_COLOR_BUTTON_BORDER
    MESSAGEBOX_COLOR_BUTTON_BACKGROUND
    MESSAGEBOX_COLOR_BUTTON_SELECTED
    MESSAGEBOX_COLOR_MAX
  end

  struct MessageBoxColorScheme
    color : MessageColor[MessageBoxColorType::MESSAGEBOX_COLOR_MAX]
  end

  struct MessageBoxData
    flags : UInt32
    window : Window
    title : Pointer(Char)
    message : Pointer(Char)

    numbuttons : Int32
    buttons : Pointer(MessageBoxData)

    colorScheme : Pointer(MessageBoxColorScheme)
  end

  fun show_message_box = SDL_ShowMessageBox(messageboxdata : Pointer(MessageBoxData), buttonid : Pointer(Int32)) : Int32
  fun show_simple_message_box = SDL_ShowSimpleMessageBox(flags : UInt32, title : Pointer(UInt8), message : Pointer(UInt8), window : Pointer(Window)) : Int32
end
