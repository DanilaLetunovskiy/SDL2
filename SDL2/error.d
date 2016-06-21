module SDL2.error;


extern(C) @nogc nothrow:


void SDL_SetError(const(char)*, ...);
const(char)* SDL_GetError();
void SDL_ClearError();
