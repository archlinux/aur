#include "./SDLCartesian.h"

SDL_Cartesian::SDL_Cartesian(int _width, int _height, std::vector<std::string> _functions) :
	width(_width),
	height(_height),
	functions(_functions),
	xOffset(0),
	yOffset(0),
	scrollSpeed(2),
	running(true)
{
	SDL_Init(SDL_INIT_VIDEO);
	window = SDL_CreateWindow("Savant Cartesian", SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED,width,height,SDL_WINDOW_SHOWN);
	renderer = SDL_CreateRenderer(window, -1, 0);
	texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STATIC,width,height);
	pixels = new Uint32[width * height];
	for(int c = 0; c < functions.size(); c++)
	{
		rpn.push_back(Math::infixToRPN(functions[c]));
	}
	SDL_SetRenderDrawColor(renderer,0xff,0xff,0,0xff);
	xScale = width/10.0f;
	yScale = xScale;
}

SDL_Cartesian::SDL_Cartesian(int _width, int _height, std::string _infix) :
	width(_width),
	height(_height),
	xOffset(0),
	yOffset(0),
	scrollSpeed(2),
	running(true)
{
	functions.push_back(_infix);
	SDL_Init(SDL_INIT_VIDEO);
	window = SDL_CreateWindow("Savant Cartesian", SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED,width,height,SDL_WINDOW_SHOWN);
	renderer = SDL_CreateRenderer(window, -1, 0);
	texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_ARGB8888, SDL_TEXTUREACCESS_STATIC,width,height);
	pixels = new Uint32[width * height];
	for(int c = 0; c < functions.size(); c++)
	{
		rpn.push_back(Math::infixToRPN(functions[c]));
	}
	SDL_SetRenderDrawColor(renderer,0xff,0xff,0,0xff);
	xScale = width/10.0f;
	yScale = xScale;
}

void SDL_Cartesian::update()
{
	keys = SDL_GetKeyboardState(NULL);
	if(keys[SDL_SCANCODE_MINUS])	
	{
		yScale = xScale -= (2.0f/10.0f) * (float)scrollSpeed * (float)functions.size();
		if(xScale < 2) xScale = yScale = 2;
	}
	if(keys[SDL_SCANCODE_EQUALS])	
	{
		yScale = xScale += (2.0f/10.0f) * (float)scrollSpeed * (float)functions.size();
		if(xScale > width/2) xScale = yScale = width/2;
	}
	if(keys[SDL_SCANCODE_LEFT])
	{
		xOffset -= scrollSpeed * functions.size();
	}
	if(keys[SDL_SCANCODE_RIGHT])
	{
		xOffset += scrollSpeed * functions.size();
	}
	if(keys[SDL_SCANCODE_UP])
	{
		yOffset -= scrollSpeed * functions.size();
	}
	if(keys[SDL_SCANCODE_DOWN])
	{
		yOffset += scrollSpeed * functions.size();
	}
	if(keys[SDL_SCANCODE_HOME])
	{
		xOffset = yOffset = 0;
		xScale = yScale = width/10.0f;
	}
	if(keys[SDL_SCANCODE_ESCAPE])
	{
		running = false;
	}

	for(int c = 0; c < width * height; c++) pixels[c] = 0xff000000; //Clear Screen
	for(int c = 0; c < width; c++)
	{
		int coordinate = (int)(c + (-yOffset + height/2) * width);
		if(coordinate >= 0 && coordinate < width * height && Math::absolute(yOffset) < height/2)
			pixels[coordinate] = 0xff444444;	//Draw X axis
	}
	for(int c = 0; c < height; c++)
	{
		int coordinate = (int)(width/2 - xOffset + (c)*width);
		if(coordinate >= 0 && coordinate < width * height && Math::absolute(xOffset) < width/2)
			pixels[coordinate] = 0xff444444;		//Draw Y axis
	}
	SDL_UpdateTexture(texture,NULL,pixels,width * sizeof(Uint32));
}

void SDL_Cartesian::render()
{
	
	double x;
	double y;
	last = {(double)xOffset,-Math::evaluateRPN(rpn[0],(-width/2) / xScale,false)*yScale + (double)height/2 - (double)yOffset};
	for(int c = 0; c < rpn.size(); c++)
	{
		switch(c)
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
		for(int i = 0 + xOffset; i < width + xOffset; i++)
		{
			//y = Math::evaluateRPN(rpn,(i - width)*xScale/width,false);
			y = -Math::evaluateRPN(rpn[c],(i-width/2),false);
			int coordinate = (int)(i + (y + height/2)*width);
			next = {(double)(i - xOffset),-Math::evaluateRPN(rpn[c],(i - width/2)/xScale, false) * yScale + (double)(height/2 - yOffset)};
			if(i != xOffset)SDL_RenderDrawLine(renderer,last.x,last.y,next.x,next.y);
			last = next;
			//if(coordinate >= 0 && coordinate < width * height) pixels[coordinate] = 0xffffff00;
		}
	}
}

void SDL_Cartesian::run()
{
	while(running)
	{
		SDL_PollEvent(&mainEvent);
		if(mainEvent.type == SDL_QUIT) running = false;
		SDL_RenderClear(renderer);
		update();
		SDL_RenderCopy(renderer,texture,NULL,NULL);
		render();
		SDL_RenderPresent(renderer);
		SDL_Delay(10);
	}
}

SDL_Cartesian::~SDL_Cartesian()
{
//	rpn = std::string();		//TODO May cause errors
	delete[] pixels;
	SDL_DestroyTexture(texture);
	SDL_DestroyRenderer(renderer);
	SDL_DestroyWindow(window);
	SDL_Quit();
}
