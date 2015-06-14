#include "./Txt.h"

int Txt::contains(std::string s, char c)
{
	for(int i = 0; i < s.size(); i++)
	{
		if(s[i] == c) return i;
	}

	return -1;
}

std::string Txt::substring(std::string s, int start, int end)
{
	std::string r = std::string();
	for(int c = start; c <= end; c++)
	{
		r += s[c];
	}
	return r;
}

std::string Txt::trimEnd(std::string s)
{
	std::string r = s;
	while(r.back() == ' ' || r.back() == '\t' || r.back() == '\n')
		r.pop_back();

	return r;
}

std::string Txt::trimFront(std::string s)
{
	std::string r = s;
	while(r[0] == ' ' || r[0] == '\t' || r[0] == '\n')
		r.erase(r.begin());

	return r;
}
