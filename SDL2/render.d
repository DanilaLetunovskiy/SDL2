module SDL2.render;


import SDL2.video;
import SDL2.surface;
import SDL2.blendmode;
import SDL2.rect;



extern(C) @nogc nothrow:


int SDL_GetNumRenderDrivers();
int SDL_GetRenderDriverInfo(int, SDL_RendererInfo*);
int SDL_CreateWindowAndRenderer(int, int, uint, SDL_Window**, SDL_Renderer**);
SDL_Renderer* SDL_CreateRenderer(SDL_Window*, int, uint);
SDL_Renderer* SDL_CreateSoftwareRenderer(SDL_Surface*);
SDL_Renderer* SDL_GetRenderer(SDL_Window*);
int SDL_GetRendererInfo(SDL_Renderer*, SDL_RendererInfo*);
int SDL_GetRendererOutputSize(SDL_Renderer*, int*, int*);
SDL_Texture* SDL_CreateTexture(SDL_Renderer*, uint, int, int, int);
SDL_Texture* SDL_CreateTextureFromSurface(SDL_Renderer*, SDL_Surface*);
int SDL_QueryTexture(SDL_Texture*, uint*, int*, int*, int*);
int SDL_SetTextureColorMod(SDL_Texture*, ubyte, ubyte, ubyte);
int SDL_GetTextureColorMod(SDL_Texture*, ubyte*, ubyte*, ubyte*);
int SDL_SetTextureAlphaMod(SDL_Texture*, ubyte);
int SDL_GetTextureAlphaMod(SDL_Texture*, ubyte*);
int SDL_SetTextureBlendMode(SDL_Texture*, SDL_BlendMode);
int SDL_GetTextureBlendMode(SDL_Texture*, SDL_BlendMode*);
int SDL_UpdateTexture(SDL_Texture*, const(SDL_Rect)*, const(void)*, int);
int SDL_UpdateYUVTexture(SDL_Texture*, const(SDL_Rect)*, const(ubyte)*, int, const(ubyte)*, int, const(ubyte)*, int);
int SDL_LockTexture(SDL_Texture*, const(SDL_Rect)*, void**, int*);
int SDL_UnlockTexture(SDL_Texture*);
bool SDL_RenderTargetSupported(SDL_Renderer*);
int SDL_SetRenderTarget(SDL_Renderer*, SDL_Texture*);
SDL_Texture* SDL_GetRenderTarget(SDL_Renderer*);
int SDL_RenderSetClipRect(SDL_Renderer*, const(SDL_Rect)*);
void SDL_RenderGetClipRect(SDL_Renderer* renderer, SDL_Rect*);
int SDL_RenderSetLogicalSize(SDL_Renderer*, int, int);
void SDL_RenderGetLogicalSize(SDL_Renderer*, int*, int*);
int SDL_RenderSetViewport(SDL_Renderer*, const(SDL_Rect)*);
void SDL_RenderGetViewport(SDL_Renderer*, SDL_Rect*);
bool SDL_RenderIsClipEnabled(SDL_Renderer*);
int SDL_RenderSetScale(SDL_Renderer*, float, float);
int SDL_RenderGetScale(SDL_Renderer*, float*, float*);
int SDL_SetRenderDrawColor(SDL_Renderer*, ubyte, ubyte, ubyte, ubyte);
int SDL_GetRenderDrawColor(SDL_Renderer*, ubyte*, ubyte*, ubyte*, ubyte*);
int SDL_SetRenderDrawBlendMode(SDL_Renderer*, SDL_BlendMode);
int SDL_GetRenderDrawBlendMode(SDL_Renderer*, SDL_BlendMode*);
int SDL_RenderClear(SDL_Renderer*);
int SDL_RenderDrawPoint(SDL_Renderer*, int, int);
int SDL_RenderDrawPoints(SDL_Renderer*, const(SDL_Point)*, int);
int SDL_RenderDrawLine(SDL_Renderer*, int, int, int, int);
int SDL_RenderDrawLines(SDL_Renderer*, const(SDL_Point)*, int);
int SDL_RenderDrawRect(SDL_Renderer*, const(SDL_Rect)*);
int SDL_RenderDrawRects(SDL_Renderer*, const(SDL_Rect)*, int);
int SDL_RenderFillRect(SDL_Renderer*, const(SDL_Rect)*);
int SDL_RenderFillRects(SDL_Renderer*, const(SDL_Rect)*, int);
int SDL_RenderCopy(SDL_Renderer*, SDL_Texture*, const(SDL_Rect)*, const(SDL_Rect*));
int SDL_RenderCopyEx(SDL_Renderer*, SDL_Texture*, const(SDL_Rect)*, const(SDL_Rect)*, const(double), const(SDL_Point)*, const(SDL_RendererFlip));
int SDL_RenderReadPixels(SDL_Renderer*, const(SDL_Rect)*, uint, void*, int);
void SDL_RenderPresent(SDL_Renderer*);
void SDL_DestroyTexture(SDL_Texture*);
void SDL_DestroyRenderer(SDL_Renderer*);
int SDL_GL_BindTexture(SDL_Texture*, float*, float*);
int SDL_GL_UnbindTexture(SDL_Texture*);


alias SDL_RendererFlags = uint;
enum : uint {
	SDL_RENDERER_SOFTWARE = 0x00000001,
	SDL_RENDERER_ACCELERATED = 0x00000002,
	SDL_RENDERER_PRESENTVSYNC = 0x00000004,
	SDL_RENDERER_TARGETTEXTURE = 0x00000008,
}

struct SDL_RendererInfo {
	const( char )* name;
	uint flags;
	uint num_texture_formats;
	uint[16] texture_formats;
	int max_texture_width;
	int max_texture_height;
}

alias SDL_TextureAccess = int;
enum {
	SDL_TEXTUREACCESS_STATIC,
	SDL_TEXTUREACCESS_STREAMING,
	SDL_TEXTUREACCESS_TARGET,
}

alias SDL_TextureModulate = int;
enum {
	SDL_TEXTUREMODULATE_NONE = 0x00000000,
	SDL_TEXTUREMODULATE_COLOR = 0x00000001,
	SDL_TEXTUREMODULATE_ALPHA = 0x00000002
}

alias SDL_RendererFlip = int;
enum {
	SDL_FLIP_NONE = 0x00000000,
	SDL_FLIP_HORIZONTAL = 0x00000001,
	SDL_FLIP_VERTICAL = 0x00000002,
}

struct SDL_Renderer;
struct SDL_Texture;
