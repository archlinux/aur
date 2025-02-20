#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <sstream>
#include <map>
#include <algorithm>
#include <chrono>
#include <QMessageBox>

using namespace std;

vector<vector<string>> read_file(string filename, char delimeter);
map<string, vector<string>> convert_to_map(vector<vector<string>> data_table);
bool isNumber(const std::string& str);
map<string, string> get_values(map<string, vector<string>> data_map, string key_t);
