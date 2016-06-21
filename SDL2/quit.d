module SDL2.quit;

import SDL2.events;

bool SDL_QuitRequested() {
	SDL_PumpEvents();
	return SDL_PeepEvents(null, 0, SDL_PEEKEVENT, SDL_QUIT, SDL_QUIT) > 0;
}
