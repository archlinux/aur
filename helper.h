#include <string>
#include <vector>

using namespace std;

#define NO_PERMISSIONS -4
#define WRONG_OUTPUT_FILE -3
#define WRONG_INPUT_FILE -2
#define WRONG_OPTION -1

#define ARGUMENTS 0			//args inside () become args inside opening tag <>
#define CONTENT 1			//just act based on what you find
#define EXPECT_CONTENT 3	//end opening tag
#define NEXT_TAG 4			//close current tag </>
#define NEW_TAG 5			//open a new tag
#define QUOTING_INGORE_QUOTES 6		//for just plain text
#define COPY 7				//everything that's not part of the syntax basipally

#define VERSION "0.0.1"
string EXT = "rn";

bool req_arg (char a) {
	char args[] = {'o', 'e'};

	for (int i = 0; i < 2; i++)
		if (a == args[i]) return true;

	return false;
}

const char* help () {
	return "\
    Rana gives HTML a better syntax.\n\n\
    usage:\n\
    rana [options] <infile>\n\n\
    -o <outfile>\n\
    -e <out_extension>\n\
    -v\tPrint version number and exit\n\
    -l\tPrint a short version of the license\n\
    -h\tPrint this and exit\n";
}

const char* license(){
    return "    Rana: a better syntax for SGML\n\
    Copyright (C) 2016 DP Development\n\
    \n\
    This program is free software: you can redistribute it and/or modify\n\
    it under the terms of the GNU General Public License as published by\n\
    the Free Software Foundation, either version 3 of the License, or\n\
    (at your option) any later version.\n\
    \n\
    This program is distributed in the hope that it will be useful,\n\
    but WITHOUT ANY WARRANTY; without even the implied warranty of\n\
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n\
    GNU General Public License for more details.\n\
    \n\
    You should have received a copy of the GNU General Public License\n\
    along with this program.  If not, see <http://www.gnu.org/licenses/>.\n\n";
}

vector<string> split(const string &text, char sep) {
    vector<string> tokens;
    size_t start = 0, end = 0;
    while ((end = text.find(sep, start)) != string::npos) {
        string temp = text.substr(start, end - start);
        if (temp != "") tokens.push_back(temp);
        start = end + 1;
    }
    string temp = text.substr(start);
    if (temp != "") tokens.push_back(temp);
    return tokens;
}

bool has_suffix(const string &str, const string &suffix) {
    return str.size() >= suffix.size() &&
           str.compare(str.size() - suffix.size(), suffix.size(), suffix) == 0;
}

bool is_markup(string in) {
	return has_suffix(in, "ml");
}

bool is_escaped(vector<unsigned char> v, int p) {
    return (p == 0 || v.at(p - 1) != '\\') ? false : !is_escaped(v, p - 1);
}