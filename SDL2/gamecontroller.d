module SDL2.gamecontroller;

import SDL2.rwops;
import SDL2.joystick;

extern(C) @nogc nothrow:


int SDL_GameControllerAddMappingsFromRW(SDL_RWops*, int);
int SDL_GameControllerAddMapping(const(char)*);
char* SDL_GameControllerMappingForGUID(SDL_JoystickGUID);
char* SDL_GameControllerMapping(SDL_GameController*);
bool SDL_IsGameController(int);
const(char)* SDL_GameControllerNameForIndex(int);
SDL_GameController* SDL_GameControllerOpen(int);
SDL_GameController* SDL_GameControllerFromInstanceID(SDL_JoystickID);
const(char)* SDL_GameControllerName(SDL_GameController*);
bool SDL_GameControllerGetAttached(SDL_GameController*);
SDL_Joystick* SDL_GameControllerGetJoystick(SDL_GameController*);
int SDL_GameControllerEventState(int);
void SDL_GameControllerUpdate();
SDL_GameControllerAxis SDL_GameControllerGetAxisFromString(const(char)*);
const(char)* SDL_GameControllerGetStringForAxis(SDL_GameControllerAxis);
SDL_GameControllerButtonBind SDL_GameControllerGetBindForAxis(SDL_GameController*, SDL_GameControllerAxis);
short SDL_GameControllerGetAxis(SDL_GameController*, SDL_GameControllerAxis);
SDL_GameControllerButton SDL_GameControllerGetButtonFromString(const(char*));
const(char)* SDL_GameControllerGetStringForButton(SDL_GameControllerButton);
SDL_GameControllerButtonBind SDL_GameControllerGetBindForButton(SDL_GameController*, SDL_GameControllerButton);
ubyte SDL_GameControllerGetButton(SDL_GameController*, SDL_GameControllerButton);
void SDL_GameControllerClose(SDL_GameController*);


struct SDL_GameController;
alias int SDL_GameControllerBindType;
enum {
	SDL_CONTROLLER_BINDTYPE_NONE = 0,
	SDL_CONTROLLER_BINDTYPE_BUTTON,
	SDL_CONTROLLER_BINDTYPE_AXIS,
	SDL_CONTROLLER_BINDTYPE_HAT,
}

struct SDL_GameControllerButtonBind {
	SDL_GameControllerBindType bindType;
	union value {
		int button;
		int axis;
		struct hat {
			int hat;
			int hat_mask;
		}
	}
	alias button = value.button;
	alias axis = value.axis;
	alias hat = value.hat;
}

alias SDL_GameControllerAxis = int;
enum {
	SDL_CONTROLLER_AXIS_INVALID = -1,
	SDL_CONTROLLER_AXIS_LEFTX,
	SDL_CONTROLLER_AXIS_LEFTY,
	SDL_CONTROLLER_AXIS_RIGHTX,
	SDL_CONTROLLER_AXIS_RIGHTY,
	SDL_CONTROLLER_AXIS_TRIGGERLEFT,
	SDL_CONTROLLER_AXIS_TRIGGERRIGHT,
	SDL_CONTROLLER_AXIS_MAX
}

alias SDL_GameControllerButton = int;
enum {
	SDL_CONTROLLER_BUTTON_INVALID = -1,
	SDL_CONTROLLER_BUTTON_A,
	SDL_CONTROLLER_BUTTON_B,
	SDL_CONTROLLER_BUTTON_X,
	SDL_CONTROLLER_BUTTON_Y,
	SDL_CONTROLLER_BUTTON_BACK,
	SDL_CONTROLLER_BUTTON_GUIDE,
	SDL_CONTROLLER_BUTTON_START,
	SDL_CONTROLLER_BUTTON_LEFTSTICK,
	SDL_CONTROLLER_BUTTON_RIGHTSTICK,
	SDL_CONTROLLER_BUTTON_LEFTSHOULDER,
	SDL_CONTROLLER_BUTTON_RIGHTSHOULDER,
	SDL_CONTROLLER_BUTTON_DPAD_UP,
	SDL_CONTROLLER_BUTTON_DPAD_DOWN,
	SDL_CONTROLLER_BUTTON_DPAD_LEFT,
	SDL_CONTROLLER_BUTTON_DPAD_RIGHT,
	SDL_CONTROLLER_BUTTON_MAX
}


int SDL_GameControllerAddMappingsFromFile(const(char)* file) {
	return SDL_GameControllerAddMappingsFromRW(SDL_RWFromFile(file, "rb"), 1);
}

