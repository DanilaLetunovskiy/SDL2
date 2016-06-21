module SDL2.video;

import SDL2.rect;
import SDL2.surface;

extern(C) @nogc nothrow:


int SDL_GetNumVideoDrivers();
const(char)* SDL_GetVideoDriver(int);
int SDL_VideoInit(const(char)*);
void SDL_VideoQuit();
const(char)* SDL_GetCurrentVideoDriver();
int SDL_GetNumVideoDisplays();
const(char)* SDL_GetDisplayName(int);
int SDL_GetDisplayBounds(int, SDL_Rect*);
int SDL_GetDisplayDPI(int, float*, float*, float*);
int SDL_GetNumDisplayModes(int);
int SDL_GetDisplayMode(int, int, SDL_DisplayMode*);
int SDL_GetDesktopDisplayMode(int, SDL_DisplayMode*);
int SDL_GetCurrentDisplayMode(int, SDL_DisplayMode*);
SDL_DisplayMode* SDL_GetClosestDisplayMode(int, const(SDL_DisplayMode)*, SDL_DisplayMode*);
int SDL_GetWindowDisplayIndex(SDL_Window*);
int SDL_SetWindowDisplayMode(SDL_Window*, const(SDL_DisplayMode)*);
int SDL_GetWindowDisplayMode(SDL_Window*, SDL_DisplayMode*);
uint SDL_GetWindowPixelFormat(SDL_Window*);
SDL_Window* SDL_CreateWindow(const(char)*, int, int, int, int, uint);
SDL_Window* SDL_CreateWindowFrom(const(void)*);
uint SDL_GetWindowID(SDL_Window*);
SDL_Window* SDL_GetWindowFromID(uint);
uint SDL_GetWindowFlags(SDL_Window*);
void SDL_SetWindowTitle(SDL_Window*, const(char)*);
const(char)* SDL_GetWindowTitle(SDL_Window*);
void SDL_SetWindowIcon(SDL_Window*, SDL_Surface*);
void* SDL_SetWindowData(SDL_Window*, const(char)*, void*);
void* SDL_GetWindowData(SDL_Window*, const(char)*);
void SDL_SetWindowPosition(SDL_Window*, int, int);
void SDL_GetWindowPosition(SDL_Window*, int*, int*);
void SDL_SetWindowSize(SDL_Window*, int, int);
void SDL_GetWindowSize(SDL_Window*, int*, int*);
void SDL_SetWindowMinimumSize(SDL_Window*, int, int);
void SDL_GetWindowMinimumSize(SDL_Window*, int*, int*);
void SDL_SetWindowMaximumSize(SDL_Window*, int, int);
void SDL_GetWindowMaximumSize(SDL_Window*, int*, int*);
void SDL_SetWindowBordered(SDL_Window*, bool);
void SDL_ShowWindow(SDL_Window*);
void SDL_HideWindow(SDL_Window*);
void SDL_RaiseWindow(SDL_Window*);
void SDL_MaximizeWindow(SDL_Window*);
void SDL_MinimizeWindow(SDL_Window*);
void SDL_RestoreWindow(SDL_Window*);
int SDL_SetWindowFullscreen(SDL_Window*, uint);
SDL_Surface* SDL_GetWindowSurface(SDL_Window*);
int SDL_UpdateWindowSurface(SDL_Window*);
int SDL_UpdateWindowSurfaceRects(SDL_Window*, SDL_Rect*, int);
void SDL_SetWindowGrab(SDL_Window*, bool);
bool SDL_GetWindowGrab(SDL_Window*);
SDL_Window* SDL_GetGrabbedWindow();
int SDL_SetWindowBrightness(SDL_Window*, float);
float SDL_GetWindowBrightness(SDL_Window*);
int SDL_SetWindowGammaRamp(SDL_Window*, const(ushort)*, const(ushort)*, const(ushort)*, const(ushort)*);
int SDL_GetWindowGammaRamp(SDL_Window*, ushort*, ushort*, ushort*, ushort*);
int SDL_SetWindowHitTest(SDL_Window*, SDL_HitTest, void*);
void SDL_DestroyWindow(SDL_Window*);
bool SDL_IsScreenSaverEnabled();
void SDL_EnableScreenSaver();
void SDL_DisableScreenSaver();
int SDL_GL_LoadLibrary(const(char)*);
void* SDL_GL_GetProcAddress(const(char)*);
void SDL_GL_UnloadLibrary();
bool SDL_GL_ExtensionSupported(const(char)*);
void SDL_GL_ResetAttributes();
int SDL_GL_SetAttribute(SDL_GLattr, int);
int SDL_GL_GetAttribute(SDL_GLattr, int*);
SDL_GLContext SDL_GL_CreateContext(SDL_Window*);
int SDL_GL_MakeCurrent(SDL_Window*, SDL_GLContext);
SDL_Window* SDL_GL_GetCurrentWindow();
SDL_GLContext SDL_GL_GetCurrentContext();
void SDL_GL_GetDrawableSize(SDL_Window*, int*, int*);
int SDL_GL_SetSwapInterval(int);
int SDL_GL_GetSwapInterval();
void SDL_GL_SwapWindow(SDL_Window*);
void SDL_GL_DeleteContext(SDL_GLContext);




