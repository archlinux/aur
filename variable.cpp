#include "variable.h"

std::string Variable::getName()
{
	return name;
}

double Variable::getValue()
{
	return value;
}

void Variable::setValue(double val)
{
	value = val;
}
