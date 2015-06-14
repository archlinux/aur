#include "destructive_reasoning.h"
#include "variable.h"
#include "Math.h"
#include "Txt.h"
#include "./SDLCartesian.h"
#include "./SDLPolar.h"
#include "./SDLParametric2.h"
#include <limits>
#include <cstdio>

#define TITLE "Savant"
#define WIDTH 800
#define HEIGHT 600

/**
 *
 * Copright (c) 2015, Harley Wiltzer
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without 
 * modification, are permitted provided that the following conditions 
 * are met:
 *
 * 1.	Redistribution of source code must retain the above copyright 
 * 	notice, this list of conditions, and the following disclaimer.
 * 2. 	Redistributions in binary form must reproduce the above
 * 	copyright notice, this list of conditions, and the following 
 * 	disclaimer in the documentation and/or other materials
 * 	provided with the distribution.
 * 3.	All advertising materials mentioning features or use of this
 * 	software must display the following acknowledgements:
 * 	This product includes software developed by Harley Wiltzer.
 * 4. 	Neither the name of Destructive Reasoning nor the names of its
 * 	contributors may be used to endorse or promote products 
 * 	derived from this software without specific prior written 
 * 	permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
 * "AS IS" AND ANBY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
 * ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 */

std::string substring(std::string, int, int);

void initialize();
void solveQuadratic();
void graphFunction(std::string infix);
void graphFunctions(std::vector<std::string> functions);
void graphPolar(std::string infix);
void graphPolars(std::vector<std::string> functions);
void graphParametric2D(std::vector<std::string> equations);
void showHelp();
std::vector<Variable *> variables;
std::vector<std::string> intros;

