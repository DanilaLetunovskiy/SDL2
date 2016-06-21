module SDL2.sdl;


extern(C) @nogc nothrow:

int SDL_Init(uint);
int SDL_InitSubSystem(uint);
void SDL_QuitSubSystem(uint);
uint SDL_WasInit(uint);
void SDL_Quit();
void SDL_free(void* mem);

enum : uint {
	SDL_INIT_TIMER          = 0b0000_0000_0000_0001,
	SDL_INIT_AUDIO          = 0b0000_0000_0001_0000,
	SDL_INIT_VIDEO          = 0b0000_0000_0010_0000,
	SDL_INIT_JOYSTICK       = 0b0000_0010_0000_0000,
	SDL_INIT_HAPTIC         = 0b0001_0000_0000_0000,
	SDL_INIT_GAMECONTROLLER = 0b0010_0000_0000_0000,
	SDL_INIT_EVENTS         = 0b0100_0000_0000_0000,
	SDL_INIT_EVERYTHING     = 0b0111_0010_0011_0001,
	SDL_INIT_NOPARACHUTE    = 0b1_0000_0000_0000_0000_0000
}
