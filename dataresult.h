#ifndef DATARESULT_H
#define DATARESULT_H

#include <QWidget>

namespace Ui {
class DataResult;
}

class DataResult : public QWidget
{
    Q_OBJECT

public:
    explicit DataResult(QWidget *parent = nullptr);
    ~DataResult();

private:
    Ui::DataResult *ui;

public slots:
    void updateResultData(QMap<QString, QString>& text_data);
};

#endif // DATARESULT_H
