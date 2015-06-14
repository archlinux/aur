#ifndef _TXT_H_
#define _TXT_H_

#include "destructive_reasoning.h"

class Txt
{
	public:
		static int contains(std::string s, char c);
		static std::string trimEnd(std::string s);
		static std::string trimFront(std::string s);
		static std::string substring(std::string s, int start, int end);
};

#endif
