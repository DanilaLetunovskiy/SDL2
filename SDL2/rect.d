module SDL2.rect;


extern(C) @nogc nothrow:


bool SDL_HasIntersection(const(SDL_Rect)*, const(SDL_Rect)*);
bool SDL_IntersectRect(const(SDL_Rect)*, const(SDL_Rect)*, SDL_Rect*);
void SDL_UnionRect(const(SDL_Rect)*, const(SDL_Rect)*, SDL_Rect*);
void SDL_EnclosePoints(const(SDL_Point)*, int, const(SDL_Rect)*, SDL_Rect*);
bool SDL_IntersectRectAndLine(const(SDL_Rect)*, int*, int*, int*, int*);


struct SDL_Point {
	int x;
	int y;
}

struct SDL_Rect {
	int x, y;
	int w, h;
}

@nogc nothrow {
	bool SDL_PointInRect(const SDL_Point *p, const SDL_Rect *r) {
		return (( p.x >= r.x ) && ( p.x < ( r.x + r.w )) &&
				( p.y >= r.y ) && ( p.y < ( r.y + r.h )));
	}
	bool SDL_RectEmpty( const( SDL_Rect )* X ) { return !X || ( X.w <= 0 ) || ( X.h <= 0 ); }
	bool SDL_RectEquals( const( SDL_Rect )* A, const( SDL_Rect )* B ) {
		return A && B && ( A.x == B.x ) && ( A.y == B.y ) && ( A.w == B.w ) && ( A.h == B.h );
	}
}
