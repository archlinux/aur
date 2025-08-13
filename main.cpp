#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <locale.h>
#include <ncurses.h>
#include <algorithm>
#include <sstream>

// Глобальные переменные
std::vector<std::string> text_lines;
int cursor_y = 0;
int cursor_x = 0;
std::string filename = "new_file.txt";
std::string status_message = "";
bool is_dirty = false;
std::string clipboard = "";
int start_line = 0;

// Инициализация и завершение
void init_editor() {
    setlocale(LC_ALL, ""); 
    initscr();
    noecho();
    cbreak();
    keypad(stdscr, TRUE);
    if (has_colors()) {
        start_color();
        init_pair(1, COLOR_WHITE, COLOR_BLUE);
    }
}

void cleanup_editor() {
    endwin();
}

// Функции отрисовки
void draw_header() {
    int max_y, max_x;
    getmaxyx(stdscr, max_y, max_x);
    attron(COLOR_PAIR(1));
    mvprintw(0, 0, " GNU Awesome 1.0 ");
    mvprintw(0, (max_x - filename.length()) / 2, "%s", filename.c_str());
    for (int i = 0; i < max_x; ++i) {
        if (i < 17 || (i > (max_x - filename.length()) / 2 - 1 && i < (max_x + filename.length()) / 2 + 1)) continue;
        mvaddch(0, i, ' ');
    }
    attroff(COLOR_PAIR(1));
}

void draw_statusbar() {
    int max_y, max_x;
    getmaxyx(stdscr, max_y, max_x);
    attron(A_BOLD);
    mvprintw(max_y - 3, 0, "%.*s", max_x, status_message.c_str());
    attroff(A_BOLD);
}

void draw_footer() {
    int max_y, max_x;
    getmaxyx(stdscr, max_y, max_x);
    attron(COLOR_PAIR(1));
    mvprintw(max_y - 2, 0, "^G Справка  ^O Записать  ^F Поиск    ^K Вырезать  ^T Выполнить ^C Позиция");
    mvprintw(max_y - 1, 0, "^X Выход    ^R ЧитФайл   ^\\ Замена   ^U Вставить  ^J Выровнять ^/ К строке");
    attroff(COLOR_PAIR(1));
}

void draw_all() {
    int max_y, max_x;
    getmaxyx(stdscr, max_y, max_x);
    clear(); 
    int visible_rows = max_y - 4;
    for (int i = 0; i < visible_rows; ++i) {
        if (start_line + i < text_lines.size()) {
            mvprintw(i + 1, 0, "%s", text_lines[start_line + i].c_str());
        }
    }
    draw_header();
    draw_statusbar();
    draw_footer();
    move(cursor_y - start_line + 1, cursor_x);
    refresh();
}

// Новая функция для приветственного экрана
void draw_welcome_screen() {
    int max_y, max_x;
    getmaxyx(stdscr, max_y, max_x);
    clear();
    
    std::string welcome = "Добро пожаловать в GNU Awesome 1.0!";
    std::string start_msg = "Нажмите любую клавишу для начала работы...";
    
    mvprintw(max_y/2 - 2, (max_x - welcome.length())/2, "%s", welcome.c_str());
    mvprintw(max_y/2, (max_x - start_msg.length())/2, "%s", start_msg.c_str());
    refresh();
    getch();
    clear();
}

// Загрузка и сохранение файла
void load_file(const std::string& fname) {
    filename = fname;
    std::ifstream file(filename);
    if (file.is_open()) {
        text_lines.clear();
        std::string line;
        while (getline(file, line)) {
            text_lines.push_back(line);
        }
        if (text_lines.empty()) {
            text_lines.push_back("");
        }
        file.close();
        status_message = "[ Прочитано " + std::to_string(text_lines.size()) + " строк ]";
        is_dirty = false;
        start_line = 0;
    } else {
        text_lines.clear();
        text_lines.push_back("");
        status_message = "Ошибка: не удалось открыть файл! Создан новый файл.";
        is_dirty = false;
        start_line = 0;
    }
}

void save_file() {
    std::ofstream file(filename);
    if (file.is_open()) {
        for (const auto& line : text_lines) {
            file << line << '\n';
        }
        file.close();
        status_message = "Файл сохранён успешно!";
        is_dirty = false;
    } else {
        status_message = "Ошибка: не удалось сохранить файл!";
    }
}

