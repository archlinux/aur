#include <iostream>
#include <string>
#include <vector>
#include <sstream>
#include <unistd.h>
#include <sys/wait.h>
#include <cstring>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <dirent.h>
#include <map>
#include <ctime>
#include <pwd.h>
#include <algorithm>
#include <iterator>
#include <fstream>
#include <filesystem>
#include <readline/readline.h>
#include <readline/history.h>
#include <sys/ioctl.h>
#include <iomanip>
#include <signal.h>
#include <regex>
#include <readline/rltypedefs.h>

std::vector<std::string> split(const std::string& line) {
    std::vector<std::string> tokens;
    std::string token;
    bool in_single = false, in_double = false, escape = false;
    for (size_t i = 0; i < line.size(); ++i) {
        char c = line[i];
        if (escape) {
            token += c;
            escape = false;
        } else if (c == '\\') {
            escape = true;
        } else if (c == '"' && !in_single) {
            in_double = !in_double;
        } else if (c == '\'' && !in_double) {
            in_single = !in_single;
        } else if (isspace(c) && !in_single && !in_double) {
            if (!token.empty()) {
                tokens.push_back(token);
                token.clear();
            }
        } else {
            token += c;
        }
    }
    if (!token.empty()) tokens.push_back(token);
    return tokens;
}

const std::string HISTORY_FILE = std::string(getenv("HOME")) + "/.goonsh_history";
void load_history_file() {
    read_history(HISTORY_FILE.c_str());
}
void save_history_file() {
    write_history(HISTORY_FILE.c_str());
}

const std::string RC_FILE = std::string(getenv("HOME")) + "/.goonshrc";
void load_config(std::map<std::string, std::string>& aliases, std::string& prompt, std::vector<std::string>& rc_commands) {
    std::ifstream file(RC_FILE);
    std::string line;
    while (std::getline(file, line)) {
        if (line.rfind("alias ", 0) == 0) {
            auto eq = line.find('=');
            if (eq != std::string::npos) {
                std::string k = line.substr(6, eq-6);
                std::string v = line.substr(eq+1);
                v.erase(std::remove(v.begin(), v.end(), '"'), v.end());
                v.erase(std::remove(v.begin(), v.end(), '\''), v.end());
                aliases[k] = v;
            }
        } else if (line.rfind("prompt=", 0) == 0) {
            prompt = line.substr(7);
        } else if (!line.empty() && line[0] != '#') {
            rc_commands.push_back(line);
        }
    }
}

void print_help() {
    std::cout << "Available commands:\ncd, ls, pwd, echo, cat, touch, rm, mkdir, rmdir, cp, mv, head, tail, grep, wc, whoami, date, env, export, unset, history, which, clear, alias, unalias, help, exit, quit, [external commands]" << std::endl;
}

std::vector<std::string> get_path_commands() {
    std::vector<std::string> cmds;
    char* path = getenv("PATH");
    if (!path) return cmds;
    std::istringstream iss(path);
    std::string dir;
    while (std::getline(iss, dir, ':')) {
        DIR* d = opendir(dir.c_str());
        if (!d) continue;
        struct dirent* entry;
        while ((entry = readdir(d))) {
            if (entry->d_type == DT_REG || entry->d_type == DT_LNK || entry->d_type == DT_UNKNOWN)
                cmds.push_back(entry->d_name);
        }
        closedir(d);
    }
    std::sort(cmds.begin(), cmds.end());
    cmds.erase(std::unique(cmds.begin(), cmds.end()), cmds.end());
    return cmds;
}

std::string expand_envvars(const std::string& input);
std::string expand_path(const std::string& path) {
    std::string p = path;
    // Expand ~ to home
    if (!p.empty() && p[0] == '~') {
        const char* home = getenv("HOME");
        if (home) p = std::string(home) + p.substr(1);
    }
    // Expand envvars
    p = expand_envvars(p);
    return p;
}

