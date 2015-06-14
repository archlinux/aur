#ifndef _VARIABLE_H_
#define _VARIABLE_H_

#include "destructive_reasoning.h"

class Variable
{
	public:
		Variable(std::string n, double v, bool isConstant) : name(n), value(v), constant(isConstant) {};
		std::string getName();
		double getValue(); 
		inline bool isConstant() { return constant; };

		void setValue(double val);

	private:
		std::string name;
		double value;
		bool constant;
};

#endif
