module SDL2.log;


import core.stdc.stdarg;

extern(C) @nogc nothrow:


void SDL_LogSetAllPriority(SDL_LogPriority);
void SDL_LogSetPriority(int, SDL_LogPriority);
SDL_LogPriority SDL_LogGetPriority(int);
void SDL_LogResetPriorities();
void SDL_Log(const(char)*, ...);
void SDL_LogVerbose(int, const(char)*, ...);
void SDL_LogDebug(int, const(char)*, ...);
void SDL_LogInfo(int, const(char)*, ...);
void SDL_LogWarn(int, const(char)*, ...);
void SDL_LogError(int, const(char)*, ...);
void SDL_LogCritical(int, const(char)*, ...);
void SDL_LogMessage(int, SDL_LogPriority, const(char)*, ...);
void SDL_LogMessageV(int, SDL_LogPriority, const(char)*, va_list);
void SDL_LogGetOutputFunction(SDL_LogOutputFunction, void**);
void SDL_LogSetOutputFunction(SDL_LogOutputFunction, void*);


enum SDL_MAX_LOG_MESSAGE = 4096;

enum {
	SDL_LOG_CATEGORY_APPLICATION,
	SDL_LOG_CATEGORY_ERROR,
	SDL_LOG_CATEGORY_ASSERT,
	SDL_LOG_CATEGORY_SYSTEM,
	SDL_LOG_CATEGORY_AUDIO,
	SDL_LOG_CATEGORY_VIDEO,
	SDL_LOG_CATEGORY_RENDER,
	SDL_LOG_CATEGORY_INPUT,

	SDL_LOG_CATEGORY_RESERVED1,
	SDL_LOG_CATEGORY_RESERVED2,
	SDL_LOG_CATEGORY_RESERVED3,
	SDL_LOG_CATEGORY_RESERVED4,
	SDL_LOG_CATEGORY_RESERVED5,
	SDL_LOG_CATEGORY_RESERVED6,
	SDL_LOG_CATEGORY_RESERVED7,
	SDL_LOG_CATEGORY_RESERVED8,
	SDL_LOG_CATEGORY_RESERVED9,
	SDL_LOG_CATEGORY_RESERVED10,

	SDL_LOG_CATEGORY_CUSTOM
}

alias SDL_LogPriority = int;
enum {
	SDL_LOG_PRIORITY_VERBOSE = 1,
	SDL_LOG_PRIORITY_DEBUG,
	SDL_LOG_PRIORITY_INFO,
	SDL_LOG_PRIORITY_WARN,
	SDL_LOG_PRIORITY_ERROR,
	SDL_LOG_PRIORITY_CRITICAL,
	SDL_NUM_LOG_PRIORITIES
}

alias SDL_LogOutputFunction = void function( void*, int, SDL_LogPriority, const( char )* );
