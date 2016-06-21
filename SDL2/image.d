module SDL2.image;

import SDL2.error;
import SDL2.version_;
import SDL2.rwops;
import SDL2.surface;
import SDL2.image;
import SDL2.render;



extern(C) @nogc nothrow:

int IMG_Init(int);
int IMG_Quit();
const(SDL_version)* IMG_Linked_Version();
SDL_Surface* IMG_LoadTyped_RW(SDL_RWops*, int, const(char)*);
SDL_Surface* IMG_Load(const(char)*);
SDL_Surface* IMG_Load_RW(SDL_RWops*, int);

SDL_Texture* IMG_LoadTexture(SDL_Renderer*, const(char)*);
SDL_Texture* IMG_LoadTexture_RW(SDL_Renderer*, SDL_RWops*, int);
SDL_Texture* IMG_LoadTextureTyped_RW(SDL_Renderer*, SDL_RWops*, int, const(char)*);

int IMG_isICO(SDL_RWops*);
int IMG_isCUR(SDL_RWops*);
int IMG_isBMP(SDL_RWops*);
int IMG_isGIF(SDL_RWops*);
int IMG_isJPG(SDL_RWops*);
int IMG_isLBM(SDL_RWops*);
int IMG_isPCX(SDL_RWops*);
int IMG_isPNG(SDL_RWops*);
int IMG_isPNM(SDL_RWops*);
int IMG_isTIF(SDL_RWops*);
int IMG_isXCF(SDL_RWops*);
int IMG_isXPM(SDL_RWops*);
int IMG_isXV(SDL_RWops*);
int IMG_isWEBP(SDL_RWops*);

SDL_Surface* IMG_LoadICO_RW(SDL_RWops*);
SDL_Surface* IMG_LoadCUR_RW(SDL_RWops*);
SDL_Surface* IMG_LoadBMP_RW(SDL_RWops*);
SDL_Surface* IMG_LoadGIF_RW(SDL_RWops*);
SDL_Surface* IMG_LoadJPG_RW(SDL_RWops*);
SDL_Surface* IMG_LoadLBM_RW(SDL_RWops*);
SDL_Surface* IMG_LoadPCX_RW(SDL_RWops*);
SDL_Surface* IMG_LoadPNG_RW(SDL_RWops*);
SDL_Surface* IMG_LoadPNM_RW(SDL_RWops*);
SDL_Surface* IMG_LoadTGA_RW(SDL_RWops*);
SDL_Surface* IMG_LoadTIF_RW(SDL_RWops*);
SDL_Surface* IMG_LoadXCF_RW(SDL_RWops*);
SDL_Surface* IMG_LoadXPM_RW(SDL_RWops*);
SDL_Surface* IMG_LoadXV_RW(SDL_RWops*);
SDL_Surface* IMG_LoadWEBP_RW(SDL_RWops*);

SDL_Surface* IMG_ReadXPMFromArray(char**);

int IMG_SavePNG(SDL_Surface*, const(char)*);
int IMG_SavePNG_RW(SDL_Surface*, SDL_RWops*, int);







alias IMG_SetError = SDL_SetError;
alias IMG_GetError = SDL_GetError;

enum : ubyte {
	SDL_IMAGE_MAJOR_VERSION = 2,
	SDL_IMAGE_MINOR_VERSION = 0,
	SDL_IMAGE_PATCHLEVEL    = 0,
}

@nogc nothrow void SDL_IMAGE_VERSION(SDL_version* X) {
	X.major = SDL_IMAGE_MAJOR_VERSION;
	X.minor = SDL_IMAGE_MINOR_VERSION;
	X.patch = SDL_IMAGE_PATCHLEVEL;
}

enum {
	IMG_INIT_JPG  = 0x00000001,
	IMG_INIT_PNG  = 0x00000002,
	IMG_INIT_TIF  = 0x00000004,
	IMG_INIT_WEBP = 0x00000008,
}


