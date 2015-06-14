#ifndef _SDL_CARTESIAN_H_
#define _SDL_CARTESIAN_H_

#include "./Math.h"
#include "./destructive_reasoning.h"
#include "SDL2/SDL.h"

class SDL_Cartesian
{
	public:
		SDL_Cartesian(int width, int height, std::vector<std::string> functions);
		SDL_Cartesian(int width, int height, std::string infix);
		~SDL_Cartesian();

		virtual void update();
		virtual void render();
		virtual void run();
		
		int scrollSpeed;

	protected:
		SDL_Window *window;
		SDL_Renderer *renderer;
		SDL_Event mainEvent;
		SDL_Texture *texture;
		Uint32 *pixels;
		std::vector<std::string> functions;
		std::vector<std::string> rpn;
		int width;
		int height;
		double xScale;
		double yScale;
		int xOffset;
		int yOffset;
		bool running;
		Coordinate last;
		Coordinate next;
		const Uint8 *keys;
};

#endif
