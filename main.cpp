#include "calcui.h"

#include <QApplication>

int main(int argc, char *argv[]) {
    QApplication a(argc, argv);
    CalcUI w;
    w.show();
    return a.exec();
}
