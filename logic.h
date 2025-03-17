#include <iostream>
#include <stack>
#include <string>
#include <vector>
#include <map>
#include <cmath>

#define M_PI 3.14159265358979323846

using namespace std;

bool valid_input(string& expression);
bool valid_brackets(string& expression);
bool valid_operation(vector<string>& postfix);
vector<string> get_token(string& expression);
vector<string> convert_to_postfix(vector<string>& tokens);
double calculate_postfix(vector<string>& postfix);
