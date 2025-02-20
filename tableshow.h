#ifndef TABLESHOW_H
#define TABLESHOW_H

#include <QWidget>
#include <QPalette>
#include <QColor>
#include <QBrush>
#include <QStringList>
#include <QList>

namespace Ui {
class TableShow;
}

class TableShow : public QWidget
{
    Q_OBJECT

public:
    explicit TableShow(QWidget *parent = nullptr);
    ~TableShow();

private:
    Ui::TableShow *ui;
public slots:
    void updateTableData(QList<QStringList>& data_table_to_view);
};

#endif // TABLESHOW_H
