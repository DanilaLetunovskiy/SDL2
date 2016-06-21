module SDL2.cpuinfo;


extern(C) @nogc nothrow:


int SDL_GetCPUCount();
int SDL_GetCPUCacheLineSize();
bool SDL_HasRDTSC();
bool SDL_HasAltiVec();
bool SDL_HasMMX();
bool SDL_Has3DNow();
bool SDL_HasSSE();
bool SDL_HasSSE2();
bool SDL_HasSSE3();
bool SDL_HasSSE41();
bool SDL_HasSSE42();
bool SDL_HasAVX();
bool SDL_HasAVX2();
int SDL_GetSystemRAM();


enum  SDL_CACHELINE_SIZE = 128;
