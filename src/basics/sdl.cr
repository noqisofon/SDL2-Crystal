@[Link("SDL2")]
lib LibSDL2
  INIT_TIMER          = 0x00000001_u32
  INIT_AUDIO          = 0x00000010_u32
  INIT_VIDEO          = 0x00000020_u32 # SDL_INIT_VIDEO implies SDL_INIT_EVENTS.
  INIT_JOYSTICK       = 0x00000200_u32 # SDL_INIT_JOYSTICK implies SDL_INIT_EVENTS.
  INIT_HAPTIC         = 0x00001000_u32
  INIT_GAMECONTROLLER = 0x00002000_u32 # SDL_INIT_GAMECONTROLLER implies SDL_INIT_JOYSTICK.
  INIT_EVENTS         = 0x00004000_u32
  INIT_SENSOR         = 0x00008000_u32
  INIT_NOPARACHUTE    = 0x00100000_u32 # compatibility; this flag is ignored.
  INIT_EVERYTHING     = INIT_TIMER | INIT_AUDIO | INIT_VIDEO | INIT_EVENTS | INIT_JOYSTICK | INIT_HAPTIC | INIT_GAMECONTROLLER | INIT_SENSOR

  type MainFunction = Int32, Pointer(Pointer(Char)) -> Int32

  fun init = SDL_Init(flags : UInt32) : Int32
  fun init_sub_system = SDL_InitSubSystem(flags : UInt32) : Int32
  fun quit = SDL_Quit : Void
  fun quit_sub_system = SDL_QuitSubSystem(flags : UInt32) : Void
  fun set_main_ready = SDL_SetMainReady : Void
  fun was_init = SDL_WasInit(flags : UInt32) : UInt32
  fun winRT_run_app = SDL_WinRTRunApp(mainFunction : MainFunction, reserved : Pointer(Void)) : Int32
end