int main(int argc, char *argv[])
{
	if(argc > 1)
	{
		printf("Following order... %s\n", argv[1]);
		if(strcmp(argv[1],"-h") == 0 || strcmp(argv[1],"--help") == 0)
		{
			showHelp();
			return 0;
		}
		else 
		{
			printf("%s\n",Math::insults[rand()%Math::insults.size()].c_str());
			printf("That's not an order!\n");
			return 0;
		}
	}

	std::stringstream logoPath;
	logoPath << getenv("HOME");
	logoPath << "/.savant/logo";
	std::ifstream logoFile (logoPath.str());
	std::string line;
	if(logoFile.is_open())
	{
		while(getline(logoFile,line))
		{
			printf("%s\n",line.c_str());
		}
	}
	else 
	{
		printf("Could not load logo file\n");
	}
	logoFile.close();

	printf("\n%s\nv0.3.0\nCopyright (C) 2015 Harley Wiltzer\nPowered by Har Wiltz's Destructive Reasoning\n", TITLE);
	printf("This free software includes exactly 0 warranties\n");
	printf("For instructions, type \'help\'.\n\n");
	initialize();

	bool running = true;
	std::string infix;
	
	variables.push_back(new Variable("ans",0.0,false));
	variables.push_back(new Variable("pi",M_PI,true));
	variables.push_back(new Variable("e",M_E,true));

	int vn;

	while(running)
	{
		Math::setVariables(variables);
		printf("savant> ");
		std::getline(std::cin,infix);
		if(infix == "quit" || infix == "exit") running = false;
		else if(infix == "clear") system("clear");
		else if(infix == "quadratic")
		{
			Math::variables = variables;
			printf("~$ Starting Quadratic Mode $~\n");
			solveQuadratic();
		}
		else if((vn = Txt::contains(infix,'=')) != -1)
		{
			std::string lvalue = Txt::trimEnd(Txt::substring(infix,0,vn-1));
			if(lvalue=="function"||lvalue=="help"||lvalue=="polar"||lvalue=="parametric"||lvalue=="quadratic"||Math::containsTrig(lvalue)||Math::containsLog(lvalue)||Math::containsFunction(lvalue)||Math::isOperator(lvalue[0]))
			{
				printf("-->Cannot create variable: %s is a savant function name\n",lvalue.c_str());
				continue;
			}
			if((lvalue[0] >= '1' && lvalue[0] <= '9') || lvalue[0] == '0')
			{
				printf("-->Cannot create variable: %s. Variables names cannot start with numbers\n",lvalue.c_str());
				continue;
			}

			int v;
			if((v = Math::isVariable(lvalue)) == -1)
			{
				printf(">>>Variable %s created\n",lvalue.c_str());
				v = Math::variables.size();
				Math::variables.push_back(new Variable(lvalue,0.0,false));
				variables = Math::variables;
			}
			std::string rvalue = Txt::trimFront(Txt::substring(infix,vn+1,infix.size()-1));
			double val = Math::evaluateRPN(Math::infixToRPN(rvalue),0,true);
			Math::variables[Math::ANS]->setValue(val);
			if(!Math::variables[v]->isConstant()) Math::variables[v]->setValue(val);
			else
			{
				printf("-->Cannot update variable: %s is a constant!\n",Math::variables[v]->getName().c_str());
			}
			//printf("Variable edited: %s\n",Math::variables[v]->getName().c_str());
		}
		else if(substring(infix,0,3) == "def ")
		{
			std::stringstream stream;
			std::string newvar;
			std::string valinfix;
			double val = 0.0f;
			stream << infix;
			stream >> newvar >> newvar >> valinfix;
			val = Math::evaluateRPN(Math::infixToRPN(valinfix),0,false);
			Math::variables[Math::ANS]->setValue(val);
			bool canCreate = true;
			if(newvar=="polar"||newvar=="help"||newvar=="quadratic"||newvar=="function"||newvar=="parametric"||Math::containsTrig(newvar)||Math::containsLog(newvar)||Math::containsFunction(newvar)||Math::isOperator(newvar[0]))
			{
				printf("-->Cannot create variable: %s is a savant function name\n",newvar.c_str());
				continue;
			}
			if((newvar[0] >= '1' && newvar[0] <= '9') || newvar[0] == '0')
			{
				printf("-->Cannot create variable: %s. Variable names cannot start with a number\n",newvar.c_str());
				continue;
			}
			for(int c = 0; c < Math::variables.size(); c++)
			{
				if(Math::variables[c]->getName() == newvar)
				{
					printf("-->Cannot define variable %s, it has already been defined\n",Math::variables[c]->getName().c_str());
					canCreate = false;
					break;
				}
			}
			if(canCreate)							//Creating a constant
			{
				Math::variables.push_back(new Variable (newvar, val, true));
				variables = Math::variables;
				std::ofstream file (NULL);
				std::stringstream path;
				path << getenv("HOME");
				path << "/.savant/constants";
				file.open(path.str().c_str(),std::ofstream::app);
				file << newvar << " " << val << "\n";
				file.close();
				printf(">>>Variable %s created.\n",newvar.c_str());
			}
		}	
		else if(substring(infix,0,5) == "delete")
		{
			std::stringstream s(infix);
			std::string varname;
			std::string temp;
			s >> temp >> varname;
			int i = -1;
			for(int c = 0; c < Math::variables.size(); c++)
			{
				if(Math::variables[c]->getName() == varname) i = c;
			}

			if(i == -1)
			{
				printf("Cannot delete %s: it is not a variable!\n",varname);
				continue;
			}

			printf(">>>Variable %s deleted.\n",Math::variables[i]->getName().c_str());
//			Math::variables.erase(Math::variables.begin() + i);
			Math::variables[i] = Math::variables.back();
			Math::variables.pop_back();
			variables = Math::variables;
			std::ofstream file (NULL);
			std::stringstream path;
			path << getenv("HOME");
			path << "/.savant/constants";
			file.open(path.str().c_str(),std::ofstream::out|std::ofstream::trunc);
			for(int c = 0; c < Math::variables.size(); c++)
			{
				if(Math::variables[c]->isConstant() && Math::variables[c]->getName() != "pi" && Math::variables[c]->getName() != "e")
				{
					file << Math::variables[c]->getName() << " " << Math::variables[c]->getValue() << "\n";
				}
			}
			file.close();
		}
		else if(substring(infix,0,7) == "function")				//Graph Functions
		{
			int num;
			std::vector<std::string> functions;
			std::string rest = substring(infix,8,infix.size() - 1);
			infix = std::string();
			if(rest.size() >= 0)
			{
				num = atoi(rest.c_str());
				if(num == 0) num = 1;
				if(num <= 4 && num > -1)
				{
					printf("Amount of functions: %d\n",num);
				}
				else 
				{
					printf("A maximum of 4 graphs can be drawn at once.\n");
					continue;
				}
				char functionName = 'f';
				for(int i = 0; i < num; i++)
				{
					printf("savant> %c(x) = ",functionName);
					std::getline(std::cin, infix);
					functions.push_back(infix);
					printf("--------] %c(x) will be drawn in %s\n",functionName,Math::colorNames[i].c_str());
					functionName += 1;
					infix = std::string();
				}
				graphFunctions(functions);
				continue;
			}
			printf("savant> f(x) = ");
			std::getline(std::cin, infix);
			graphFunction(infix);
		}
		else if(substring(infix,0,4) == "polar")
		{
			int num;
			std::vector<std::string> functions;
			std::string rest = substring(infix,5,infix.size() - 1);
			infix = std::string();
			printf("~Polar Curve~\n");
			printf("Write functions in terms of t, where t = theta\n");
			if(rest.size() >= 0)
			{
				num = atoi(rest.c_str());
				if(num == 0) num = 1;
				if(num <=4 && num >-1) printf("Amount of functions: %d\n",num);
				else 
				{
					printf("A maximum of 4 graphs can be drawn at once.\n");
					continue;
				}
				char functionName = 'r';
				for(int i = 0; i < num; i++)
				{
					printf("savant> %c(t) = ",functionName);
					std::getline(std::cin,infix);
					functions.push_back(infix);
					printf("--------] %c(t) will be drawn in %s\n",functionName,Math::colorNames[i].c_str());
					functionName -= 1;
					infix = std::string();
				}
				graphPolars(functions);
				continue;
			}
			printf("savant> r = ");
			infix = std::string();
			std::getline(std::cin, infix);
			graphPolar(infix);
		}
		else if(substring(infix,0,10) == "parametric2")
		{
			std::vector<std::string> equations;
			printf("x(t) = ");
			std::getline(std::cin,infix);
			equations.push_back(infix);
			printf("y(t) = ");
			std::getline(std::cin,infix);
			equations.push_back(infix);
			printf("Starting Parametric2 constructor\n");
			graphParametric2D(equations);
		}
		else if(infix == "help")
		{
			showHelp();	
		}
		else
		{
			if(Txt::trimEnd(infix) == "") continue;
			std::string r = Math::infixToRPN(infix);
			Math::variables[Math::ANS]->setValue(Math::evaluateRPN(r,0,true));
		}
		infix.clear();
		Math::rpn.str(std::string());
		std::cin.clear();
	}

	return 0;
}

