#include<iostream>
#include<vector>
#include<vector>
#include<string>
#include<fstream>
#include<string.h>
#include<sstream>
#include<cctype>
#include<unistd.h>

using namespace std;


#define    TODO_STATE 0
#define    DONE_STATE 1
#define    STANDBY_STATE 2
#define    MISSED_STATE 3

#define USAGE_STRING "Usage : todo [CMD] || todo [SENTENCE]"            "\n" \
    "Where CMD can be :"                                                "\n" \
    "        show                    to show the todo list"             "\n" \
    "           -- todo"                                                "\n" \
    "        add [ITEM]              to add a item"                     "\n" \
    "        remove [STRS]           to remove an item"                 "\n" \
    "           -- rm"                                                  "\n" \
    "        check [STRS]            to validate an item"               "\n" \
    "           -- ck"                                                  "\n" \
    "        standby [STRS]          to put an item in standby"         "\n" \
    "           -- st | sb"                                             "\n" \
    "        uncheck [STRS]          to devalidate an item"             "\n" \
    "           -- uck"                                                 "\n" \
    "        miss [STRS]             to set a item as missed"           "\n" \
    "        set [STRS]              to priorise an item"               "\n" \
    "                [10 levels of priority 0-9]"                       "\n" \
    "        checked [STRS]          to show only checked items"        "\n" \
    "        unchecked [STRS]        to show only unchecked items"      "\n" \
    "        edit [STRS]             to edit items"                     "\n" \
    "           -- e"                                                   "\n" \
    "        clean                   to remove finshed items"           "\n" \
    "            -- clear | cl"                                         "\n" \
    ""                                                                  "\n" \
    "Where SENTENCE must be a sentence starting by a upper latin letter" "\n" \
    ""                                                                  "\n" \
    " [STRS] is a list of strings. The action will be applicated to"    "\n" \
    " every items who contains all the strings of the list."            "\n" \
    ""                                                                  "\n" \
    " [ITEM] is a list of strings who formed a todo-item"               "\n"



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

template<typename Functor>
void modifyTODO( vector<todo>& listTodo, int argc, char* argv[], Functor modif  ) {
    for (auto it = begin(listTodo); it != end(listTodo); ++it) {
    bool active = true;

    for( int i = 0 ; i < argc && active ; i++ )
        if( it->str.find(argv[i]) == string::npos)
            active = false;
        if( active ) {
            cout << " # " << it->str << endl;
            modif(*it);
        }
    }
}


int main(int argc, char *argv[]) {
    color = true;
    vector<todo> listTodo;
    int action = -1;
    int startArgv = 2;

    if( argc > 1 ) {
        // Si la première lettre est une majuscule
        bool ok = false;
        const char* accents[] = {"É", "È", "Ê","À","Â","Ç"};
        for(size_t t = 0 ; t < sizeof accents /sizeof *accents ; t++) {
            if( strncmp(argv[1], accents[t], 2 ) == 0 ) {
                ok = true;
            }
        }
        if( (isalpha(argv[1][0]) && toupper(argv[1][0]) == argv[1][0]) || ok ) {
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
        }else if ( !strcmp( argv[1], "uncheck") || !strcmp( argv[1], "uck") ) {
            action = 9;
        }else if ( !strcmp( argv[1], "standby") || !strcmp( argv[1], "st")
                                                || !strcmp( argv[1], "sb") ) {
            action = 10;
        }else if ( !strcmp( argv[1], "miss") ) {
            action = 11;
        }else if ( !strcmp( argv[1], "set") || !(strcmp(argv[1], "s")) ) {
            if( argc > 2 && argv[2][0] >= '0' && argv[2][0] <= '9' )
                action = 4;
            else
                cout << "Erreur : Priorité non interprétable" << endl;
        }else if ( !strcmp( argv[1], "get") ) {
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
        }else if ( !strcmp( argv[1], "edit") || !strcmp( argv[1], "mod") 
                                             || !strcmp( argv[1], "e")  ) {
            action = 12;
        }else {}
        else
            action = 0;
    if( action == -1 ) {
        cout << USAGE_STRING << endl;
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
                                exit(-1);
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
                            cout << " - " << listTodo.at(i).str << endl;
                            listTodo.erase(begin(listTodo)+i);
                            active = true;
                        }
                    }
                    break;
                }
            case 3:  // check
                modifyTODO( listTodo, argc-2, argv+2, [](todo& it) { it.etat = DONE_STATE; });
                break;
                case 4: // set
                    {
                        int priority = atoi(argv[2]);
                        modifyTODO( listTodo, argc-3, argv+3, [priority](todo& it) { it.priorite = priority; });
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
                            listTodo.at(i).etat == MISSED_STATE) {
                            cout << " - " << listTodo.at(i).str << endl;
                            listTodo.erase(begin(listTodo)+i);
                        }
                    }
                    break;
                }
            case 8:  // Unchecked
                for (auto it = begin(listTodo); it != end(listTodo); ++it)
                    if( !it->etat )
                        cout << *it;
                return 0;
            case 9:  // uncheck
                modifyTODO( listTodo, argc-2, argv+2, [](todo& it) { it.etat = TODO_STATE; });
                break;
            case 10:  // standby
                modifyTODO( listTodo, argc-2, argv+2, [](todo& it) { it.etat = STANDBY_STATE; });
                break;
            case 11:  // miss
                modifyTODO( listTodo, argc-2, argv+2, [](todo& it) { it.etat = MISSED_STATE; });
                break;
            case 12: // Edit
                for (auto it = begin(listTodo); it != end(listTodo); ++it) {
                    bool active = true;
                    for( int i = 2 ; i < argc && active ; i++ )
                        if( it->str.find(argv[i]) == string::npos)
                            active = false;
                    if( active ) {
                        const char* defaultEditor = "vim",
                                  * const envEditor = getenv("EDITOR"),
                                  * const visEditor = getenv("VISUAL");
                        if( envEditor && envEditor[0] ) {
                            defaultEditor = envEditor;
                        }
                        if( visEditor && visEditor[0] ) {
                            defaultEditor = visEditor;
                        }
                        FILE* tmp = NULL;
                        char fileName[] = "todo.cpp_XXXXXX";
                        int fd = mkstemp(fileName);
                        if( strlen( it->str.c_str() ) > 0 ) {
                            write(fd, it->str.c_str()+1,
                                     strlen(it->str.c_str()) -1 );
                        }
                        close(fd);

                        char* cmd = new char[ 2 + strlen(defaultEditor) + 
                                                strlen(fileName) ];
                        sprintf( cmd, "%s %s", defaultEditor, fileName);

                        system(cmd);


                        ifstream file(fileName, ios::in);

                        if( file ) {
                            string line;
                            bool first = true;
                            while( getline(file, line) ) {
                                if( ! first ) {
                                    first = false;
                                    cerr << "Erreur : Edition multi-lignes" <<
                                            "Seule la première ligne serra "
                                            " prise en compte" << endl;
                                    break;
                                }
                                it->str = string(" ")  + line;
                            }
                            file.close();
                        }else {
                            cerr << "Impossible d'ouvrir le fichier "
                                    "temporaire" << fileName << endl;
                        }


                        unlink( fileName );
                        delete[] cmd;
                        cout << " # " << it->str << endl;
                    }
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
