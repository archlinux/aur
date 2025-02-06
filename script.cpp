#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <sstream>
#include <map>
#include <algorithm>

using namespace std;


vector<vector<string>> read_file(string filename, char delimeter){
    ifstream in(filename);
    string read;
    vector<vector<string>> data;
    while (getline(in, read)){
        vector<string> row;
        string elem;
        stringstream ss(read);
        while (getline(ss, elem, delimeter)){
            row.push_back(elem);
        }
        data.push_back(row);
    }
    in.close();
    return data;
}

map<string, vector<string>> convert_to_map(vector<vector<string>> data_table){
        vector<vector<string>> transvec(data_table[0].size(), vector<string>(data_table.size()));
    for (int i = 0; i < data_table.size(); i++){
        for (int j = 0; j < data_table[i].size(); j++){
            transvec[j][i] = data_table[i][j];
        }
    }
    map<string, vector<string>> map_data;
    for (int i = 0; i < transvec.size(); i++){
        vector<string> without_first_el = transvec[i];
        without_first_el.erase(without_first_el.begin());
        map_data[transvec[i][0]] = without_first_el;
    }
    return map_data;
}


bool isNumber(const std::string& str) {
    std::stringstream ss(str);
    double doubleValue;
    ss >> doubleValue;
    return ss.eof() && !ss.fail();
}

map<string, string> get_values(map<string, vector<string>> data_map, string key_t){
    map<string, string> data;
    auto min = *min_element(data_map[key_t].begin(), data_map[key_t].end());
    auto max = *max_element(data_map[key_t].begin(), data_map[key_t].end());
    long double sum = 0;
    for (int i = 0; i < data_map[key_t].size(); i++){
        if (isNumber(data_map[key_t][i])) sum += stoi(data_map[key_t][i]);
    }
    data["Минимальный элемент"] = min;
    data["Максимальный элемент"] = max;
    data["Сумма(если число)"] = to_string(sum);
    data["Кол-во элементов"] = to_string(data_map[key_t].size());
    return data;


}

void print_data(map<string, vector<string>> data_map, map<string, string> data){
    for(const auto& [key, value]: data_map){
        cout << key << " : ";
        for (const auto& elem: value){
            cout << elem << " ";
        }
        cout << endl;
    }
    cout << "\n\n\n\n" << endl;
    for (const auto& [key, value]: data){
        cout << key << " : " << value << endl;
    }
    cout << "\n\n\n\n" << endl;
}


int main(){
    string filename, key_t;
    char delimeter;
    cout << "Введите название файла: "; cin >> filename;
    cout << "Укажите разделитель (; | -): "; cin >> delimeter;
    cout << "Выберите заголовок столбца: "; cin >> key_t;
    cout << "\n\n\n\n" << endl;
    vector<vector<string>> data_table = read_file(filename, delimeter);
    map<string, vector<string>> data_map = convert_to_map(data_table);
    map<string, string> data = get_values(data_map, key_t);
    print_data(data_map, data);
}