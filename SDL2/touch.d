module SDL2.touch;


extern(C) @nogc nothrow:


int SDL_GetNumTouchDevices();
SDL_TouchID SDL_GetTouchDevice(int);
int SDL_GetNumTouchFingers(SDL_TouchID);
SDL_Finger* SDL_GetTouchFinger(SDL_TouchID, int);



alias SDL_TouchID = long;
alias SDL_FingerID = long;

struct SDL_Finger {
	SDL_FingerID id;
	float x;
	float y;
	float pressure;
}

enum SDL_TOUCH_MOUSEID = cast( uint )-1;

