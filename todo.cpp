#include<iostream>
#include<vector>
#include<vector>
#include<string>
#include<fstream>
#include<string.h>
#include<sstream>
#include<cctype>

using namespace std;


#define    TODO_STATE 0
#define    DONE_STATE 1
#define    STANDBY_STATE 2
#define    MISSED_STATE 3


struct todo {
    int priorite;
    string str;
    int etat;
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
    switch(todoTask.etat ) {
        case DONE_STATE:
            os << "[" << (color ? "\e[32m✓\e[0m" : "x") << "] ";
        break;
        case TODO_STATE:
            os << "[" <<  " " << "] ";
        break;
        case STANDBY_STATE:
            os << "[" << (todoTask.etat ? (color ? "\e[33m~\e[0m" : "~") : " ") << "] ";
        break;
        case MISSED_STATE:
            os << "[" << (todoTask.etat ? (color ? "\e[34m#\e[0m" : "#") : " ") << "] ";
        break;
    }
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
    int startArgv = 2;

    if( argc > 1 )
        if( isalpha(argv[1][0]) && toupper(argv[1][0]) == argv[1][0] ) {
            action = 1;
            startArgv = 1;
        }else if( !strcmp( argv[1], "show") ) {
            action = 0;
        }else if ( !strcmp( argv[1], "add") ) {
            action = 1;
        }else if ( !strcmp( argv[1], "remove")  || !strcmp( argv[1], "rm") ) {
            action = 2;
        }else if ( !strcmp( argv[1], "check")   || !strcmp( argv[1], "ck") ) {
            action = 3;
        }else if ( !strcmp( argv[1], "uncheck") ) {
            action = 9;
        }else if ( !strcmp( argv[1], "standby") || !strcmp( argv[1], "st")
                                                || !strcmp( argv[1], "sb") ) {
            action = 10;
        }else if ( !strcmp( argv[1], "miss") ) {
            action = 11;
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
        }else if ( !strcmp( argv[1], "clean") || !strcmp( argv[1], "clear") 
                                              || !strcmp( argv[1], "cl")  ) {
            action = 7;
        }else if ( !strcmp( argv[1], "unchecked") || !strcmp( argv[1], "todo") ) {
            action = 8;
        }else {}
        else
            action = 0;
    if( action == -1 ) {
        cout << "Usage : todo [show,add,remove,check,uncheck,set,clean|clear|cl,checked,unchecked,todo]" << endl;
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
            case 0:   // Show
                for (auto it = begin(listTodo); it != end(listTodo); ++it)
                    cout << *it;

                return 0;
            case 1:  // Add
                {
                    string sargv("");
                    for( int i = startArgv ; i < argc ; i++) {
                        sargv += " ";
                        sargv += argv[i];
                    }
                    if( sargv == "" ) {
                        cout << "Chaine vide" << endl;
                        break;
                    } else {
                        for ( int i =  listTodo.size()-1; i >= 0 ; --i)
                            if( listTodo.at(i).str == sargv ) {
                                cerr << "Erreur doublon" << endl;
                                break;
                            }
                        listTodo.push_back(todoFromCmd(sargv));
                    }

                    break;
                }
            case 2: // Rm
                {
                    for ( int i =  listTodo.size()-1; i >= 0 ; --i) {
                        bool active = true;
                        for( int j = 2 ; j < argc && active ; j++ )
                            if( listTodo.at(i).str.find(argv[j]) == string::npos)
                                active = false;
                        if( active ) {
                            listTodo.erase(begin(listTodo)+i);
                            active = true;
                        }
                    }
                    break;
                }
            case 3:  // check
                for (auto it = begin(listTodo); it != end(listTodo); ++it) {
                    bool active = true;
                    for( int i = 2 ; i < argc && active ; i++ )
                        if( it->str.find(argv[i]) == string::npos)
                            active = false;
                    if( active )
                        it->etat = DONE_STATE;
                }

                break;
            case 4: // set
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
            case 5:  // s 
                for (auto it = begin(listTodo); it != end(listTodo); ++it)
                    if( it->priorite == atoi(argv[2]) )
                        cout << *it;
                return 0;
            case 6:  // Checked
                for (auto it = begin(listTodo); it != end(listTodo); ++it)
                    if( it->etat )
                        cout << *it;
                return 0;
            case 7:  // Clean
                {
                    for ( int i =  listTodo.size()-1; i >= 0 ; --i) {
                        if( listTodo.at(i).etat == DONE_STATE ||
                            listTodo.at(i).etat == MISSED_STATE)
                            listTodo.erase(begin(listTodo)+i);
                    }
                    break;
                }
            case 8:  // Unchecked
                for (auto it = begin(listTodo); it != end(listTodo); ++it)
                    if( !it->etat )
                        cout << *it;
                return 0;
            case 9:  // uncheck
                for (auto it = begin(listTodo); it != end(listTodo); ++it) {
                    bool active = true;
                    for( int i = 2 ; i < argc && active ; i++ )
                        if( it->str.find(argv[i]) == string::npos)
                            active = false;
                    if( active )
                        it->etat = TODO_STATE;
                }
                break;
            case 10:  // standby
                for (auto it = begin(listTodo); it != end(listTodo); ++it) {
                    bool active = true;
                    for( int i = 2 ; i < argc && active ; i++ )
                        if( it->str.find(argv[i]) == string::npos)
                            active = false;
                    if( active )
                        it->etat = STANDBY_STATE;
                }
                break;
            case 11:  // miss
                for (auto it = begin(listTodo); it != end(listTodo); ++it) {
                    bool active = true;
                    for( int i = 2 ; i < argc && active ; i++ )
                        if( it->str.find(argv[i]) == string::npos)
                            active = false;
                    if( active )
                        it->etat = MISSED_STATE;
                }
                break;
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
