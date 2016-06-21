module SDL2.messagebox;

import SDL2.video;

extern(C) @nogc nothrow:


int SDL_ShowMessageBox(const(SDL_MessageBoxData)*, int*);
int SDL_ShowSimpleMessageBox(uint, const(char)*, const(char)*, SDL_Window*);


alias SDL_MessageBoxFlags = int;
enum {
	SDL_MESSAGEBOX_ERROR = 0x00000010,
	SDL_MESSAGEBOX_WARNING = 0x00000020,
	SDL_MESSAGEBOX_INFORMATION = 0x00000040,
}

alias SDL_MessageBoxButtonFlags = int;
enum {
	SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT = 0x00000001,
	SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = 0x00000002,
}

struct SDL_MessageBoxButtonData {
	uint flags;
	int buttonid;
	const( char )* text;
}

struct SDL_MessageBoxColor {
	ubyte r, g, b;
}

alias SDL_MessageBoxColorType = int;
enum {
	SDL_MESSAGEBOX_COLOR_BACKGROUND,
	SDL_MESSAGEBOX_COLOR_TEXT,
	SDL_MESSAGEBOX_COLOR_BUTTON_BORDER,
	SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND,
	SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED,
	SDL_MESSAGEBOX_COLOR_MAX,
}

struct SDL_MessageBoxColorScheme {
	SDL_MessageBoxColor[SDL_MESSAGEBOX_COLOR_MAX] colors;
}

struct SDL_MessageBoxData {
	uint flags;
	SDL_Window* window;
	const( char )* title;
	const( char )* message;
	int numbuttons;
	const( SDL_MessageBoxButtonData )* buttons;
	const( SDL_MessageBoxColorScheme )* colorScheme;
}
