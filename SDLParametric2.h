#ifndef _SDL_PARAMETRIC_2_H_
#define _SDL_PARAMETRIC_2_H_

#include "./destructive_reasoning.h"
#include "./SDLCartesian.h"

class SDL_Parametric2 : public SDL_Cartesian
{
	public:
		SDL_Parametric2(int width,int height,std::vector<std::string> equations);
		
		virtual void render();

	protected:
		std::vector<std::string> equations;	
		std::vector<std::string> rpnequations;	
		double tmin;
		double tmax;
};

#endif
