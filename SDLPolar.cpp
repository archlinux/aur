#include "./SDLPolar.h"

void SDL_Polar::render()
{
	double r0 = Math::evaluateRPN(rpn[0],(-width/2),false) + (double)(height/2 - yOffset);
	double x0 = r0;
	double y0 = 0.0;
	last = {x0,y0};
	for(int i = 0; i < functions.size(); i++)
	{
		switch(i)
		{
			case 0:
				SDL_SetRenderDrawColor(renderer,0xFF,0xFF,0,0xFF);
				break;
			case 1:
				SDL_SetRenderDrawColor(renderer,0xFF,0x22,0x22,0xFF);
				break;
			case 2:
				SDL_SetRenderDrawColor(renderer,0x44,0x44,0xFF,0xFF);
				break;
			case 3:
				SDL_SetRenderDrawColor(renderer,0xFF,0x66,0x00,0xFF);
				break;
		}

		for(double t = 0.0f; t <= 64 * M_PI; t += 0.1f)
		{
			r0 = Math::evaluateRPN(rpn[i],t,false);
			//printf("%f\n",r0);
			x0 = r0 * cos(t) * xScale;
			y0 = r0 * sin(t) * yScale;
			next = {x0 - xOffset + width/2, -y0 + height/2 - yOffset};
			if(t != 0.0)SDL_RenderDrawLine(renderer,last.x,last.y,next.x,next.y);
			last = next;
		}
	}
}
