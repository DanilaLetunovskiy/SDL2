module SDL2.shape;


import SDL2.video;
import SDL2.surface;
import SDL2.pixels;


extern(C) @nogc nothrow:


SDL_Window* SDL_CreateShapedWindow(const(char)*, uint, uint, uint, uint, uint);
bool SDL_IsShapedWindow(const(SDL_Window)*);
int SDL_SetWindowShape(SDL_Window*, SDL_Surface*, SDL_WindowShapeMode*);
int SDL_GetShapedWindowMode(SDL_Window*, SDL_WindowShapeMode*);



enum {
	SDL_NONSHAPEABLE_WINDOW = -1,
	SDL_INVALID_SHAPE_ARGUMENT = -2,
	SDL_WINDOW_LACKS_SHAPE = -3,
}

alias WindowShapeMode = int;
enum {
	ShapeModeDefault,
	ShapeModeBinarizeAlpha,
	ShapeModeReverseBinarizeAlpha,
	ShapeModeColorKey
}

@nogc nothrow bool SDL_SHAPEMODEALPHA( WindowShapeMode mode ) {
	return mode == ShapeModeDefault || mode == ShapeModeBinarizeAlpha || mode == ShapeModeReverseBinarizeAlpha;
}

union SDL_WindowShapeParams {
	ubyte binarizationCutoff;
	SDL_Color colorKey;
}

struct SDL_WindowShapeMode {
	WindowShapeMode mode;
	SDL_WindowShapeParams parameters;
}