std::vector<std::string> get_files(const std::string& prefix) {
    std::vector<std::string> files;
    std::string expanded_prefix = expand_path(prefix);
    std::string dir = ".";
    std::string file_prefix = expanded_prefix;
    auto slash = expanded_prefix.rfind('/');
    std::string user_prefix = prefix;
    if (slash != std::string::npos) {
        dir = expanded_prefix.substr(0, slash);
        file_prefix = expanded_prefix.substr(slash+1);
        user_prefix = prefix.substr(0, prefix.rfind('/')+1);
    } else {
        user_prefix = "";
    }
    DIR* d = opendir(dir.c_str());
    if (!d) return files;
    struct dirent* entry;
    while ((entry = readdir(d))) {
        std::string name = entry->d_name;
        if (name.find(file_prefix) == 0) {
            std::string fullpath = dir + "/" + name;
            struct stat st;
            if (stat(fullpath.c_str(), &st) == 0 && S_ISDIR(st.st_mode)) {
                files.push_back(user_prefix + name + "/");
            } else {
                files.push_back(user_prefix + name);
            }
        }
    }
    closedir(d);
    std::sort(files.begin(), files.end());
    return files;
}

std::vector<std::string> builtins = {"cd","ls","pwd","echo","cat","touch","rm","mkdir","rmdir","cp","mv","head","tail","grep","wc","whoami","date","env","export","unset","history","which","clear","alias","unalias","help","exit","quit"};
std::map<std::string, std::string> aliases;

char* completion_generator(const char* text, int state) {
    static size_t list_index;
    static std::vector<std::string> matches;
    if (state == 0) {
        matches.clear();
        std::string prefix(text);
        // Command completion for first word
        rl_completion_append_character = ' ';
        if (rl_point == 0 || (rl_line_buffer && std::string(rl_line_buffer).find(' ') == std::string::npos)) {
            for (const auto& b : builtins) if (b.find(prefix) == 0) matches.push_back(b);
            for (const auto& a : aliases) if (a.first.find(prefix) == 0) matches.push_back(a.first);
            for (const auto& c : get_path_commands()) if (c.find(prefix) == 0) matches.push_back(c);
        } else {
            // File completion
            for (const auto& f : get_files(prefix)) matches.push_back(f);
        }
        list_index = 0;
    }
    if (list_index < matches.size()) {
        return strdup(matches[list_index++].c_str());
    }
    return nullptr;
}

char** goonsh_completion(const char* text, int start, int end) {
    (void)start; (void)end;
    return rl_completion_matches(text, completion_generator);
}

void sigint_handler(int) {
    std::cout << std::endl;
    rl_on_new_line();
    rl_replace_line("", 0);
    rl_redisplay();
}

// Expand environment variables in a string (e.g., "$HOME/foo" -> "/home/user/foo")
std::string expand_envvars(const std::string& input) {
    std::string result;
    std::regex env_re(R"(\$([A-Za-z_][A-Za-z0-9_]*))");
    std::sregex_iterator it(input.begin(), input.end(), env_re), end;
    size_t last = 0;
    for (; it != end; ++it) {
        result += input.substr(last, it->position() - last);
        const char* val = getenv((*it)[1].str().c_str());
        if (val) result += val;
        last = it->position() + it->length();
    }
    result += input.substr(last);
    return result;
}

// Expand envvars in all args
std::vector<std::string> expand_args(const std::vector<std::string>& args) {
    std::vector<std::string> out;
    for (const auto& arg : args) out.push_back(expand_envvars(arg));
    return out;
}

// --- Autosuggestion logic ---
std::string current_suggestion;

// Find a suggestion from history that starts with the current input
std::string find_suggestion(const char* input) {
    HIST_ENTRY** hist = history_list();
    if (!hist) return "";
    std::string prefix = input ? input : "";
    if (prefix.empty()) return "";
    for (int i = history_length - 1; i >= 0; --i) {
        std::string h = hist[i]->line;
        if (h.find(prefix) == 0 && h != prefix) {
            return h.substr(prefix.size());
        }
    }
    return "";
}

