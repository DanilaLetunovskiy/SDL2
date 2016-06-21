module SDL2.keyboard;

import SDL2.video;
import SDL2.keycode;
import SDL2.scancode;
import SDL2.rect;

extern(C) @nogc nothrow:


SDL_Window* SDL_GetKeyboardFocus();
ubyte* SDL_GetKeyboardState(int*);
SDL_Keymod SDL_GetModState();
void SDL_SetModState(SDL_Keymod);
SDL_Keycode SDL_GetKeyFromScancode(SDL_Scancode);
SDL_Scancode SDL_GetScancodeFromKey(SDL_Keycode);
const(char)* SDL_GetScancodeName(SDL_Scancode);
SDL_Scancode SDL_GetScancodeFromName(const(char)*);
const(char)* SDL_GetKeyName(SDL_Keycode);
SDL_Keycode SDL_GetKeyFromName(const(char)*);
void SDL_StartTextInput();
bool SDL_IsTextInputActive();
void SDL_StopTextInput();
void SDL_SetTextInputRect(SDL_Rect*);
bool SDL_HasScreenKeyboardSupport();
bool SDL_IsScreenKeyboardShown(SDL_Window*);


struct SDL_Keysym {
	SDL_Scancode scancode;
	SDL_Keycode sym;
	ushort mod;
	uint unicode;
}