struct SDL_DisplayMode {
	uint format;
	int w;
	int h;
	int refresh_rate;
	void* driverdata;
}

struct SDL_Window;

alias SDL_WindowFlags = int;
enum {
	SDL_WINDOW_FULLSCREEN = 0x00000001,
	SDL_WINDOW_OPENGL = 0x00000002,
	SDL_WINDOW_SHOWN = 0x00000004,
	SDL_WINDOW_HIDDEN = 0x00000008,
	SDL_WINDOW_BORDERLESS = 0x00000010,
	SDL_WINDOW_RESIZABLE = 0x00000020,
	SDL_WINDOW_MINIMIZED = 0x00000040,
	SDL_WINDOW_MAXIMIZED = 0x00000080,
	SDL_WINDOW_INPUT_GRABBED = 0x00000100,
	SDL_WINDOW_INPUT_FOCUS = 0x00000200,
	SDL_WINDOW_MOUSE_FOCUS = 0x00000400,
	SDL_WINDOW_FULLSCREEN_DESKTOP = SDL_WINDOW_FULLSCREEN | 0x00001000,
	SDL_WINDOW_FOREIGN = 0x00000800,
	SDL_WINDOW_ALLOW_HIGHDPI = 0x00002000,
	SDL_WINDOW_MOUSE_CAPTURE = 0x00004000,
}

enum SDL_WINDOWPOS_UNDEFINED_MASK = 0x1FFF0000;
@nogc nothrow uint SDL_WINDOWPOS_UNDEFINED_DISPLAY(uint X){ return (SDL_WINDOWPOS_UNDEFINED_MASK | X); }
enum SDL_WINDOWPOS_UNDEFINED = SDL_WINDOWPOS_UNDEFINED_DISPLAY(0);
@nogc nothrow bool SDL_WINDOWPOS_ISUNDEFINED(uint X){ return (X & 0xFFFF0000) == SDL_WINDOWPOS_UNDEFINED_MASK; }

enum SDL_WINDOWPOS_CENTERED_MASK = 0x2FFF0000;
@nogc nothrow uint SDL_WINDOWPOS_CENTERED_DISPLAY(uint X){ return (SDL_WINDOWPOS_CENTERED_MASK | X); }
enum SDL_WINDOWPOS_CENTERED = SDL_WINDOWPOS_CENTERED_DISPLAY(0);
@nogc nothrow bool SDL_WINDOWPOS_ISCENTERED(uint X){ return (X & 0xFFFF0000) == SDL_WINDOWPOS_CENTERED_MASK; }

