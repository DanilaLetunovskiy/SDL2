module SDL2.loadso;


extern(C) @nogc nothrow:


void* SDL_LoadObject(const(char)*);
void* SDL_LoadFunction(void*, const(char*));
void SDL_UnloadObject(void*);