// Custom redisplay to show autosuggestion
void goonsh_redisplay() {
    rl_redisplay();
    std::string suggestion = find_suggestion(rl_line_buffer);
    if (!suggestion.empty()) {
        // Save cursor position
        printf("\033[s");
        // Print suggestion in gray
        printf("\033[90m%s\033[0m", suggestion.c_str());
        // Restore cursor
        printf("\033[u");
        fflush(stdout);
    } else if (current_suggestion.length() > 0) {
        // Clear previous suggestion if input is now empty or no suggestion
        printf("\033[s");
        for (size_t i = 0; i < current_suggestion.length(); ++i) putchar(' ');
        printf("\033[u");
        fflush(stdout);
    }
    current_suggestion = suggestion;
}

// Accept suggestion with right arrow
int accept_suggestion(int, int) {
    if (!current_suggestion.empty()) {
        rl_insert_text(current_suggestion.c_str());
        rl_point = rl_end;
        current_suggestion.clear();
        rl_redisplay();
        return 0;
    }
    return 0;
}

int main() {
    std::string line;
    std::string prompt = "goonsh$ ";
    std::vector<std::string> rc_commands;
    load_config(aliases, prompt, rc_commands);
    load_history_file();
    rl_attempted_completion_function = goonsh_completion;
    rl_redisplay_function = goonsh_redisplay;
    rl_bind_keyseq("\033[C", accept_suggestion); // Right arrow
    signal(SIGINT, sigint_handler);
    std::cout << "Welcome To Goonsh >~< (Type 'help' for commands. 'exit' or 'quit' to leave)" << std::endl;

    // Execute commands from ~/.goonshrc
    int last_status = 0;
    for (const auto& rc_line : rc_commands) {
        if (rc_line.empty()) continue;
        auto args = split(rc_line);
        if (args.empty()) continue;
        // Alias expansion
        if (aliases.count(args[0])) {
            std::vector<std::string> alias_args = split(aliases[args[0]]);
            alias_args.insert(alias_args.end(), args.begin() + 1, args.end());
            args = alias_args;
        }
        // Expand envvars in all args
        args = expand_args(args);
        // Inline assignment: VAR=val
        if (args[0].find('=') != std::string::npos && args[0].find('=') != 0 && args[0].find('=') < args[0].size()-1 && args[0].find_first_of(" ") == std::string::npos) {
            auto eq = args[0].find('=');
            std::string var = args[0].substr(0, eq);
            std::string val = args[0].substr(eq+1);
            setenv(var.c_str(), val.c_str(), 1);
            continue;
        }
        std::string cmd = args[0];
        if (cmd == "exit" || cmd == "quit") break;
        if (cmd == "help") { print_help(); continue; }
        if (cmd == "cd") {
            const char* target = (args.size() > 1) ? args[1].c_str() : getenv("HOME");
            if (chdir(target) != 0) {
                perror("cd");
            }
            continue;
        }
        if (cmd == "export") {
            if (args.size() == 2 && args[1].find('=') != std::string::npos) {
                auto eq = args[1].find('=');
                std::string var = args[1].substr(0, eq);
                std::string val = args[1].substr(eq+1);
                setenv(var.c_str(), val.c_str(), 1);
            } else if (args.size() == 2) {
                setenv(args[1].c_str(), getenv(args[1].c_str()) ? getenv(args[1].c_str()) : "", 1);
            } else {
                std::cerr << "Usage: export VAR or export VAR=val" << std::endl;
            }
            continue;
        }
        if (cmd == "unset") {
            if (args.size() == 2) {
                unsetenv(args[1].c_str());
            } else {
                std::cerr << "Usage: unset VAR" << std::endl;
            }
            continue;
        }
        if (cmd == "env") {
            extern char **environ;
            for (char **env = environ; *env; ++env) {
                std::cout << *env << std::endl;
            }
            continue;
        }
        if (cmd == "ls") {
            std::string path = (args.size() > 1) ? args[1] : ".";
            DIR* dir = opendir(path.c_str());
            if (!dir) { perror("ls"); continue; }
            std::vector<std::string> files;
            struct dirent* entry;
            size_t maxlen = 0;
            while ((entry = readdir(dir))) {
                if (strcmp(entry->d_name, ".") && strcmp(entry->d_name, "..")) {
                    files.push_back(entry->d_name);
                    size_t len = strlen(entry->d_name);
                    if (len > maxlen) maxlen = len;
                }
            }
            closedir(dir);
            // Get terminal width
            int term_width = 80;
            struct winsize w;
            if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &w) == 0) {
                term_width = w.ws_col;
            }
            size_t col_width = maxlen + 2;
            int cols = term_width / col_width;
            if (cols < 1) cols = 1;
            int rows = (files.size() + cols - 1) / cols;
            for (int r = 0; r < rows; ++r) {
                for (int c = 0; c < cols; ++c) {
                    int idx = c * rows + r;
                    if (idx < (int)files.size()) {
                        std::cout << std::left << std::setw(col_width) << files[idx];
                    }
                }
                std::cout << std::endl;
            }
            continue;
        }
        // External command
        pid_t pid = fork();
        if (pid == 0) {
            std::vector<char*> cargs;
            for (auto& arg : args) cargs.push_back(const_cast<char*>(arg.c_str()));
            cargs.push_back(nullptr);
            execvp(cargs[0], cargs.data());
            std::cerr << "goonsh: command not found: " << args[0] << std::endl;
            exit(127);
        } else if (pid > 0) {
            int status;
            waitpid(pid, &status, 0);
            last_status = WIFEXITED(status) ? WEXITSTATUS(status) : 1;
        } else {
            perror("fork");
            last_status = 1;
        }
    }

    while (true) {
        bool should_exit = false;
                char* input = readline(prompt.c_str());
        if (!input) {
            break;
        }
        line = input;
        free(input);
        // Remove comments (not inside quotes)
        bool in_single = false, in_double = false;
        for (size_t i = 0; i < line.size(); ++i) {
            if (line[i] == '"' && !in_single) in_double = !in_double;
            else if (line[i] == '\'' && !in_double) in_single = !in_single;
            else if (line[i] == '#' && !in_single && !in_double) { line = line.substr(0, i); break; }
        }
        // Ignore empty/whitespace-only input
        if (line.find_first_not_of(" \t\r\n") == std::string::npos) continue;
        add_history(line.c_str());

        // Advanced command chaining: split by ;, &&, || (not in quotes)
        std::vector<std::pair<std::string, std::string>> segments; // {cmd, op}
        size_t pos = 0, last = 0;
        in_single = in_double = false;
        std::string last_op;
        while (pos < line.size()) {
            if (line[pos] == '"' && !in_single) in_double = !in_double;
            else if (line[pos] == '\'' && !in_double) in_single = !in_single;
            else if (!in_single && !in_double) {
                if (line.compare(pos, 2, "&&") == 0) {
                    segments.emplace_back(line.substr(last, pos-last), last_op);
                    last_op = "&&";
                    pos += 2; last = pos; continue;
                } else if (line.compare(pos, 2, "||") == 0) {
                    segments.emplace_back(line.substr(last, pos-last), last_op);
                    last_op = "||";
                    pos += 2; last = pos; continue;
                } else if (line[pos] == ';') {
                    segments.emplace_back(line.substr(last, pos-last), last_op);
                    last_op = ";";
                    ++pos; last = pos; continue;
                }
            }
            ++pos;
        }
        segments.emplace_back(line.substr(last), last_op);
        int last_status = 0;
        for (const auto& seg : segments) {
        std::string segline = seg.first;
        std::string op = seg.second;
                if (segline.find_first_not_of(" \t\r\n") == std::string::npos) continue;
        if (op == "&&" && last_status != 0) continue;
        if (op == "||" && last_status == 0) continue;
        auto args = split(segline);
        if (args.empty()) continue;
                // Alias expansion
        if (aliases.count(args[0])) {
        std::vector<std::string> alias_args = split(aliases[args[0]]);
        alias_args.insert(alias_args.end(), args.begin() + 1, args.end());
        args = alias_args;
        }
        // Expand envvars in all args
        args = expand_args(args);
        // Inline assignment: VAR=val
        if (args[0].find('=') != std::string::npos && args[0].find('=') != 0 && args[0].find('=') < args[0].size()-1 && args[0].find_first_of(" ") == std::string::npos) {
        auto eq = args[0].find('=');
        std::string var = args[0].substr(0, eq);
        std::string val = args[0].substr(eq+1);
        setenv(var.c_str(), val.c_str(), 1);
                continue;
        }
        std::string cmd = args[0];
        if (cmd == "exit" || cmd == "quit") { should_exit = true; break; }
        if (cmd == "help") { print_help(); continue; }
        if (cmd == "cd") {
            const char* target = (args.size() > 1) ? args[1].c_str() : getenv("HOME");
                        if (chdir(target) != 0) {
                perror("cd");
            }
            continue;
        }
        if (cmd == "export") {
            if (args.size() == 2 && args[1].find('=') != std::string::npos) {
                auto eq = args[1].find('=');
                std::string var = args[1].substr(0, eq);
                std::string val = args[1].substr(eq+1);
                setenv(var.c_str(), val.c_str(), 1);
                            } else if (args.size() == 2) {
                setenv(args[1].c_str(), getenv(args[1].c_str()) ? getenv(args[1].c_str()) : "", 1);
                            } else {
                std::cerr << "Usage: export VAR or export VAR=val" << std::endl;
            }
            continue;
        }
        if (cmd == "unset") {
            if (args.size() == 2) {
                unsetenv(args[1].c_str());
                            } else {
                std::cerr << "Usage: unset VAR" << std::endl;
            }
            continue;
        }
        if (cmd == "ls") {
            std::string path = (args.size() > 1) ? args[1] : ".";
                        DIR* dir = opendir(path.c_str());
            if (!dir) { perror("ls"); continue; }
            std::vector<std::string> files;
            struct dirent* entry;
            size_t maxlen = 0;
            while ((entry = readdir(dir))) {
                if (strcmp(entry->d_name, ".") && strcmp(entry->d_name, "..")) {
                    files.push_back(entry->d_name);
                    size_t len = strlen(entry->d_name);
                    if (len > maxlen) maxlen = len;
                }
            }
            closedir(dir);
            // Get terminal width
            int term_width = 80;
            struct winsize w;
            if (ioctl(STDOUT_FILENO, TIOCGWINSZ, &w) == 0) {
                term_width = w.ws_col;
            }
            size_t col_width = maxlen + 2;
            int cols = term_width / col_width;
            if (cols < 1) cols = 1;
            int rows = (files.size() + cols - 1) / cols;
            for (int r = 0; r < rows; ++r) {
                for (int c = 0; c < cols; ++c) {
                    int idx = c * rows + r;
                    if (idx < (int)files.size()) {
                        std::cout << std::left << std::setw(col_width) << files[idx];
                    }
                }
                std::cout << std::endl;
            }
            continue;
        }
        // External command
                pid_t pid = fork();
        if (pid == 0) {
            std::vector<char*> cargs;
            for (auto& arg : args) cargs.push_back(const_cast<char*>(arg.c_str()));
            cargs.push_back(nullptr);
            execvp(cargs[0], cargs.data());
            perror("execvp");
            exit(1);
        } else if (pid > 0) {
            int status;
            waitpid(pid, &status, 0);
            last_status = WIFEXITED(status) ? WEXITSTATUS(status) : 1;
                    } else {
            perror("fork");
            last_status = 1;
        }
    }
    save_history_file();
    if (should_exit) {
                break;
    }
}
return 0;
}
