module SDL2.events;

import SDL2.keyboard;
import SDL2.joystick;
import SDL2.touch;
import SDL2.gesture;
import SDL2.syswm;

extern(C) @nogc nothrow:


void SDL_PumpEvents();
int SDL_PeepEvents(SDL_Event*, int, SDL_eventaction, uint, uint);
bool SDL_HasEvent(uint);
bool SDL_HasEvents(uint, uint);
void SDL_FlushEvent(uint);
void SDL_FlushEvents(uint, uint);
int SDL_PollEvent(SDL_Event*);
int SDL_WaitEvent(SDL_Event*);
int SDL_WaitEventTimeout(SDL_Event*, int);
int SDL_PushEvent(SDL_Event*);
void SDL_SetEventFilter(SDL_EventFilter, void*);
void SDL_GetEventFilter(SDL_EventFilter*, void**);
void SDL_AddEventWatch(SDL_EventFilter, void*);
void SDL_DelEventWatch(SDL_EventFilter, void*);
void SDL_FilterEvents(SDL_EventFilter, void*);
ubyte SDL_EventState(uint, int);
uint SDL_RegisterEvents(int);



enum {
	SDL_RELEASED = 0,
	SDL_PRESSED = 1,
}

alias SDL_EventType = int;
enum {
	SDL_FIRSTEVENT = 0,
	SDL_QUIT = 0x100,
	SDL_APP_TERMINATING,
	SDL_APP_LOWMEMORY,
	SDL_APP_WILLENTERBACKGROUND,
	SDL_APP_DIDENTERBACKGROUND,
	SDL_APP_WILLENTERFOREGROUND,
	SDL_APP_DIDENTERFOREGROUND,
	SDL_WINDOWEVENT = 0x200,
	SDL_SYSWMEVENT,
	SDL_KEYDOWN = 0x300,
	SDL_KEYUP,
	SDL_TEXTEDITING,
	SDL_TEXTINPUT,
	SDL_KEYMAPCHANGED,
	SDL_MOUSEMOTION = 0x400,
	SDL_MOUSEBUTTONDOWN,
	SDL_MOUSEBUTTONUP,
	SDL_MOUSEWHEEL,
	SDL_JOYAXISMOTION = 0x600,
	SDL_JOYBALLMOTION,
	SDL_JOYHATMOTION,
	SDL_JOYBUTTONDOWN,
	SDL_JOYBUTTONUP,
	SDL_JOYDEVICEADDED,
	SDL_JOYDEVICEREMOVED,
	SDL_CONTROLLERAXISMOTION = 0x650,
	SDL_CONTROLLERBUTTONDOWN,
	SDL_CONTROLLERBUTTONUP,
	SDL_CONTROLLERDEVICEADDED,
	SDL_CONTROLLERDEVICEREMOVED,
	SDL_CONTROLLERDEVICEREMAPPED,
	SDL_FINGERDOWN = 0x700,
	SDL_FINGERUP,
	SDL_FINGERMOTION,
	SDL_DOLLARGESTURE = 0x800,
	SDL_DOLLARRECORD,
	SDL_MULTIGESTURE,
	SDL_CLIPBOARDUPDATE = 0x900,
	SDL_DROPFILE = 0x1000,
	SDL_AUDIODEVICEADDED = 0x1100,
	SDL_AUDIODEVICEREMOVED,
	SDL_RENDER_TARGETS_RESET = 0x2000,
	SDL_RENDER_DEVICE_RESET = 0x2001,
	SDL_USEREVENT = 0x8000,
	SDL_LASTEVENT = 0xFFFF
}

struct SDL_CommonEvent {
	uint type;
	uint timestamp;
}

struct SDL_WindowEvent {
	uint type;
	uint timestamp;
	uint windowID;
	ubyte event;
	ubyte padding1;
	ubyte padding2;
	ubyte padding3;
	int data1;
	int data2;
}

struct SDL_KeyboardEvent {
	uint type;
	uint timestamp;
	uint windowID;
	ubyte state;
	ubyte repeat;
	ubyte padding2;
	ubyte padding3;
	SDL_Keysym keysym;
}

enum SDL_TEXTEDITINGEVENT_TEXT_SIZE = 32;
struct SDL_TextEditingEvent {
	uint type;
	uint timestamp;
	uint windowID;
	char[SDL_TEXTEDITINGEVENT_TEXT_SIZE] text;
	int start;
	int length;
}

enum SDL_TEXTINPUTEVENT_TEXT_SIZE = 32;
struct SDL_TextInputEvent {
	uint type;
	uint timestamp;
	uint windowID;
	char[SDL_TEXTINPUTEVENT_TEXT_SIZE] text;
}

struct SDL_MouseMotionEvent {
	uint type;
	uint timestamp;
	uint windowID;
	uint which;
	uint state;
	int x;
	int y;
	int xrel;
	int yrel;
}

