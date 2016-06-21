module SDL2.syswm;

import SDL2.video;
import SDL2.version_;
import core.sys.windows.windows;

extern(C) @nogc nothrow:


bool SDL_GetWindowWMInfo(SDL_Window* window, SDL_SysWMinfo * info);


alias SDL_SYSWM_TYPE = int;
enum {
	SDL_SYSWM_UNKNOWN,
	SDL_SYSWM_WINDOWS,
	SDL_SYSWM_X11,
	SDL_SYSWM_DIRECTFB,
	SDL_SYSWM_COCOA,
	SDL_SYSWM_UIKIT,
	SDL_SYSWM_WAYLAND,
	SDL_SYSWM_MIR,
	SDL_SYSWM_WINRT,
	SDL_SYSWM_ANDROID,
}

struct SDL_SysWMmsg {
	SDL_version version_;
	SDL_SYSWM_TYPE subsystem;
	union msg_ {
		version(Windows){ // because wintypes types are only defined when compiling for Windows
			// Win32
			struct win_ {
				HWND hwnd;
				UINT msg;
				WPARAM wParam;
				LPARAM lParam;
			}
			win_ win;
		}

		version(WinRT){
			// Win32
			struct winrt_ {
				void* window;
			}
			winrt_ winrt;
		}

		version(OSX){
			// OS X Cocoa
			struct cocoa_ {
				int dummy;
			}
			cocoa_ cocoa;
		}

		version(Posix){
			// X11 unsupported for now
			struct x11_ {
				long[24] pad; // sufficient size for any X11 event
			}
			x11_ x11;
		}

		version(linux){
			// DirectFB unsupported for now
			// Consequently SDL_SysWMmsg might have a different size that in SDL
			struct dfb_ {
				void* event;
			}
			dfb_ dfb;
		}

		int dummy;
	}
	msg_ msg;
}

struct SDL_SysWMinfo {
	SDL_version version_; // version is reserved in D
	SDL_SYSWM_TYPE subsystem;

	union info_ {
		version(Windows){
			struct win_ {
			   HWND window;
			}
			win_ win;
		}

		version(WinRT){
			struct winrt_ {
				void* window;
			}
			winrt_ winrt;
		}

		version(Posix){
			struct x11_ {
				Display* display;
				Window window;
			}
			x11_ x11;
		}

		// TODO not too sure about all the Derelict_OS tests below.
		version(linux){
			struct dfb_ {
				void *dfb;
				void *window;
				void *surface;
			}
			dfb_ dfb;

			struct wl_ {
				void *display;
				void *surface;
				void *shell_surface;
			}
			wl_ wl;

			struct mir_ {
				void *connection;
				void *surface;
			}
			mir_ mir;
		}

		version(OSX){
			struct cocoa_ {
			   void* window;
			}
			cocoa_ cocoa;

			struct uikit_ {
				void *window;
			}
			uikit_ uikit;
		}
	}
	info_ info;
}
