#include "./SDLParametric2.h"

SDL_Parametric2::SDL_Parametric2(int _width, int _height, std::vector<std::string> _equations) :
	SDL_Cartesian(_width,_height,_equations)
{
	printf("Starting Equation Transfer...\n");
	equations.push_back(_equations[0]);
	equations.push_back(_equations[1]);
	printf("Finished Equation Transfer.\n");
	for(int c = 0; c < 2; c++)
	{
		rpnequations.push_back(Math::infixToRPN(equations[c]));
	}
	printf("Finished Equation Conversion.\n");
	tmin = -32 * M_PI;
	tmax = 32 * M_PI;
}

void SDL_Parametric2::render()
{
	last = {Math::evaluateRPN(rpnequations[0],tmin,false) * xScale + width/2 - xOffset, -Math::evaluateRPN(rpnequations[1],tmin,false) * yScale +height/2 - yOffset};

	for(double t = tmin; t < tmax; t += 0.1)
	{
		next = {Math::evaluateRPN(rpnequations[0],t,false)  * xScale + width/2 - xOffset, -Math::evaluateRPN(rpnequations[1],t,false) * yScale + height/2 - yOffset};
		if(t != tmin) SDL_RenderDrawLine(renderer,last.x,last.y,next.x,next.y);
		last = next;
	}
}
