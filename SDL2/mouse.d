module SDL2.mouse;

import SDL2.video;
import SDL2.surface;


extern(C) @nogc nothrow:


SDL_Window* SDL_GetMouseFocus();
uint SDL_GetMouseState(int*, int*);
uint SDL_GetGlobalMouseState(int*, int*);
uint SDL_GetRelativeMouseState(int*, int*);
void SDL_WarpMouseInWindow(SDL_Window*, int, int);
void SDL_WarpMouseGlobal(int, int);
int SDL_SetRelativeMouseMode(bool);
int SDL_CaptureMouse(bool);
bool SDL_GetRelativeMouseMode();
SDL_Cursor* SDL_CreateCursor(const(ubyte)*, const(ubyte)*, int, int, int, int);
SDL_Cursor* SDL_CreateColorCursor(SDL_Surface*, int, int);
SDL_Cursor* SDL_CreateSystemCursor(SDL_SystemCursor);
void SDL_SetCursor(SDL_Cursor*);
SDL_Cursor* SDL_GetCursor();
SDL_Cursor* SDL_GetDefaultCursor();
void SDL_FreeCursor(SDL_Cursor*);
int SDL_ShowCursor(int);



struct SDL_Cursor;

ubyte SDL_BUTTON(ubyte X){ return cast(ubyte)(1 << (X - 1)); }

alias SDL_SystemCursor = int;
enum {
	SDL_SYSTEM_CURSOR_ARROW,
	SDL_SYSTEM_CURSOR_IBEAM,
	SDL_SYSTEM_CURSOR_WAIT,
	SDL_SYSTEM_CURSOR_CROSSHAIR,
	SDL_SYSTEM_CURSOR_WAITARROW,
	SDL_SYSTEM_CURSOR_SIZENWSE,
	SDL_SYSTEM_CURSOR_SIZENESW,
	SDL_SYSTEM_CURSOR_SIZEWE,
	SDL_SYSTEM_CURSOR_SIZENS,
	SDL_SYSTEM_CURSOR_SIZEALL,
	SDL_SYSTEM_CURSOR_NO,
	SDL_SYSTEM_CURSOR_HAND,
	SDL_NUM_SYSTEM_CURSORS
}

alias SDL_MouseWheelDirection = int;
enum {
	SDL_MOUSEWHEEL_NORMAL,
	SDL_MOUSEWHEEL_FLIPPED
}

enum : ubyte {
	SDL_BUTTON_LEFT = 1,
	SDL_BUTTON_MIDDLE = 2,
	SDL_BUTTON_RIGHT = 3,
	SDL_BUTTON_X1 = 4,
	SDL_BUTTON_X2 = 5,
	SDL_BUTTON_LMASK = SDL_BUTTON(SDL_BUTTON_LEFT),
	SDL_BUTTON_MMASK = SDL_BUTTON(SDL_BUTTON_MIDDLE),
	SDL_BUTTON_RMASK = SDL_BUTTON(SDL_BUTTON_RIGHT),
	SDL_BUTTON_X1MASK = SDL_BUTTON(SDL_BUTTON_X1),
	SDL_BUTTON_X2MASK = SDL_BUTTON(SDL_BUTTON_X2),
}


