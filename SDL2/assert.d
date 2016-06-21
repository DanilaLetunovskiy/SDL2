module SDL2.assert_;


extern(C) @nogc nothrow:


void SDL_SetAssertionHandler(SDL_AssertionHandler, void*);
SDL_AssertionHandler SDL_GetDefaultAssertionHandler();
SDL_AssertionHandler SDL_GetAssertionHandler(void**);
const(SDL_assert_data)* SDL_GetAssertionReport();
void SDL_ResetAssertionReport();


enum SDL_AssertState : uint {
	SDL_ASSERTION_RETRY,
	SDL_ASSERTION_BREAK,
	SDL_ASSERTION_ABORT,
	SDL_ASSERTION_IGNORE,
	SDL_ASSERTION_ALWAYS_IGNORE
}

alias SDL_assert_state = SDL_AssertState;

struct SDL_AssertData {
	int always_ignore;
	uint trigger_count;
	const(char) *condition;
	const(char) *filename;
	int linenum;
	const(char) *function_;
	const(SDL_AssertData) *next;
}
alias SDL_assert_data = SDL_AssertData;

alias SDL_AssertionHandler = SDL_AssertState function(const(SDL_AssertData)* data, void* userdata);