// Функция для ввода в статус-баре
std::string get_input_from_statusbar(const std::string& prompt) {
    std::string input = "";
    int ch;
    int max_y, max_x;
    int input_cursor = 0;
    
    while (true) {
        getmaxyx(stdscr, max_y, max_x);
        status_message = prompt + input;
        draw_all();
        move(max_y - 3, prompt.length() + input_cursor);
        refresh();
        
        ch = getch();
        if (ch == 10) { // Enter
            break;
        } else if (ch == KEY_BACKSPACE || ch == 127) {
            if (input_cursor > 0) {
                input.pop_back();
                input_cursor--;
            }
        } else if (ch >= 32 && ch <= 255) {
            input += (char)ch;
            input_cursor++;
        }
    }
    return input;
}


// Функции меню
bool confirm_exit() {
    if (!is_dirty) return true;
    status_message = "Файл имеет несохранённые изменения! Сохранить? (y/n)";
    draw_all();
    int ch = getch();
    if (ch == 'y' || ch == 'Y') {
        save_file();
        return true;
    } else if (ch == 'n' || ch == 'N') {
        return true;
    } else {
        status_message = "Отмена.";
        return false;
    }
}

void handle_find() {
    std::string query = get_input_from_statusbar("Поиск: ");
    if (query.empty()) {
        status_message = "";
        return;
    }
    bool found = false;
    for (size_t i = 0; i < text_lines.size(); ++i) {
        size_t pos = text_lines[i].find(query);
        if (pos != std::string::npos) {
            cursor_y = i;
            cursor_x = pos;
            found = true;
            break;
        }
    }
    if (found) {
        status_message = "Найдено!";
    } else {
        status_message = "Не найдено.";
    }
}

void handle_goto_line() {
    std::string line_str = get_input_from_statusbar("Перейти к строке: ");
    if (line_str.empty()) {
        status_message = "";
        return;
    }
    int line_num = atoi(line_str.c_str());
    if (line_num > 0 && line_num <= text_lines.size()) {
        cursor_y = line_num - 1;
        cursor_x = 0;
        status_message = "Переход к строке " + std::to_string(line_num);
    } else {
        status_message = "Неверный номер строки.";
    }
}

void handle_help() {
    clear();
    mvprintw(1, 0, "GNU Awesome 1.0 - Помощь по горячим клавишам:");
    mvprintw(3, 0, "^G - Справка");
    mvprintw(4, 0, "^X - Выход (с подтверждением сохранения)");
    mvprintw(5, 0, "^O - Сохранить файл");
    mvprintw(6, 0, "^F - Поиск текста");
    mvprintw(7, 0, "^K - Вырезать текущую строку");
    mvprintw(8, 0, "^U - Вставить строку из буфера");
    mvprintw(9, 0, "^R - Вставить содержимое другого файла");
    mvprintw(10, 0, "^\\ - Заменить текст");
    mvprintw(11, 0, "^C - Показать текущую позицию курсора");
    mvprintw(12, 0, "^/ - Перейти к строке");
    mvprintw(14, 0, "Нажмите любую клавишу для возврата в редактор...");
    refresh();
    getch();
    status_message = "";
}

void handle_read_file() {
    std::string read_file_name = get_input_from_statusbar("Имя файла для чтения: ");
    if (read_file_name.empty()) {
        status_message = "";
        return;
    }
    std::ifstream file(read_file_name);
    if (file.is_open()) {
        std::string line;
        while (getline(file, line)) {
            text_lines.insert(text_lines.begin() + cursor_y + 1, line);
            cursor_y++;
        }
        file.close();
        is_dirty = true;
        status_message = "Файл " + read_file_name + " прочитан.";
    } else {
        status_message = "Ошибка: не удалось прочитать файл " + read_file_name;
    }
}

void handle_replace() {
    std::string search_str = get_input_from_statusbar("Заменить: ");
    if (search_str.empty()) {
        status_message = "";
        return;
    }

    std::string replace_str = get_input_from_statusbar("На что заменить: ");
    bool replaced = false;
    for (auto& line : text_lines) {
        size_t pos = 0;
        while((pos = line.find(search_str, pos)) != std::string::npos) {
            line.replace(pos, search_str.length(), replace_str);
            pos += replace_str.length();
            replaced = true;
        }
    }
    if (replaced) {
        status_message = "Замена выполнена!";
        is_dirty = true;
    } else {
        status_message = "Ничего не найдено для замены.";
    }
}