struct SDL_MouseButtonEvent {
	uint type;
	uint timestamp;
	uint windowID;
	uint which;
	ubyte button;
	ubyte state;
	ubyte clicks;
	ubyte padding1;
	int x;
	int y;
}

struct SDL_MouseWheelEvent {
	uint type;
	uint timestamp;
	uint windowID;
	uint which;
	int x;
	int y;
	uint direction;
}

struct SDL_JoyAxisEvent {
	uint type;
	uint timestamp;
	SDL_JoystickID which;
	ubyte axis;
	ubyte padding1;
	ubyte padding2;
	ubyte padding3;
	short value;
	ushort padding4;
}

struct SDL_JoyBallEvent {
	uint type;
	uint timestamp;
	SDL_JoystickID which;
	ubyte ball;
	ubyte padding1;
	ubyte padding2;
	ubyte padding3;
	short xrel;
	short yrel;
}

struct SDL_JoyHatEvent {
	uint type;
	uint timestamp;
	SDL_JoystickID which;
	ubyte hat;
	ubyte value;
	ubyte padding1;
	ubyte padding2;
}

struct SDL_JoyButtonEvent {
	uint type;
	uint timestamp;
	SDL_JoystickID which;
	ubyte button;
	ubyte state;
	ubyte padding1;
	ubyte padding2;
}

struct SDL_JoyDeviceEvent {
	uint type;
	uint timestamp;
	int which;
}

struct SDL_ControllerAxisEvent {
	uint type;
	uint timestamp;
	SDL_JoystickID which;
	ubyte axis;
	ubyte padding1;
	ubyte padding2;
	ubyte padding3;
	short value;
	ushort padding4;
}

struct SDL_ControllerButtonEvent {
	uint type;
	uint timestamp;
	SDL_JoystickID which;
	ubyte button;
	ubyte state;
	ubyte padding1;
	ubyte padding2;
}

struct SDL_ControllerDeviceEvent {
	uint type;
	uint timestamp;
	int which;
}

struct SDL_AudioDeviceEvent {
	uint type;
	uint timestamp;
	uint which;
	ubyte iscapture;
	ubyte padding1;
	ubyte padding2;
	ubyte padding3;
}

struct SDL_TouchFingerEvent {
	uint type;
	uint timestamp;
	SDL_TouchID touchId;
	SDL_FingerID fingerId;
	float x;
	float y;
	float dx;
	float dy;
	float pressure;
}

struct SDL_MultiGestureEvent {
	uint type;
	uint timestamp;
	SDL_TouchID touchId;
	float dTheta;
	float dDist;
	float x;
	float y;
	ushort numFingers;
	ushort padding;
}

struct SDL_DollarGestureEvent {
	uint type;
	uint timestamp;
	SDL_TouchID touchId;
	SDL_GestureID gestureId;
	uint numFingers;
	float error;
	float x;
	float y;
}

struct SDL_DropEvent {
	uint type;
	uint timestamp;
	char* file;
}

struct SDL_QuitEvent {
	uint type;
	uint timestamp;
}

struct SDL_OSEvent {
	uint type;
	uint timestamp;
}

struct SDL_UserEvent {
	uint type;
	uint timestamp;
	uint windowID;
	int code;
	void* data1;
	void* data2;
}

struct SDL_SysWMEvent {
	uint type;
	uint timestamp;
	SDL_SysWMmsg* msg;
}

union SDL_Event {
	uint type;
	SDL_CommonEvent common;
	SDL_WindowEvent window;
	SDL_KeyboardEvent key;
	SDL_TextEditingEvent edit;
	SDL_TextInputEvent text;
	SDL_MouseMotionEvent motion;
	SDL_MouseButtonEvent button;
	SDL_MouseWheelEvent wheel;
	SDL_JoyAxisEvent jaxis;
	SDL_JoyBallEvent jball;
	SDL_JoyHatEvent jhat;
	SDL_JoyButtonEvent jbutton;
	SDL_JoyDeviceEvent jdevice;
	SDL_ControllerAxisEvent caxis;
	SDL_ControllerButtonEvent cbutton;
	SDL_ControllerDeviceEvent cdevice;
	SDL_AudioDeviceEvent adevice;
	SDL_QuitEvent quit;
	SDL_UserEvent user;
	SDL_SysWMEvent syswm;
	SDL_TouchFingerEvent tfinger;
	SDL_MultiGestureEvent mgesture;
	SDL_DollarGestureEvent dgesture;
	SDL_DropEvent drop;

	ubyte[56] padding;
}

alias SDL_eventaction = int;
enum {
	SDL_ADDEVENT,
	SDL_PEEKEVENT,
	SDL_GETEVENT
}

alias SDL_EventFilter = int function( void* userdata, SDL_Event* event );

enum {
	SDL_QUERY = -1,
	SDL_IGNORE = 0,
	SDL_DISABLE = 0,
	SDL_ENABLE = 1,
}

ubyte SDL_GetEventState(uint type) {
	return SDL_EventState(type, SDL_QUERY);
}
