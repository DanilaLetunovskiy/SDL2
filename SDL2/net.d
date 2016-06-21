module SDL2.net;

import SDL2.version_;
import SDL2.error;

extern(C) @nogc nothrow:

const(SDLNet_Version)* SDLNet_Linked_Version();
int SDLNet_Init();
void SDLNet_Quit();
int SDLNet_ResolveHost(IPaddress*, const(char)*, ushort);
const(char)* SDLNet_ResolveIP(const(IPaddress)*);
int SDLNet_GetLocalAddresses(IPaddress*, int);
TCPsocket SDLNet_TCP_Open(IPaddress*);
TCPsocket SDLNet_TCP_Accept(TCPsocket);
IPaddress* SDLNet_TCP_GetPeerAddress(TCPsocket);
int SDLNet_TCP_Send(TCPsocket, const(void)*, int);
int SDLNet_TCP_Recv(TCPsocket, void*, int);
void SDLNet_TCP_Close(TCPsocket);
UDPpacket* SDLNet_AllocPacket(int);
int SDLNet_ResizePacket(UDPpacket*, int);
void SDLNet_FreePacket(UDPpacket*);
UDPpacket** SDLNet_AllocPacketV(int, int);
void SDLNet_FreePacketV(UDPpacket**);
UDPsocket SDLNet_UDP_Open(ushort);
void SDLNet_UDP_SetPacketLoss(UDPsocket, int);
int SDLNet_UDP_Bind(UDPsocket, int, const(IPaddress)*);
void SDLNet_UDP_Unbind(UDPsocket, int);
IPaddress* SDLNet_UDP_GetPeerAddress(UDPsocket, int);
int SDLNet_UDP_SendV(UDPsocket, UDPpacket**, int);
int SDLNet_UDP_Send(UDPsocket, int, UDPpacket*);
int SDLNet_UDP_RecvV(UDPsocket, UDPpacket**);
int SDLNet_UDP_Recv(UDPsocket, UDPpacket*);
void SDLNet_UDP_Close(UDPsocket);
SDLNet_SocketSet SDLNet_AllocSocketSet(int);
int SDLNet_AddSocket(SDLNet_SocketSet, SDLNet_GenericSocket);
int SDLNet_DelSocket(SDLNet_SocketSet, SDLNet_GenericSocket);
int SDLNet_CheckSockets(SDLNet_SocketSet, uint);
void SDLNet_FreeSocketSet(SDLNet_SocketSet);
void SDLNet_SetError(const(char)* fmt, ...);
const(char)* SDLNet_GetError();


alias SDLNet_Version = SDL_version;

enum : ubyte {
	SDL_NET_MAJOR_VERSION = 2,
	SDL_NET_MINOR_VERSION = 0,
	SDL_NET_PATCHLEVEL    = 0,
}

@nogc nothrow void SDL_NET_VERSION(SDL_version* X) {
	X.major = SDL_NET_MAJOR_VERSION;
	X.minor = SDL_NET_MINOR_VERSION;
	X.patch = SDL_NET_PATCHLEVEL;
}

struct IPaddress {
	uint host;
	ushort port;
}

enum {
	INADDR_ANY = 0x00000000,
	INADDR_NONE = 0xFFFFFFFF,
	INADDR_LOOPBACK = 0x7f000001,
	INADDR_BROADCAST = 0xFFFFFFFF,
}

alias TCPsocket = void*;

enum SDLNET_MAX_UDPCHANNELS = 32;
enum SDLNET_MAX_UDPADRESSES = 4;

alias UDPsocket = void*;

struct UDPpacket {
	int channel;
	ubyte* data;
	int len;
	int maxlen;
	int status;
	IPaddress address;
}

struct _SDLNet_SocketSet;
alias _SDLNet_SocketSet* SDLNet_SocketSet;

struct _SDLNet_GenericSocket {
	int ready;
}
alias SDLNet_GenericSocket = _SDLNet_GenericSocket*;

/*
int SDLNet_TCP_AddSocket(SDLNet_SocketSet set, void* sock) {
	return SDLNet_AddSocket(set, cast(SDLNet_GenericSocket)sock);
}
alias SDLNet_UDP_AddSocket = SDLNet_TCP_AddSocket;

int SDLNet_TCP_DelSocket(SDLNet_SocketSet set, void* sock) {
	return SDLNet_DelSocket(set, cast(SDLNet_GenericSocket)sock);
}
alias SDLNet_UDP_DelSocket = SDLNet_TCP_DelSocket;

bool SDLNet_SocketReady(void* sock) {
	return sock && (cast(SDLNet_GenericSocket)sock).ready != 0;
}
*/