int main(int argc, char** argv) {
    init_editor();
    
    if (argc > 1) {
        load_file(argv[1]);
    } else {
        draw_welcome_screen();
        text_lines.push_back("");
        status_message = "[ Новый файл ]";
    }

    int ch;
    while (true) {
        draw_all();
        ch = getch();
        int max_y, max_x;
        getmaxyx(stdscr, max_y, max_x);
        int visible_rows = max_y - 4;

        if (ch == 24) { // Ctrl+X
            if (confirm_exit()) break;
        } else if (ch == 15) { // Ctrl+O
            save_file();
        } else if (ch == 6) { // Ctrl+F - Поиск
            handle_find();
        } else if (ch == 11) { // Ctrl+K - Вырезать
            if (cursor_y < text_lines.size()) {
                clipboard = text_lines[cursor_y];
                text_lines.erase(text_lines.begin() + cursor_y);
                if (text_lines.empty()) text_lines.push_back("");
                if (cursor_y >= text_lines.size()) cursor_y = text_lines.size() - 1;
                cursor_x = 0;
                is_dirty = true;
                status_message = "Строка вырезана.";
            }
        } else if (ch == 21) { // Ctrl+U - Вставить
            if (!clipboard.empty()) {
                text_lines.insert(text_lines.begin() + cursor_y + 1, clipboard);
                cursor_y++;
                cursor_x = 0;
                is_dirty = true;
                status_message = "Вставлено из буфера.";
            }
        } else if (ch == 7) { // Ctrl+G - Справка
            handle_help();
        } else if (ch == 18) { // Ctrl+R - Читать файл
            handle_read_file();
        } else if (ch == 28) { // Ctrl+\ - Замена
            handle_replace();
        } else if (ch == 10) { // Ctrl+J (Выровнять)
            status_message = "Выравнивание пока не реализовано.";
        } else if (ch == 3) { // Ctrl+C - Позиция
            status_message = "Строка: " + std::to_string(cursor_y + 1) + " | Столбец: " + std::to_string(cursor_x + 1);
        } else if (ch == 16) { // Ctrl+P (К строке)
            handle_goto_line();
        }
        
        switch (ch) {
            case KEY_UP:
                if (cursor_y > 0) cursor_y--;
                if (cursor_x > text_lines[cursor_y].length()) cursor_x = text_lines[cursor_y].length();
                break;
            case KEY_DOWN:
                if (cursor_y < text_lines.size() - 1) cursor_y++;
                if (cursor_x > text_lines[cursor_y].length()) cursor_x = text_lines[cursor_y].length();
                break;
            case KEY_LEFT:
                if (cursor_x > 0) cursor_x--;
                break;
            case KEY_RIGHT:
                if (cursor_x < text_lines[cursor_y].length()) cursor_x++;
                break;
            case KEY_BACKSPACE:
                if (cursor_x > 0) {
                    text_lines[cursor_y].erase(cursor_x - 1, 1);
                    cursor_x--;
                    is_dirty = true;
                } else if (cursor_y > 0) {
                    std::string current_line = text_lines[cursor_y];
                    text_lines.erase(text_lines.begin() + cursor_y);
                    cursor_y--;
                    cursor_x = text_lines[cursor_y].length();
                    text_lines[cursor_y] += current_line;
                    is_dirty = true;
                }
                status_message = "";
                break;
            case 10: // Enter
                {
                    std::string current_line = text_lines[cursor_y];
                    std::string new_line = current_line.substr(cursor_x);
                    text_lines[cursor_y].erase(cursor_x);
                    text_lines.insert(text_lines.begin() + cursor_y + 1, new_line);
                    cursor_y++;
                    cursor_x = 0;
                    is_dirty = true;
                }
                status_message = "";
                break;
            default:
                if (ch >= 32 && ch <= 255) { 
                    text_lines[cursor_y].insert(cursor_x, 1, ch);
                    cursor_x++;
                    is_dirty = true;
                }
                status_message = "";
                break;
        }

        if (cursor_y < start_line) start_line = cursor_y;
        if (cursor_y >= start_line + visible_rows) start_line = cursor_y - visible_rows + 1;
    }

    cleanup_editor();
    return 0;
}