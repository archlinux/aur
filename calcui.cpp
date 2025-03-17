#include "calcui.h"
#include "ui_calcui.h"
#include "logic.h"

CalcUI::CalcUI(QWidget *parent) : QWidget(parent), ui(new Ui::CalcUI)
{
    ui->setupUi(this);
    setFixedSize(560, 650);
    QPalette pal = palette();
    pal.setBrush(QPalette::Window, QBrush(QColor(245, 245, 220), Qt::SolidPattern));
    setPalette(pal);

    connect(ui->nums_group, QOverload<QAbstractButton*>::of(&QButtonGroup::buttonClicked), this, &CalcUI::onNumsBtnClicked);
}

CalcUI::~CalcUI() { delete ui; }

void CalcUI::onNumsBtnClicked(QAbstractButton *btn)
{
    if (btn->text() == "√")
        ui->lineEdit->insert("^0.5");
    else
        ui->lineEdit->insert(btn->text()[0]);
}

void CalcUI::on_pushButton_13_clicked()
{
    string expression = ui->lineEdit->text().toStdString();
    if (valid_input(expression))
    {
        vector<string> tokens = get_token(expression);
        if (valid_brackets(expression))
        {
            vector<string> postfix = convert_to_postfix(tokens);
            double result = calculate_postfix(postfix);
            ui->lineEdit->setText(QString::number(result));
        }
        else
            ui->lineEdit->setText("ERROR");

    }
    else
        ui->lineEdit->setText("ERROR");

}

void CalcUI::on_pushButton_15_clicked()
{
    ui->lineEdit->setText("");
}
