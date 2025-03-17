#include <logic.h>

double factorial(double n)
{
    if (n == 1)
        return n;
    else
        return n * factorial(n - 1);
}

bool valid_input(string& expression) //Валидируем ввод  (чтобы юзер не писал всякую херню, приводящую к падению приложения)
{
    for (char c : expression)
    {
        if (isdigit(c) || c == '(' || c == ')' || c == '*' || c == '-' || c == '+' ||
            c == '/' || c == '^' || c == '!' || c == 'c' || c == 's' || c == 't')
            return true;
    }
    return false;
}

bool valid_brackets(string& expression) // Проверяем на правильные скобки ()()(())
{
    stack<char> brackets;
    for (char c : expression)
    {
        if (c == '(')
            brackets.push(c);
        else if (c == ')')
        {
            if (brackets.empty() || brackets.top() != '(')
                return false;
            brackets.pop();
        }

    }
    return brackets.empty();
}


vector<string> get_token(string& expression)
{
    vector<string> tokens;
    string num;
    string func;
    for (int i = 0; i < expression.length(); i++)
    {
        if (isdigit(expression[i]) || expression[i] == '.' || expression[i] == '!' ||
            expression[i] == 'c' || expression[i] == 's' || expression[i] == 't')
        {
            // Проверяем символы на числа дроби и функции
            num += expression[i];
        }
        else
        {
            if (!num.empty()) // Добавляем текущее число в вектор с токенами
            {
                tokens.push_back(num);
                num.clear();
            }
            if (!isspace(expression[i])) // проверяем на отсутсвие пробелов и приобразуем символ в односимвольную строку
                tokens.push_back(string(1, expression[i]));
        }
    }
    if (!num.empty()) // Докидываем оставшиеся  числа
        tokens.push_back(num);
    return tokens;
}

vector<string> convert_to_postfix(vector<string>& tokens)
{
    stack<string> operators;
    vector<string> output;
    map<string, int> precedence =
        {
            {"(", 0}, {"^", 3}, {"*", 2}, {"/", 2}, {"+", 1}, {"-", 1} // Приоритет операторов
        };
    for (string tk : tokens)
    {
        if (isdigit(tk[0])) // Если число добавляем в очередь
            output.push_back(tk);
        else if (tk == "(") // Если ( то в стек операторов
            operators.push(tk);
        else if (tk == ")") // Если ) то обрабатываем операторы пока не встретим скобку
        {
            while (operators.top() != "(") // Добавляем элементы из стека в очередь
            {
                output.push_back(operators.top());
                operators.pop();
            }
            operators.pop(); // Удаляем (
        }
        else
        {
            while (!operators.empty() && precedence[operators.top()] >= precedence[tk]) // Проверяем приоритет и на пустоту стека
            {
                output.push_back(operators.top());
                operators.pop();
            }
            operators.push(tk);
        }
    }
    while (!operators.empty()) // Добавляем все остальные операторы
    {
        output.push_back(operators.top());
        operators.pop();
    }
    return output;
}

bool valid_operation(vector<string>& postfix) // Проверяем на кол-во чисел и операторов для корректной записи
{
    vector<string> nums;
    vector<string> operators;
    for (string tk : postfix)
    {
        if (isdigit(tk[0]))
            nums.push_back(tk);
        else if (tk == "*" || tk == "/" || tk == "-" || tk == "+" || tk == "^")
            operators.push_back(tk);
    }
    if (nums.size() - 1 == operators.size())
        return true;
    return false;
}

double calculate_postfix(vector<string>& postfix)
{
    stack<double> calc_stack;
    if (valid_operation(postfix))
    {
        for (string tk : postfix) // Проверяем если следущий элемент токена функция, удалаяем функцию и считаем число
        {
            if (isdigit(tk[0]))
            {
                double num = stod(tk);
                if (tk.ends_with("!"))
                    num = factorial(stod(tk));
                if (tk.ends_with("c"))
                    num = cos(stod(tk) * 180 / M_PI);
                if (tk.ends_with("s"))
                    num = sin(stod(tk) * 180 / M_PI);
                if (tk.ends_with("t"))
                    num = tan(stod(tk) * 180 / M_PI);
                calc_stack.push(num);
            }
            else
            {
                double b = calc_stack.top();
                calc_stack.pop();
                double a = calc_stack.top();
                calc_stack.pop();
                if (tk == "+")
                    calc_stack.push(a + b);
                else if (tk == "-")
                    calc_stack.push(a - b);
                else if (tk == "*")
                    calc_stack.push(a * b);
                else if (tk == "/")
                    calc_stack.push(a / b);
                else if (tk == "^")
                    calc_stack.push(pow(a, b));
            }
        }
        return calc_stack.top();
    }
    else
        cout << "Wrong operator format" << endl;
    return 0;
}
