module SDL2.version_;


extern(C) @nogc nothrow:


void SDL_GetVersion(SDL_version*);
const(char)* SDL_GetRevision();
int SDL_GetRevisionNumber();


struct SDL_version {
	ubyte major;
	ubyte minor;
	ubyte patch;
}

enum : ubyte {
	SDL_MAJOR_VERSION = 2,
	SDL_MINOR_VERSION = 0,
	SDL_PATCHLEVEL = 4,
}

void SDL_VERSION(SDL_version* x){
	x.major = SDL_MAJOR_VERSION;
	x.minor = SDL_MINOR_VERSION;
	x.patch = SDL_PATCHLEVEL;
}


uint SDL_VERSIONNUM(ubyte X, ubyte Y, ubyte Z){
	return X*1000 + Y*100 + Z;
}

uint SDL_COMPILEDVERSION(){
	return SDL_VERSIONNUM( SDL_MAJOR_VERSION, SDL_MINOR_VERSION, SDL_PATCHLEVEL );
}

bool SDL_VERSION_ATLEAST(ubyte X, ubyte Y, ubyte Z){
	return SDL_COMPILEDVERSION() >= SDL_VERSIONNUM(X, Y, Z);
}




