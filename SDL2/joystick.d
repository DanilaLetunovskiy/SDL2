module SDL2.joystick;


extern(C) @nogc nothrow:


int SDL_NumJoysticks();
const(char)* SDL_JoystickNameForIndex(int);
SDL_Joystick* SDL_JoystickOpen(int);
SDL_Joystick* SDL_JoystickFromInstanceID(SDL_JoystickID);
const(char)* SDL_JoystickName(SDL_Joystick*);
JoystickGUID SDL_JoystickGetDeviceGUID(int);
JoystickGUID SDL_JoystickGetGUID(SDL_Joystick*);
char* SDL_JoystickGetGUIDString(JoystickGUID);
JoystickGUID SDL_JoystickGetGUIDFromString(const(char)*);
bool SDL_JoystickGetAttached(SDL_Joystick*);
SDL_JoystickID SDL_JoystickInstanceID(SDL_Joystick*);
int SDL_JoystickNumAxes(SDL_Joystick*);
int SDL_JoystickNumBalls(SDL_Joystick*);
int SDL_JoystickNumHats(SDL_Joystick*);
int SDL_JoystickNumButtons(SDL_Joystick*);
void SDL_JoystickUpdate();
int SDL_JoystickEventState(int);
short SDL_JoystickGetAxis(SDL_Joystick*, int);
ubyte SDL_JoystickGetHat(SDL_Joystick*, int);
int SDL_JoystickGetBall(SDL_Joystick*, int, int*, int*);
ubyte SDL_JoystickGetButton(SDL_Joystick*, int);
void SDL_JoystickClose(SDL_Joystick*);
SDL_JoystickPowerLevel SDL_JoystickCurrentPowerLevel(SDL_Joystick*);



struct SDL_Joystick;

struct JoystickGUID {
	ubyte[16] data;
}

struct SDL_JoystickGUID {
	ubyte[16] data;
}

alias SDL_JoystickID = int;

alias SDL_JoystickPowerLevel = int;
enum {
	SDL_JOYSTICK_POWER_UNKNOWN = -1,
	SDL_JOYSTICK_POWER_EMPTY,
	SDL_JOYSTICK_POWER_LOW,
	SDL_JOYSTICK_POWER_MEDIUM,
	SDL_JOYSTICK_POWER_FULL,
	SDL_JOYSTICK_POWER_WIRED,
	SDL_JOYSTICK_POWER_MAX
}

enum : ubyte {
	SDL_HAT_CENTERED = 0x00,
	SDL_HAT_UP = 0x01,
	SDL_HAT_RIGHT = 0x02,
	SDL_HAT_DOWN = 0x04,
	SDL_HAT_LEFT = 0x08,
	SDL_HAT_RIGHTUP = ( SDL_HAT_RIGHT|SDL_HAT_UP ),
	SDL_HAT_RIGHTDOWN = ( SDL_HAT_RIGHT|SDL_HAT_DOWN ),
	SDL_HAT_LEFTUP = ( SDL_HAT_LEFT|SDL_HAT_UP ),
	SDL_HAT_LEFTDOWN = ( SDL_HAT_LEFT|SDL_HAT_DOWN ),
}
