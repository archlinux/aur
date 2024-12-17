#include <ncurses.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINES 1000
#define MAX_LINE_LENGTH 1024

char lines[MAX_LINES][MAX_LINE_LENGTH];
int current_line = 0;
int current_pos = 0;

void init_editor() {
    initscr();              // Инициализация ncurses
    raw();                  // Отключаем буферизацию
    keypad(stdscr, TRUE);   // Включаем клавиши управления
    noecho();               // Отключаем отображение вводимых символов
    cbreak();               // Ввод без ожидания нажатия Enter
    scrollok(stdscr, TRUE); // Включаем автоматический скроллинг
    clear();                // Очищаем экран
}

void display_editor() {
    clear();
    for (int i = 0; i < current_line; i++) {
        mvprintw(i, 0, "%s", lines[i]);
    }
    move(current_line, current_pos); // Перемещаем курсор
    refresh();
}

void handle_input(int ch) {
    if (ch == KEY_DOWN && current_line < MAX_LINES - 1) {
        current_line++;
        current_pos = strlen(lines[current_line]);
    } else if (ch == KEY_UP && current_line > 0) {
        current_line--;
        current_pos = strlen(lines[current_line]);
    } else if (ch == KEY_RIGHT && current_pos < MAX_LINE_LENGTH - 1) {
        current_pos++;
    } else if (ch == KEY_LEFT && current_pos > 0) {
        current_pos--;
    } else if (ch == '\n' && current_line < MAX_LINES - 1) {
        current_line++;
        current_pos = 0;
    } else if (ch == 27) { // ESC для выхода
        endwin();
        exit(0);
    } else if (ch == 127 || ch == 8) { // BACKSPACE
        if (current_pos > 0) {
            memmove(&lines[current_line][current_pos - 1], &lines[current_line][current_pos], MAX_LINE_LENGTH - current_pos);
            current_pos--;
        }
    } else {
        if (current_pos < MAX_LINE_LENGTH - 1) {
            memmove(&lines[current_line][current_pos + 1], &lines[current_line][current_pos], MAX_LINE_LENGTH - current_pos - 1);
            lines[current_line][current_pos] = ch;
            current_pos++;
        }
    }
}

int main() {
    init_editor();

    int ch;
    while (1) {
        display_editor();
        ch = getch();
        handle_input(ch);
    }

    endwin(); // Завершаем работу с ncurses
    return 0;
}
