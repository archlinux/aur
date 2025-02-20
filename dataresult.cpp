#include "dataresult.h"
#include "ui_dataresult.h"

DataResult::DataResult(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::DataResult)
{
    ui->setupUi(this);
    setWindowTitle("Результат");
    int start = 100, end = 800;
    move(rand() % (end - start + 1) + start, rand() % (end - start + 1) + start);
    QPalette pal = palette();
    pal.setBrush(QPalette::Window, QBrush(QColor(209, 255, 213), Qt::SolidPattern));
    setPalette(pal);
}

DataResult::~DataResult()
{
    delete ui;
}

void DataResult::updateResultData(QMap<QString, QString> &text_data){
    ui->tableWidget->setRowCount(text_data.size());
    ui->tableWidget->setColumnCount(2);
    ui->tableWidget->setHorizontalHeaderLabels({"Ключ", "Значение"});
    int row_count = 0;
    for (auto [key, value]: text_data.asKeyValueRange()){
        ui->tableWidget->setItem(row_count, 0, new QTableWidgetItem(key));
        ui->tableWidget->setItem(row_count, 1, new QTableWidgetItem(value));
        row_count++;
    }
    ui->tableWidget->resizeColumnsToContents();
}
