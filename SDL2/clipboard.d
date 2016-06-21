module SDL2.clipboard;


extern(C) @nogc nothrow:


int SDL_SetClipboardText(const(char)*);
char* SDL_GetClipboardText();
bool SDL_HasClipboardText();

