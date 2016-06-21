module SDL2.rwops;

import core.stdc.stdio;

extern(C) @nogc nothrow:


SDL_RWops* SDL_RWFromFile(const(char)*, const(char)*);
SDL_RWops* SDL_RWFromFP(FILE*, bool);
SDL_RWops* SDL_RWFromMem(void*, int);
SDL_RWops* SDL_RWFromConstMem(const(void)*, int);
SDL_RWops* SDL_AllocRW();
void SDL_FreeRW(SDL_RWops*);
ubyte SDL_ReadU8(SDL_RWops*);
ushort SDL_ReadLE16(SDL_RWops*);
ushort SDL_ReadBE16(SDL_RWops*);
uint SDL_ReadLE32(SDL_RWops*);
uint SDL_ReadBE32(SDL_RWops*);
ulong SDL_ReadLE64(SDL_RWops*);
ulong SDL_ReadBE64(SDL_RWops*);
size_t SDL_WriteU8(SDL_RWops*, ubyte);
size_t SDL_WriteLE16(SDL_RWops*, ushort);
size_t SDL_WriteBE16(SDL_RWops*, ushort);
size_t SDL_WriteLE32(SDL_RWops*, uint);
size_t SDL_WriteBE32(SDL_RWops*, uint);
size_t SDL_WriteLE64(SDL_RWops*, ulong);
size_t SDL_WriteBE64(SDL_RWops*, ulong);




enum {
	SDL_RWOPS_UNKNOWN,
	SDL_RWOPS_WINFILE,
	SDL_RWOPS_STDFILE,
	SDL_RWOPS_JNIFILE,
	SDL_RWOPS_MEMORY,
	SDL_RWOPS_MEMORY_RO
}

struct SDL_RWops {
	@nogc nothrow {
		long function(SDL_RWops*) size;
		long function(SDL_RWops*, long, int) seek;
		size_t function(SDL_RWops*, void*, size_t, size_t) read;
		size_t function(SDL_RWops*, const(void)*, size_t, size_t) write;
		int function(SDL_RWops*) close;
	}

	uint type;

	union Hidden {
		// version(Android)
		version(Windows) {
			struct Windowsio {
				bool append;
				void* h;
				struct Buffer {
					void* data;
					size_t size;
					size_t left;
				}
				Buffer buffer;
			}
			Windowsio windowsio;
		}

		struct Stdio {
			bool autoclose;
			FILE* fp;
		}
		Stdio stdio;

		struct Mem {
			ubyte* base;
			ubyte* here;
			ubyte* stop;
		}
		Mem mem;

		struct Unknown {
			void* data1;
		}
		Unknown unknown;
	}
	Hidden hidden;
}

enum {
	RW_SEEK_SET = 0,
	RW_SEEK_CUR = 1,
	RW_SEEK_END = 2,
}

long SDL_RWsize(SDL_RWops* ctx) { return ctx.size(ctx); }
long SDL_RWseek(SDL_RWops* ctx, long offset, int whence) { return ctx.seek(ctx, offset, whence); }
long SDL_RWtell(SDL_RWops* ctx) { return ctx.seek(ctx, 0, RW_SEEK_CUR); }
size_t SDL_RWread(SDL_RWops* ctx, void* ptr, size_t size, size_t n) { return ctx.read(ctx, ptr, size, n); }
size_t SDL_RWwrite(SDL_RWops* ctx, const(void)* ptr, size_t size, size_t n) { return ctx.write(ctx, ptr, size, n); }
int SDL_RWclose(SDL_RWops* ctx) { return ctx.close(ctx); }



