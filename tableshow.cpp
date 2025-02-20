#include "tableshow.h"
#include "ui_tableshow.h"

TableShow::TableShow(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::TableShow)
{
    ui->setupUi(this);
    setFixedSize(650, 450);
    int start = 100, end = 800;
    move(rand() % (end - start + 1) + start, rand() % (end - start + 1) + start);
    QPalette pal = palette();
    pal.setBrush(QPalette::Window, QBrush(QColor(209, 255, 213), Qt::SolidPattern));
    setPalette(pal);
}

TableShow::~TableShow()
{
    delete ui;
}

void TableShow::updateTableData(QList<QStringList>& data_table_to_view){
    int col_count = 0;
    for (const auto& row: data_table_to_view){
        ui->tableWidget->setRowCount(data_table_to_view.size());
        ui->tableWidget->setColumnCount(row.size());
        for (const auto& elem: row){
            ui->tableWidget->setItem(0, col_count, new QTableWidgetItem(elem));
            col_count++;
        }
    }
}
