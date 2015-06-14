#ifndef _SDL_POLAR_H_
#define _SDL_POLAR_H_

#include "./destructive_reasoning.h"
#include "./Math.h"
#include "./SDLCartesian.h"

class SDL_Polar : public SDL_Cartesian
{
	public:
		SDL_Polar(int width, int height, std::string infix) : SDL_Cartesian(width,height,infix) {};
		SDL_Polar(int width, int height, std::vector<std::string> functions) : SDL_Cartesian(width,height,functions) {};

		virtual void render();
};

#endif
