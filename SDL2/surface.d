module SDL2.surface;

import SDL2.pixels;
import SDL2.rwops;
import SDL2.blendmode;
import SDL2.rect;

extern(C) @nogc nothrow:


SDL_Surface* SDL_CreateRGBSurface(uint, int, int, int, uint, uint, uint, uint);
SDL_Surface* SDL_CreateRGBSurfaceFrom(void*, int, int, int, int, uint, uint, uint, uint);
void SDL_FreeSurface(SDL_Surface*);
int SDL_SetSurfacePalette(SDL_Surface*, SDL_Palette*);
int SDL_LockSurface(SDL_Surface*);
int SDL_UnlockSurface(SDL_Surface*);
SDL_Surface* SDL_LoadBMP_RW(SDL_RWops*, int);
int SDL_SaveBMP_RW(SDL_Surface*, SDL_RWops*, int);
int SDL_SetSurfaceRLE(SDL_Surface*, int);
int SDL_SetColorKey(SDL_Surface*, int, uint);
int SDL_GetColorKey(SDL_Surface*, uint*);
int SDL_SetSurfaceColorMod(SDL_Surface*, ubyte, ubyte, ubyte);
int SDL_GetSurfaceColorMod(SDL_Surface*, ubyte*, ubyte*, ubyte*);
int SDL_SetSurfaceAlphaMod(SDL_Surface*, ubyte);
int SDL_GetSurfaceAlphaMod(SDL_Surface*, ubyte*);
int SDL_SetSurfaceBlendMode(SDL_Surface*, SDL_BlendMode);
int SDL_GetSurfaceBlendMode(SDL_Surface*, SDL_BlendMode*);
bool SDL_SetClipRect(SDL_Surface*, const(SDL_Rect)*);
void SDL_GetClipRect(SDL_Surface*, SDL_Rect*);
SDL_Surface* SDL_ConvertSurface(SDL_Surface*, const(SDL_PixelFormat)*, uint);
SDL_Surface* SDL_ConvertSurfaceFormat(SDL_Surface*, uint, uint);
int SDL_ConvertPixels(int, int, uint, const(void)*, int, uint, void*, int);
int SDL_FillRect(SDL_Surface*, const(SDL_Rect)*, uint);
int SDL_FillRects(SDL_Surface*, const(SDL_Rect)*, int, uint);
int SDL_UpperBlit(SDL_Surface*, const(SDL_Rect)*, SDL_Surface*, SDL_Rect*);
int SDL_LowerBlit(SDL_Surface*, SDL_Rect*, SDL_Surface*, SDL_Rect*);
int SDL_SoftStretch(SDL_Surface*, const(SDL_Rect)*, SDL_Surface*, const(SDL_Rect)*);
int SDL_UpperBlitScaled(SDL_Surface*, const(SDL_Rect)*, SDL_Surface*, SDL_Rect*);
int SDL_LowerBlitScaled(SDL_Surface*, SDL_Rect*, SDL_Surface*, SDL_Rect*);
alias SDL_BlitSurface = SDL_UpperBlit;
alias SDL_BlitScaled = SDL_UpperBlitScaled;


enum {
	SDL_SWSURFACE = 0,
	SDL_PREALLOC = 0x00000001,
	SDL_RLEACCEL = 0x00000002,
	SDL_DONTFREE = 0x00000004,
}

@nogc nothrow bool SDL_MUSTLOCK( const( SDL_Surface )* S ) { return ( S.flags & SDL_RLEACCEL ) != 0; }

struct SDL_BlitMap;
struct SDL_Surface {
	uint flags;
	SDL_PixelFormat* format;
	int w, h;
	int pitch;
	void* pixels;
	void* userdata;
	int locked;
	void* lock_data;
	SDL_Rect clip_rect;
	SDL_BlitMap* map;
	int refcount;
}

alias SDL_blit = int function( SDL_Surface* src, SDL_Rect* srcrect, SDL_Surface* dst, SDL_Rect* dstrect );


SDL_Surface* SDL_LoadBMP(const(char)* file) {
	return SDL_LoadBMP_RW(SDL_RWFromFile(file, "rb"), 1);
}
int SDL_SaveBMP(SDL_Surface* surface, const(char)* file) {
	return SDL_SaveBMP_RW(surface, SDL_RWFromFile(file, "wb"), 1);
}