void graphFunction(std::string infix)
{
	std::vector<std::string> functions;
	functions.push_back(infix);
	SDL_Cartesian *cartesian = new SDL_Cartesian(WIDTH,HEIGHT,functions);
	cartesian->run();
	delete cartesian;
}

void graphFunctions(std::vector<std::string> functions)
{
	SDL_Cartesian *cartesian = new SDL_Cartesian(WIDTH,HEIGHT,functions);
	cartesian->run();
	delete cartesian;
}

void graphPolar(std::string infix)
{
	SDL_Polar *polar = new SDL_Polar(WIDTH,HEIGHT,infix);
	polar->run();
	delete polar;
}

void graphPolars(std::vector<std::string> functions)
{
	SDL_Polar *polar = new SDL_Polar(WIDTH,HEIGHT,functions);
	polar->run();
	delete polar;
}

void graphParametric2D(std::vector<std::string> equations)
{
	printf("Just about to start...\n");
	SDL_Parametric2 *parametric = new SDL_Parametric2(WIDTH,HEIGHT,equations);
	parametric->run();
	delete parametric;
}

void solveQuadratic()
{
	printf("Variable list size: %d\n", Math::variables.size());
	double a,b,c,x1,x2;
	int i;
	std::string ans;
	printf("Enter A value: ");
	std::cin >> ans;
	if((i = Math::isVariable(ans)) != -1) {printf("Variable found: %s\n",Math::variables[i]->getName().c_str()); a = Math::variables[i]->getValue();}
	else a = atof(ans.c_str());
	printf("Enter B value: ");
	std::cin >> ans;
	if((i = Math::isVariable(ans)) != -1) {printf("Variable found: %s\n",Math::variables[i]->getName().c_str()); b = Math::variables[i]->getValue();}
	else b = atof(ans.c_str());
	printf("Enter C value: ");
	std::cin >> ans;
	if((i = Math::isVariable(ans)) != -1) {printf("Variable found: %s\n",Math::variables[i]->getName().c_str()); c = Math::variables[i]->getValue();}
	else c = atof(ans.c_str());
	printf("Performing black magic...\n");
	if(b*b - 4 * a * c < 0)
	{
		printf("No solutions :(\n");
	}
	else if(b*b - 4 * a * c == 0)
	{
		printf("1 solution was found.\nx = ");
		x1 = -b / (2 * a);
		printf("%f\n",x1);
	}
	else
	{
		printf("2 solutions found.\n");
		x1 = (-b + sqrt(b*b-4*a*c))/(2*a);
		x2 = (-b - sqrt(b*b-4*a*c))/(2*a);
		printf("x1 = %f\nx2 = %f\n",x1,x2);
	}
	std::cin.clear();
	std::cin.ignore();
}

std::string substring(std::string s, int start, int end)
{
	std::string sub;
	for(int c = start; c <= end; c++)
		sub += s[c];
	return sub;
}

