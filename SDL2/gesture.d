module SDL2.gesture;

import SDL2.touch;
import SDL2.rwops;

extern(C) @nogc nothrow:


int SDL_RecordGesture(SDL_TouchID);
int SDL_SaveAllDollarTemplates(SDL_RWops*);
int SDL_SaveDollarTemplate(SDL_GestureID, SDL_RWops*);
int SDL_LoadDollarTemplates(SDL_TouchID, SDL_RWops*);


alias SDL_GestureID = long;

