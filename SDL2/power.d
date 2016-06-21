module SDL2.power;


extern(C) @nogc nothrow:


SDL_PowerState SDL_GetPowerInfo(int*, int*);


alias SDL_PowerState = int;
enum {
	SDL_POWERSTATE_UNKNOWN,
	SDL_POWERSTATE_ON_BATTERY,
	SDL_POWERSTATE_NO_BATTERY,
	SDL_POWERSTATE_CHARGING,
	SDL_POWERSTATE_CHARGED
}
