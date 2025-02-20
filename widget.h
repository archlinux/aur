#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include <QFileDialog>
#include "dataresult.h"
#include "tableshow.h"
#include <QPalette>
#include <QBrush>
#include <QColor>
#include <QMessageBox>
#include "script.h"
#include <QMap>
#include <QStringList>
#include <QList>

using namespace std;

QT_BEGIN_NAMESPACE
namespace Ui {
class Widget;
}
QT_END_NAMESPACE

class Widget : public QWidget
{
    Q_OBJECT

public:
    Widget(QWidget *parent = nullptr);
    ~Widget();

private slots:
    void on_pushButton_clicked();
    void on_pushButton_3_clicked();

private:
    Ui::Widget *ui;
    DataResult *dataresult;
    TableShow *tableshow;
    std::vector<std::vector<std::string>> data_table;
    void choice_from_combobox(QMap<QString, QString> text_data, QList<QStringList> data_table_to_view);
signals:
    void show_data(QMap<QString, QString>& text_data);
    void show_table_data(QList<QStringList>& data_table_to_view);
};
#endif // WIDGET_H
