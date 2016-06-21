module SDL2.haptic;

import SDL2.joystick;

extern(C) @nogc nothrow:


int SDL_NumHaptics();
const(char)* SDL_HapticName(int);
SDL_Haptic* SDL_HapticOpen(int);
int SDL_HapticOpened(int);
int SDL_HapticIndex(SDL_Haptic*);
int SDL_MouseIsHaptic();
SDL_Haptic* SDL_HapticOpenFromMouse();
int SDL_JoystickIsHaptic(SDL_Joystick*);
SDL_Haptic* SDL_HapticOpenFromJoystick(SDL_Joystick*);
int SDL_HapticClose(SDL_Haptic*);
int SDL_HapticNumEffects(SDL_Haptic*);
int SDL_HapticNumEffectsPlaying(SDL_Haptic*);
uint SDL_HapticQuery(SDL_Haptic*);
int SDL_HapticNumAxes(SDL_Haptic*);
int SDL_HapticEffectSupported(SDL_Haptic*, SDL_HapticEffect*);
int SDL_HapticNewEffect(SDL_Haptic*, SDL_HapticEffect*);
int SDL_HapticUpdateEffect(SDL_Haptic*, int, SDL_HapticEffect*);
int SDL_HapticRunEffect(SDL_Haptic*, int, SDL_HapticEffect*);
int SDL_HapticStopEffect(SDL_Haptic*, int);
int SDL_HapticDestroyEffect(SDL_Haptic*, int);
int SDL_HapticGetEffectStatus(SDL_Haptic*, int);
int SDL_HapticSetGain(SDL_Haptic*, int);
int SDL_HapticSetAutocenter(SDL_Haptic*, int);
int SDL_HapticPause(SDL_Haptic*);
int SDL_HapticUnpause(SDL_Haptic*);
int SDL_HapticStopAll(SDL_Haptic*);
int SDL_HapticRumbleSupported(SDL_Haptic*);
int SDL_HapticRumbleInit(SDL_Haptic*);
int SDL_HapticRumblePlay(SDL_Haptic*, float, uint);
int SDL_HapticRumbleStop(SDL_Haptic*);


struct SDL_Haptic;

enum : ushort {
	SDL_HAPTIC_CONSTANT = 1<<0,
	SDL_HAPTIC_SINE = 1<<1,
	SDL_HAPTIC_LEFTRIGHT = 1<<2,
	SDL_HAPTIC_TRIANGLE = 1<<3,
	SDL_HAPTIC_SAWTOOTHUP = 1<<4,
	SDL_HAPTIC_SAWTOOTHDOWN = 1<<5,
	SDL_HAPTIC_RAMP = 1<<6,
	SDL_HAPTIC_SPRING = 1<<7,
	SDL_HAPTIC_DAMPER = 1<<8,
	SDL_HAPTIC_INERTIA = 1<<9,
	SDL_HAPTIC_FRICTION = 1<<10,
	SDL_HAPTIC_CUSTOM = 1<<11,
	SDL_HAPTIC_GAIN = 1<<12,
	SDL_HAPTIC_AUTOCENTER = 1<<13,
	SDL_HAPTIC_STATUS = 1<<14,
	SDL_HAPTIC_PAUSE = 1<<15,
	SDL_HAPTIC_POLAR = 0,
	SDL_HAPTIC_CARTESIAN = 1,
	SDL_HAPTIC_SPHERICAL = 2,
}

enum SDL_HAPTIC_INFINITY = 4294967295U;

struct SDL_HapticDirection {
	ubyte type;
	int[3] dir;
}

struct SDL_HapticConstant {
	ushort type;
	SDL_HapticDirection direction;
	uint length;
	ushort delay;
	ushort button;
	ushort interval;
	short level;
	ushort attack_length;
	ushort attack_level;
	ushort fade_length;
	ushort fade_level;
}

struct SDL_HapticPeriodic {
	ushort type;
	SDL_HapticDirection direction;
	uint length;
	uint delay;
	ushort button;
	ushort interval;
	ushort period;
	short magnitude;
	short offset;
	ushort phase;
	ushort attack_length;
	ushort attack_level;
	ushort fade_length;
	ushort fade_level;
}

struct SDL_HapticCondition {
	ushort type;
	SDL_HapticDirection direciton;
	uint length;
	ushort delay;
	ushort button;
	ushort interval;
	ushort[3] right_sat;
	ushort[3] left_sat;
	short[3] right_coeff;
	short[3] left_coeff;
	ushort[3] deadband;
	ushort[3] center;
}

struct SDL_HapticRamp {
	ushort type;
	SDL_HapticDirection direction;
	uint length;
	ushort delay;
	ushort button;
	ushort interval;
	short start;
	short end;
	ushort attack_length;
	ushort attack_level;
	ushort fade_length;
	ushort fade_level;
}

struct SDL_HapticLeftRight {
	ushort type;
	uint length;
	ushort large_magnitude;
	ushort small_magnitude;
}

struct SDL_HapticCustom {
	ushort type;
	SDL_HapticDirection direction;
	uint length;
	ushort delay;
	ushort button;
	ushort interval;
	ubyte channels;
	ushort period;
	ushort samples;
	ushort* data;
	ushort attack_length;
	ushort attack_level;
	ushort fade_length;
	ushort fade_level;
}

union SDL_HapticEffect {
	ushort type;
	SDL_HapticConstant constant;
	SDL_HapticPeriodic periodic;
	SDL_HapticCondition condition;
	SDL_HapticRamp ramp;
	SDL_HapticLeftRight leftright;
	SDL_HapticCustom custom;
}


