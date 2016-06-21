module SDL2.system;


import SDL2.render;


extern(C) @nogc nothrow:


version(Windows){
	struct IDirect3DDevice9;
	int SDL_Direct3D9GetAdapterIndex(int);
	IDirect3DDevice9* SDL_RenderGetD3D9Device(SDL_Renderer*);
	bool SDL_DXGIGetOutputInfo (int, int*, int*);
}
version(iOS){
	alias SDL_iPhoneAnimationCallback = void function( void* );
	int SDL_iPhoneSetAnimationCallback(SDL_Window*, int, SDL_iPhoneAnimationCallback, void*);
	void SDL_iPhoneSetEventPump(bool);
}
version(Android){
	enum int SDL_ANDROID_EXTERNAL_STORAGE_READ  = 0x01;
	enum int SDL_ANDROID_EXTERNAL_STORAGE_WRITE = 0x02;
	void* SDL_AndroidGetJNIEnv();
	void* SDL_AndroidGetActivity();
	const(char)* SDL_AndroidGetInternalStoragePath();
	int SDL_AndroidGetInternalStorageState();
	const(char)* SDL_AndroidGetExternalStoragePath();
}
version(WinRT){
	const(wchar_t)* SDL_WinRTGetFSPathUNICODE(SDL_WinRT_Path);
	const(char)* SDL_WinRTGetFSPathUTF8(SDL_WinRT_Path);
	int SDL_WinRTRunApp(int function(int, char**), void*);
	enum SDL_WinRT_Path {
		SDL_WINRT_PATH_INSTALLED_LOCATION,
		SDL_WINRT_PATH_LOCAL_FOLDER,
		SDL_WINRT_PATH_ROAMING_FOLDER,
		SDL_WINRT_PATH_TEMP_FOLDER
	}
}
