#ifndef CALCUI_H
#define CALCUI_H

#include <QWidget>
#include <QPalette>
#include <QBrush>
#include <QColor>
#include <QButtonGroup>
#include <QAbstractButton>
#include <QStringList>
#include <QMap>

QT_BEGIN_NAMESPACE
namespace Ui
{
class CalcUI;
}
QT_END_NAMESPACE

class CalcUI : public QWidget
{
    Q_OBJECT

  public:
    CalcUI(QWidget *parent = nullptr);
    ~CalcUI();

  private:
    Ui::CalcUI *ui;
  private slots:
    void on_pushButton_13_clicked();
    void on_pushButton_15_clicked();
    void onNumsBtnClicked(QAbstractButton* btn);
};
#endif // CALCUI_H
