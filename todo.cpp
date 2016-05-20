#include<iostream>
#include<vector>
#include<vector>
#include<string>
#include<fstream>
#include<string.h>
#include <sstream>

using namespace std;

struct todo {
    int priorite;
    string str;
    bool etat;
};

bool color;


todo todoFromCmd(string line) {
    todo tmp;
    tmp.etat = 0;
    istringstream streamLine(line);
    streamLine >> tmp.priorite;
    if( streamLine.good() == false) {
        tmp.priorite = 4;
        streamLine.clear();
        getline(streamLine, tmp.str);
        tmp.str = string(" ") + tmp.str;
    } else
        getline(streamLine, tmp.str);
    return tmp;
}
todo todoFromLine(string line) {
    todo tmp;
    istringstream streamLine(line);
    streamLine >> tmp.priorite;
    streamLine >> tmp.etat;
    getline(streamLine, tmp.str);

    return tmp;
}
ostream& operator<<( ostream& os, const todo& todoTask)
{
    os << "[" << (todoTask.etat ? (color ? "\e[32m✓\e[0m" : "x") : " ") << "] ";
    if( todoTask.priorite == 1  && color)
        os << "\e[31m";
    else if( todoTask.priorite == 2 && color)
        os << "\e[36m";
    else if( todoTask.priorite == 3 && color)
        os << "\e[32m";

    os << todoTask.str;

    color && os << "\e[0m";
    os << endl;
    return os;
}

int main(int argc, char *argv[]) {
    color = true;
    vector<todo> listTodo;
    int action = -1;
    if( argc > 1 )
        if( !strcmp( argv[1], "show") ) {
            action = 0;
        }else if ( !strcmp( argv[1], "add") ) {
            action = 1;
        }else if ( !strcmp( argv[1], "remove") ) {
            action = 2;
        }else if ( !strcmp( argv[1], "check") ) {
            action = 3;
        }else if ( !strcmp( argv[1], "set") ) {
            if( argc > 2 && argv[2][0] >= '0' && argv[2][0] <= '9' )
                action = 4;
            else
                cout << "Erreur : Priorité non interprétable" << endl;
        }else if ( !strcmp( argv[1], "s") ) {
            if( argc > 2 && argv[2][0] >= '0' && argv[2][0] <= '9' )
                action = 5,color = false;
            else
                cout << "Erreur : Priorité non interprétable" << endl;
        }else if ( !strcmp( argv[1], "checked") ) {
            action = 6;
        }else if ( !strcmp( argv[1], "clean") || !strcmp( argv[1], "clear") ) {
            action = 7;
        }else if ( !strcmp( argv[1], "unchecked") || !strcmp( argv[1], "todo") ) {
            action = 8;
        }else {}
        else
            action = 0;
    if( action == -1 ) {
        cout << "Usage : todo [show,add,remove,check,set,clean/clear,checked,unchecked/todo]" << endl;
    } else {
        ifstream file(".todo.txt", ios::in);

        if( file ) {
            string line;
            while( getline(file, line) ) {
                listTodo.push_back(todoFromLine(line));
            }
            file.close();
        } else if(action != 1 ){
            return 1;
        }
        switch( action ) {
            case 0:
                for (auto it = begin(listTodo); it != end(listTodo); ++it)
                    cout << *it;

                return 0;
            case 1:
                {
                    string sargv("");
                    for( int i = 2 ; i < argc ; i++) {
                        sargv += " ";
                        sargv += argv[i];
                    }
                    if( sargv == "" ) {
                        cout << "Chaine vide" << endl;
                        break;
                    } else
                        listTodo.push_back(todoFromCmd(sargv));

                    break;
                }
            case 2:
                {
                    for ( int i =  listTodo.size()-1; i >= 0 ; --i) {
                        bool active = true;
                        for( int j = 2 ; j < argc && active ; j++ )
                            if( listTodo.at(i).str.find(argv[j]) == string::npos)
                                active = false;
                        if( active )
                            listTodo.erase(begin(listTodo)+i);
                    }
                    break;
                }
            case 3:
                for (auto it = begin(listTodo); it != end(listTodo); ++it) {
                    bool active = true;
                    for( int i = 2 ; i < argc && active ; i++ )
                        if( it->str.find(argv[i]) == string::npos)
                            active = false;
                    if( active )
                        it->etat = 1;
                }

                break;
            case 4:
                for (auto it = begin(listTodo); it != end(listTodo); ++it) {
                    bool active = true;
                    for( int i = 3 ; i < argc && active ; i++ )
                        if( it->str.find(argv[i]) == string::npos)
                            active = false;
                    if( active ) {
                        it->priorite = atoi(argv[2]);
                    }
                }
                break;
            case 5:
                for (auto it = begin(listTodo); it != end(listTodo); ++it)
                    if( it->priorite == atoi(argv[2]) )
                        cout << *it;
                return 0;
            case 6:
                for (auto it = begin(listTodo); it != end(listTodo); ++it)
                    if( it->etat )
                        cout << *it;
                return 0;
            case 7:
                {
                    for ( int i =  listTodo.size()-1; i >= 0 ; --i) {
                        if( listTodo.at(i).etat )
                            listTodo.erase(begin(listTodo)+i);
                    }
                    break;
                }
            case 8:
                for (auto it = begin(listTodo); it != end(listTodo); ++it)
                    if( !it->etat )
                        cout << *it;
                return 0;
            default:
                cout << "Erreur : Action incomprise" << endl;
        }
        ofstream fileO(".todo.txt", ios::out);
        if( fileO ) {
            for (auto it = begin(listTodo); it != end(listTodo); ++it)
                fileO << it->priorite << " " << it->etat << it->str << endl;
            fileO.close();
        } else {
            cout << "Erreur : Aucune modification effectuée" << endl;
        }

    }

    return 0;
}
