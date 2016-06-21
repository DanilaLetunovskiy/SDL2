module SDL2.mixer;

import SDL2.version_;
import SDL2.error;
import SDL2.audio;
import SDL2.rwops;

extern (C) @nogc nothrow:

const(SDL_version)* Mix_Linked_Version();
int Mix_Init(int);
void Mix_Quit();
int Mix_OpenAudio (int, ushort, int, int);
int Mix_AllocateChannels(int);
int Mix_QuerySpec(int*, ushort*, int*);
Mix_Chunk* Mix_LoadWAV_RW(SDL_RWops*, int);
Mix_Music* Mix_LoadMUS(const(char)*);
Mix_Music* Mix_LoadMUS_RW(SDL_RWops*, int);
Mix_Music* Mix_LoadMUSType_RW(SDL_RWops*, Mix_MusicType, int);
Mix_Chunk* Mix_QuickLoad_WAV(ubyte*);
Mix_Chunk* Mix_QuickLoad_RAW(ubyte*, uint);
void Mix_FreeChunk(Mix_Chunk*);
void Mix_FreeMusic(Mix_Music*);
int Mix_GetNumChunkDecoders();
const(char)* Mix_GetChunkDecoder(int);
int Mix_GetNumMusicDecoders();
const(char)* Mix_GetMusicDecoder(int);
Mix_MusicType Mix_GetMusicType(const(Mix_Music)*);
void Mix_SetPostMix(void function(void*, ubyte*, int), void*);
void Mix_HookMusic(void function(void*, ubyte*, int), void*);
void Mix_HookMusicFinished(void function());
void* Mix_GetMusicHookData();
void Mix_ChannelFinished(void function(int channel));
int Mix_RegisterEffect(int, Mix_EffectFunc_t, Mix_EffectDone_t, void*);
int Mix_UnregisterEffect(int, Mix_EffectFunc_t);
int Mix_UnregisterAllEffects(int);
int Mix_SetPanning(int, ubyte, ubyte);
int Mix_SetPosition(int, short, ubyte);
int Mix_SetDistance(int, ubyte);
// int Mix_SetReverb(int, ubyte);
int Mix_SetReverseStereo(int, int);
int Mix_ReserveChannels(int);
int Mix_GroupChannel(int, int);
int Mix_GroupChannels(int, int, int);
int Mix_GroupAvailable(int);
int Mix_GroupCount(int);
int Mix_GroupOldest(int);
int Mix_GroupNewer(int);
int Mix_PlayChannelTimed(int, Mix_Chunk*, int, int);
int Mix_PlayMusic(Mix_Music*, int);
int Mix_FadeInMusic(Mix_Music*, int, int);
int Mix_FadeInMusicPos(Mix_Music*, int, int, double);
int Mix_FadeInChannelTimed(int, Mix_Chunk*, int, int, int);
int Mix_Volume(int, int);
int Mix_VolumeChunk(Mix_Chunk*, int);
int Mix_VolumeMusic(int);
int Mix_HaltChannel(int);
int Mix_HaltGroup(int);
int Mix_HaltMusic();
int Mix_ExpireChannel(int, int);
int Mix_FadeOutChannel(int, int);
int Mix_FadeOutGroup(int, int);
int Mix_FadeOutMusic(int);
Mix_Fading Mix_FadingMusic();
Mix_Fading Mix_FadingChannel(int);
void Mix_Pause(int);
void Mix_Resume(int);
int Mix_Paused(int);
void Mix_PauseMusic();
void Mix_ResumeMusic();
void Mix_RewindMusic();
int Mix_PausedMusic();
int Mix_SetMusicPosition(double);
int Mix_Playing(int);
int Mix_PlayingMusic();
int Mix_SetMusicCMD(in char*);
int Mix_SetSynchroValue(int);
int Mix_GetSynchroValue();
Mix_Chunk* Mix_GetChunk(int);
void Mix_CloseAudio();





enum : ubyte {
	SDL_MIXER_MAJOR_VERSION = 2,
	SDL_MIXER_MINOR_VERSION = 0,
	SDL_MIXER_PATCHLEVEL    = 0,
}
alias MIX_MAJOR_VERSION = SDL_MIXER_MAJOR_VERSION;
alias MIX_MINOR_VERSION = SDL_MIXER_MINOR_VERSION;
alias MIX_PATCH_LEVEL = SDL_MIXER_PATCHLEVEL;

void SDL_MIXER_VERSION(SDL_version* X){
	X.major = SDL_MIXER_MAJOR_VERSION;
	X.minor = SDL_MIXER_MINOR_VERSION;
	X.patch = SDL_MIXER_PATCHLEVEL;
}
alias SDL_MIX_VERSION = SDL_MIXER_VERSION;

alias Mix_SetError = SDL_SetError;
alias Mix_GetError = SDL_GetError;

alias MIX_InitFlags = int;
enum : int {
	MIX_INIT_FLAC = 0x00000001,
	MIX_INIT_MOD = 0x00000002,
	MIX_INIT_MODPLUG = 0x00000004,
	MIX_INIT_MP3 = 0x00000008,
	MIX_INIT_OGG = 0x00000010,
	MIX_INIT_FLUIDSYNTH = 0x00000020,
}

enum {
	MIX_CHANNELS          = 8,
	MIX_DEFAULT_FREQUENCY = 22050,
	MIX_DEFAULT_CHANNELS  = 2,
	MIX_MAX_VOLUME        = 128,
	MIX_CHANNEL_POST      = -2,
}

version (LittleEndian) {
	enum MIX_DEFAULT_FORMAT = AUDIO_S16LSB;
} else {
	enum MIX_DEFAULT_FORMAT = AUDIO_S16MSB;
}

struct Mix_Chunk {
   int allocated;
   ubyte* abuf;
   uint alen;
   ubyte volume;
};

alias Mix_Fading = int;
enum : int {
   MIX_NO_FADING,
   MIX_FADING_OUT,
   MIX_FADING_IN
};

alias Mix_MusicType = int;
enum : int {
   MUS_NONE,
   MUS_CMD,
   MUS_WAV,
   MUS_MOD,
   MUS_MID,
   MUS_OGG,
   MUS_MP3,
   MUS_MP3_MAD,
   MUS_FLAC,
   MUS_MODPLUG,
};

struct Mix_Music;

string MIX_EFFECTSMAXSPEED = "MIX_EFFECTSMAXSPEED";


alias Mix_EffectFunc_t = void function(int chan, void* stream, int len, void* udata);
alias Mix_EffectDone_t = void function(int chan, void* udata);

/*
Mix_Chunk* Mix_LoadWAV(const(char)* file) {
	return Mix_LoadWAV_RW(SDL_RWFromFile(file, "rb"), 1);
}

int Mix_PlayChannel(int channel, Mix_Chunk* chunk, int loops) {
	return Mix_PlayChannelTimed(channel, chunk, loops, -1);
}

int Mix_FadeInChannel(int channel, Mix_Chunk* chunk, int loops, int ms) {
	return Mix_FadeInChannelTimed(channel, chunk, loops, ms, -1);
}
*/
