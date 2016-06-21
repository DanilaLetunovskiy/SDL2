module SDL2.timer;


extern(C) @nogc nothrow:


uint SDL_GetTicks();
ulong SDL_GetPerformanceCounter();
ulong SDL_GetPerformanceFrequency();
void SDL_Delay(uint);
SDL_TimerID SDL_AddTimer(uint, SDL_TimerCallback, void*);
bool SDL_RemoveTimer(SDL_TimerID);


extern(C) nothrow alias SDL_TimerCallback = uint function( uint interval, void* param );
alias SDL_TimerID = int;

bool SDL_TICKS_PASSED( uint A, uint B ) { return cast(int)(B - A) <= 0; }
