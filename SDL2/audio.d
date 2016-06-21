module SDL2.audio;

import SDL2.rwops;

extern(C) @nogc nothrow:


int SDL_GetNumAudioDrivers();
const(char)* SDL_GetAudioDriver(int);
int SDL_AudioInit(const(char)*);
void SDL_AudioQuit();
const(char)* SDL_GetCurrentAudioDriver();
int SDL_OpenAudio(SDL_AudioSpec*, SDL_AudioSpec*);
int SDL_GetNumAudioDevices(int);
const(char)* SDL_GetAudioDeviceName(int, int);
SDL_AudioDeviceID SDL_OpenAudioDevice(const(char)*, int, const(SDL_AudioSpec)*, SDL_AudioSpec*, int);
SDL_AudioStatus SDL_GetAudioStatus();
SDL_AudioStatus SDL_GetAudioDeviceStatus(SDL_AudioDeviceID);
void SDL_PauseAudio(int);
void SDL_PauseAudioDevice(SDL_AudioDeviceID, int);
SDL_AudioSpec* SDL_LoadWAV_RW(SDL_RWops*, int, SDL_AudioSpec*, ubyte**, uint*);
void SDL_FreeWAV(ubyte*);
int SDL_BuildAudioCVT(SDL_AudioCVT*, SDL_AudioFormat, ubyte, int, SDL_AudioFormat, ubyte, int);
int SDL_ConvertAudio(SDL_AudioCVT*);
void SDL_MixAudio(ubyte*, const(ubyte)*, uint, int);
void SDL_MixAudioFormat(ubyte*, const(ubyte)*, SDL_AudioFormat, uint, int);
int SDL_QueueAudio(SDL_AudioDeviceID, const (void)*, uint );
int SDL_GetQueuedAudioSize(SDL_AudioDeviceID);
int SDL_ClearQueuedAudio(SDL_AudioDeviceID);
void SDL_LockAudio();
void SDL_LockAudioDevice(SDL_AudioDeviceID);
void SDL_UnlockAudio();
void SDL_UnlockAudioDevice(SDL_AudioDeviceID);
void SDL_CloseAudio();
void SDL_CloseAudioDevice(SDL_AudioDeviceID);
int SDL_AudioDeviceConnected(SDL_AudioDeviceID);

alias ushort SDL_AudioFormat;
enum : ushort {
	SDL_AUDIO_MASK_BITSIZE = 0xFF,
	SDL_AUDIO_MASK_DATATYPE = 1<<8,
	SDL_AUDIO_MASK_ENDIAN = 1<<12,
	SDL_AUDIO_MASK_SIGNED = 1<<15,
	AUDIO_U8 = 0x0008,
	AUDIO_S8 = 0x8008,
	AUDIO_U16LSB = 0x0010,
	AUDIO_S16LSB = 0x8010,
	AUDIO_U16MSB = 0x1010,
	AUDIO_S16MSB = 0x9010,
	AUDIO_U16 = AUDIO_U16LSB,
	AUDIO_S16 = AUDIO_S16LSB,
	AUDIO_S32LSB = 0x8020,
	AUDIO_S32MSB = 0x9020,
	AUDIO_S32 = AUDIO_S32LSB,
	AUDIO_F32LSB = 0x8120,
	AUDIO_F32MSB = 0x9120,
	AUDIO_F32 = AUDIO_F32LSB,
}


int SDL_AUDIO_BITSIZE(SDL_AudioFormat x){ return x & SDL_AUDIO_MASK_BITSIZE; }
int SDL_AUDIO_ISFLOAT(SDL_AudioFormat x){ return x & SDL_AUDIO_MASK_DATATYPE; }
int SDL_AUDIO_ISBIGENDIAN(SDL_AudioFormat x){ return x & SDL_AUDIO_MASK_ENDIAN; }
int SDL_AUDIO_ISSIGNED(SDL_AudioFormat x){ return x & SDL_AUDIO_MASK_SIGNED; }
int SDL_AUDIO_ISINT(SDL_AudioFormat x){ return !SDL_AUDIO_ISFLOAT(x); }
int SDL_AUDIO_ISLITTLEENDIAN(SDL_AudioFormat x){ return !SDL_AUDIO_ISBIGENDIAN(x); }
int SDL_AUDIO_ISUNSIGNED(SDL_AudioFormat x){ return !SDL_AUDIO_ISSIGNED(x); }

version(LittleEndian){
	alias AUDIO_U16LSB AUDIO_U16SYS;
	alias AUDIO_S16LSB AUDIO_S16SYS;
	alias AUDIO_S32LSB AUDIO_S32SYS;
	alias AUDIO_F32LSB AUDIO_F32SYS;
}else{
	alias AUDIO_U16MSB AUDIO_U16SYS;
	alias AUDIO_S16MSB AUDIO_S16SYS;
	alias AUDIO_S32MSB AUDIO_S32SYS;
	alias AUDIO_F32MSB AUDIO_F32SYS;
}

enum {
	SDL_AUDIO_ALLOW_FREQUENCY_CHANGE = 0x00000001,
	SDL_AUDIO_ALLOW_FORMAT_CHANGE = 0x00000002,
	SDL_AUDIO_ALLOW_CHANNELS_CHANGE = 0x00000004,
	SDL_AUDIO_ALLOW_ANY_CHANGE = (SDL_AUDIO_ALLOW_FREQUENCY_CHANGE|SDL_AUDIO_ALLOW_FORMAT_CHANGE|SDL_AUDIO_ALLOW_CHANNELS_CHANGE),
}

alias SDL_AudioCallback = void function(void* userdata, ubyte* stream, int len);
struct SDL_AudioSpec {
	int freq;
	SDL_AudioFormat format;
	ubyte channels;
	ubyte silence;
	ushort samples;
	ushort padding;
	uint size;
	SDL_AudioCallback callback;
	void* userdata;
}

alias SDL_AudioFilter = void function(SDL_AudioCVT* cvt, SDL_AudioFormat format);
struct SDL_AudioCVT {
	int needed;
	SDL_AudioFormat src_format;
	SDL_AudioFormat dst_format;
	double rate_incr;
	ubyte* buf;
	int len;
	int len_cvt;
	int len_mult;
	double len_ratio;
	SDL_AudioFilter[10] filters;
	int filter_index;
}

alias uint SDL_AudioDeviceID;

alias SDL_AudioStatus = int;
enum {
	SDL_AUDIO_STOPPED = 0,
	SDL_AUDIO_PLAYING,
	SDL_AUDIO_PAUSED,
}

enum SDL_MIX_MAXVOLUME = 128;

SDL_AudioSpec* SDL_LoadWAV(const(char)* file, SDL_AudioSpec* spec, ubyte** audio_buf, uint* len) {
	return SDL_LoadWAV_RW(SDL_RWFromFile(file, "rb"), 1, spec, audio_buf, len);
}
