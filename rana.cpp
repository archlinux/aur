/*Rana: a better syntax to markup*/

#include <string>
#include <cstdio>	//file i/o
#include <cstdlib>	//exit()
#include <vector>
#include "helper.h"

using namespace std;

string infile = "\0", outfile = "\0", o_ext = "\0";
int mode = NEW_TAG;
vector<string> tag_names;

int parseArgs(int argc, char** argv);
vector<unsigned char> ftov(string fileName);

int main (int argc, char** argv){

	int res = parseArgs(argc, argv);
	if (res < 0){
		printf(help());
		return res;
	}

	if (infile == "\0") {
		printf(help());
		return WRONG_INPUT_FILE;
	}

	if (outfile == "\0") {
		if (has_suffix(infile, '.' + EXT))
			outfile = split(infile, '.')[0] + '.' + (o_ext == "\0" ? "html" : o_ext);

		else if (is_markup(infile))
			outfile = split(infile, '.')[0] + '.' + EXT;

		else {
			printf(help());
			return WRONG_OUTPUT_FILE;
		}
	}
	
	vector<unsigned char> v = ftov(infile);

	if (FILE *out = fopen(outfile.c_str(), "w")) {
		string tag_name = "";
		bool quoting = false;
		for (int i = 0; i < v.size(); i++) {
			switch (v.at(i)) {
				case '(':
					mode = ARGUMENTS;
					break;
				case '{':
					if (mode != ARGUMENTS) mode = CONTENT;
					break;
				case '}':
					if (mode != ARGUMENTS) mode = NEXT_TAG;
					break;
				case ')':
					mode = EXPECT_CONTENT;
					break;
				case '"':
					if (!is_escaped(v, i) && mode != ARGUMENTS)
						mode = QUOTING_INGORE_QUOTES;
					break;
				case ' ':
				case '\n':
				case '\t':
					if (mode != ARGUMENTS)
						mode = COPY;
					break;
				default:
					if (mode != ARGUMENTS)
						mode = NEW_TAG;
			}

			switch (mode) {
				case ARGUMENTS:
					if (v.at(i) == '(' && !quoting && v.at(i + 1) != ')')
						fprintf(out, " ");
					else if (v.at(i) != '(') fprintf(out, "%c", v.at(i));
					if (v.at(i) == '"' && !is_escaped(v, i))
						quoting = !quoting;
					break;
				case CONTENT:
					mode = COPY;
					break;
				case NEXT_TAG:
					fprintf(out, "</%s>", tag_names.at(tag_names.size() - 1).c_str());
					tag_names.pop_back();
					mode = COPY;
					break;
				case EXPECT_CONTENT:
					fprintf(out, "%c", '>');
					mode = COPY;
					break;
				case NEW_TAG:
					tag_name = "";
					for (; v.at(i) != '(' && i < v.size(); i++)
						tag_name += v.at(i);

					tag_names.push_back(tag_name);
					fprintf(out, "<%s", tag_name.c_str());
					mode = COPY;
					i--;
					break;
				case QUOTING_INGORE_QUOTES:
					i++;
					while (v.at(i) != '"' || (v.at(i) == '"' && is_escaped(v, i))) {
						if (v.at(i) == '\\') {
							for (; v.at(i) == '\\'; i++);

							if (v.at(i) == '"' && is_escaped(v, i)) {
								fprintf(out, "%c", v.at(i));
								i++;
							}

							else
								for (i--; v.at(i) == '\\'; i++)
									if (is_escaped(v, i)) fprintf(out, "%c", v.at(i));
						}
						else {
							fprintf(out, "%c", v.at(i));
							i++;
						}
					}
					break;
				case COPY:
					fprintf(out, "%c", v.at(i));
					break;
			}
		}
		fclose(out);
	} else {
		printf("unable to write to output. do you have the required permissions?\n");
		return NO_PERMISSIONS;
	}

	return 0;
}

int parseArgs(int argc, char** argv) {
	int ignore = -1;
	char argfor = '\0';
	for (int i = 1; i < argc; i++) {

		if (argv[i][0] != '-' && i != ignore) {
			infile = argv[i];
			ignore = -1;

		} else if (argfor != '\0') {

			switch (argfor) {
				case 'o':
					outfile = argv[i];
					break;
				case 'e':
					o_ext = argv[i];
					break;
				default:
					return WRONG_OPTION;
			}
			argfor = '\0';

		} else if (req_arg(argv[i][1])){
			ignore = i + 1;
			argfor = argv[i][1];
			
		} else
			switch (argv[i][1]) {
				case 'v':
					printf("%s\n", VERSION);
					return 0;

				case 'h':
					printf(help());

					return 0;

				case 'l':
					printf(license());
					return 0;
					
				default:
					return WRONG_OPTION;
			}
	}
	return 0;
}

vector<unsigned char> ftov(string fileName) {
	vector<unsigned char> tmp;
	if (FILE *fp = fopen(fileName.c_str(), "r")) {
		char buf[1024];
		while (size_t len = fread(buf, 1, sizeof(buf), fp))
			tmp.insert(tmp.end(), buf, buf + len);
		fclose(fp);
	} else {
		printf("Unable to open \"%s\".\n", fileName.c_str());
		exit(WRONG_INPUT_FILE);
	}
	return tmp;
}