void initialize()
{
	srand(time(NULL));
	std::stringstream path;
	path << getenv("HOME") << "/.savant/constants";
	printf("Opening a file...\n");
	std::ifstream file (path.str().c_str());
	std::string line;
	if(file.is_open())
	{
		printf("Recalling all constants...\n");
		while(getline(file,line))
		{
//			char name[64];
			std::string name;
			double value;
//			sscanf(line.c_str(),"%s %f",name,&value);
			std::stringstream s(line);
			s >> name >> value;
			variables.push_back(new Variable(name,value,true));
		}
	}
	else 
	{
		printf("Cannot open file: %s\n",path.str().c_str());
		std::ofstream f(NULL);
		f.open(path.str().c_str());
		f << "____ 666" << "\n";
		f.close();
	}
	file.close();

	Math::ANS = 0;

	intros.push_back("Contacting the President...\n");
	intros.push_back("Practicing Voodoo tactics...\n");
	intros.push_back("Comprehending The Matrix...\n");
	intros.push_back("Reading \'Finnegans Wake\'...\n");
	intros.push_back("Preparing for combat...\n");
	intros.push_back("Applying the Categorical Imperative...\n");
	intros.push_back("Counting red and yellow cars...\n");
	intros.push_back("Reciting \'Who\'s on first?\'...\n");
	intros.push_back("Insulting K-Mart...\n");
	intros.push_back("Takin' care of business...\n");
	intros.push_back("Saving Private Ryan...\n");
	intros.push_back("Reading your mind...\n");
	intros.push_back("Learning calculus...\n");
	intros.push_back("Studying the Talmud...\n");

	printf("%s\n",intros[rand()%intros.size()].c_str());

	Math::insults.push_back("Who do you think I am?");
	Math::insults.push_back("Are you nuts?");
	Math::insults.push_back("-_- <== That's what I gotta say about your math knowledge.");
	Math::insults.push_back("Rain Man can't even do that");
	Math::insults.push_back("How about \'no\'?");
	Math::insults.push_back("Are you... serious?");
	Math::insults.push_back("That's just stupid");
	Math::insults.push_back("Very funny.");
	Math::insults.push_back("I don't have time for this");
	Math::insults.push_back("Stop this Mickey Mouse stuff");
	Math::insults.push_back("Did I just see five yellow cars in a row, or are you just annoying me?");
	Math::insults.push_back("Hmmmm... You're one of THOSE people");
	Math::insults.push_back("Don't flatter yourself, idiot");
	Math::insults.push_back("Don't ever do that again");
	Math::insults.push_back("Pssssshhhhhhh...");
	Math::insults.push_back("I hope you have other \'talents\'");
	Math::insults.push_back("You're a raaaabid anti-dentite!");

	Math::colorNames[0] 	= "Yellow";
	Math::colorNames[1]	= "Red";
	Math::colorNames[2]	= "Blue";
	Math::colorNames[3]	= "Orange";
	Math::colorValues[0]	= 0xFFFF00;
	Math::colorValues[1]	= 0xFF4444;
	Math::colorValues[2]	= 0x4444FF;
	Math::colorValues[3]	= 0xFF6600;
}

void showHelp()
{
	printf("\n~Savant Help Menu~\n");
	printf("Here are the following Savant functions:\n\n");
	printf("def [variable name] [value]:\tCreates a constant variable of name [variable name] and sets it to the value [value] that is saved and can still be used after savant is closed.\n");
	printf("delete [variable name]:\t\tDeletes a constant variable that was created by \'def\'.\n");
	printf("function:\t\t\tPrompts for function, and then graphs it in a 2D Cartesian Plane\n");
	printf("function [1-4]:\t\t\tPrompts for up to 4 functions, and then graphs them simultaneously in a 2D Cartesian Plane\n");
	printf("polar:\t\t\t\tPrompts for function, and then graphs it in a 2D Polar Plane. \n");
	printf("polar [1-4]:\t\t\tPrompts for up to 4 functions and graphs them simultaneously in a 2D Polar Plane.\n");
	printf("parametric2:\t\t\tPrompts for two parametric equations, and graphs the corresponding parametric curve\n");
	printf("quadratic:\t\t\tPrompts for a,b,c values of a second degree polynomial, and solves for the zeroes\n");
	printf("clear:\t\t\t\tClears the terminal window\n");
	printf("exit:\t\t\t\tExits savant\n");
	printf("--------------------------------------------------------------------------------------------------\n");
	printf("To use the calculator, simply type in an expression and press ENTER.\n");
	printf("To refer to the previously calculated value, type \'ans\'. Be warned: \'ans\' will be overwritten after graphing a function\n");
	printf("To declare a variable for use and set its value equal to an expression, use the following form:\n");
	printf("\t[variable name] = [expression]\n");
	printf("\tEx.: energy = 0.5 * 4 * 3^2\n");
	printf("To view the value of a variable, just type in the variable name and press ENTER\n");
	printf("--------------------------------------------------------------------------------------------------\n");
	printf("======GRAPH CONTROLS======\n");
	printf("-:\tZoom Out\n");
	printf("=:\tZoom In\n");
	printf("Arrows:\tPan up, down, left, right\n");
	printf("Esc:\tExit graph\n");
	printf("\n");
}