alias SDL_WindowEventID = int;
enum {
	SDL_WINDOWEVENT_NONE,
	SDL_WINDOWEVENT_SHOWN,
	SDL_WINDOWEVENT_HIDDEN,
	SDL_WINDOWEVENT_EXPOSED,
	SDL_WINDOWEVENT_MOVED,
	SDL_WINDOWEVENT_RESIZED,
	SDL_WINDOWEVENT_SIZE_CHANGED,
	SDL_WINDOWEVENT_MINIMIZED,
	SDL_WINDOWEVENT_MAXIMIZED,
	SDL_WINDOWEVENT_RESTORED,
	SDL_WINDOWEVENT_ENTER,
	SDL_WINDOWEVENT_LEAVE,
	SDL_WINDOWEVENT_FOCUS_GAINED,
	SDL_WINDOWEVENT_FOCUS_LOST,
	SDL_WINDOWEVENT_CLOSE
}

alias SDL_GLContext = void*;

alias SDL_GLattr = int;
enum {
	SDL_GL_RED_SIZE,
	SDL_GL_GREEN_SIZE,
	SDL_GL_BLUE_SIZE,
	SDL_GL_ALPHA_SIZE,
	SDL_GL_BUFFER_SIZE,
	SDL_GL_DOUBLEBUFFER,
	SDL_GL_DEPTH_SIZE,
	SDL_GL_STENCIL_SIZE,
	SDL_GL_ACCUM_RED_SIZE,
	SDL_GL_ACCUM_GREEN_SIZE,
	SDL_GL_ACCUM_BLUE_SIZE,
	SDL_GL_ACCUM_ALPHA_SIZE,
	SDL_GL_STEREO,
	SDL_GL_MULTISAMPLEBUFFERS,
	SDL_GL_MULTISAMPLESAMPLES,
	SDL_GL_ACCELERATED_VISUAL,
	SDL_GL_RETAINED_BACKING,
	SDL_GL_CONTEXT_MAJOR_VERSION,
	SDL_GL_CONTEXT_MINOR_VERSION,
	SDL_GL_CONTEXT_EGL,
	SDL_GL_CONTEXT_FLAGS,
	SDL_GL_CONTEXT_PROFILE_MASK,
	SDL_GL_SHARE_WITH_CURRENT_CONTEXT,
	SDL_GL_FRAMEBUFFER_SRGB_CAPABLE,
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR,
}

alias SDL_GLprofile = int;
enum {
	SDL_GL_CONTEXT_PROFILE_CORE = 0x0001,
	SDL_GL_CONTEXT_PROFILE_COMPATIBILITY = 0x0002,
	SDL_GL_CONTEXT_PROFILE_ES = 0x0004,
}

alias SDL_GLcontextFlag = int;
enum {
	SDL_GL_CONTEXT_DEBUG_FLAG = 0x0001,
	SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 0x0002,
	SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG = 0x0004,
	SDL_GL_CONTEXT_RESET_ISOLATION_FLAG = 0x0008,
}

alias SDL_GLcontextReleaseFlag = int;
enum {
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE = 0x0000,
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 0x0001,
}

alias SDL_HitTestResult = int;
enum {
	SDL_HITTEST_NORMAL,
	SDL_HITTEST_DRAGGABLE,
	SDL_HITTEST_RESIZE_TOPLEFT,
	SDL_HITTEST_RESIZE_TOP,
	SDL_HITTEST_RESIZE_TOPRIGHT,
	SDL_HITTEST_RESIZE_RIGHT,
	SDL_HITTEST_RESIZE_BOTTOMRIGHT,
	SDL_HITTEST_RESIZE_BOTTOM,
	SDL_HITTEST_RESIZE_BOTTOMLEFT,
	SDL_HITTEST_RESIZE_LEFT,
}

alias SDL_HitTest = SDL_HitTestResult function(SDL_Window*, const(SDL_Point)*, void*);



