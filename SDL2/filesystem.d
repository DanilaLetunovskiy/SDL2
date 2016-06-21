module SDL2.filesystem;


extern(C) @nogc nothrow:


char* SDL_GetBasePath();
char* SDL_GetPrefPath(const( char)* org, const(char)* app);
