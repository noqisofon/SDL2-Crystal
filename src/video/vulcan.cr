@[Link("SDL2")]
lib LibSDL2
  alias VkInstance = Pointer(Void)
  alias VkSurfaceKHR = Pointer(Void)

  alias VulkanInstance = VkInstance
  alias VulkanSurface = VkSurfaceKHR

  fun vulkan_load_library = SDL_Vulkan_LoadLibrary(path : Pointer(Char)) : Int32
end
