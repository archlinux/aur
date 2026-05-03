#!/usr/bin/env python3

while True:
    a = input("A: ")
    b = input("B: ")
    operation = input("действие: ")
    actions = ["+", "-", "/", "*"]


    try:
        n_a = float(a)
        n_b = float(b)
        if operation == "-":
            print(n_a - n_b)

        elif operation == "+":
            print(n_a + n_b)

        elif operation == "*":
            print(n_a * n_b)

        elif operation == "/":
            print(n_a / n_b)

        if operation not in actions:
            print("неизвестное действие!")

    except ZeroDivisionError:

        print("на ноль делить нельзя!")

    except ValueError:

        if operation not in actions:
            print("буквы и числа нельзя складывать, так ещё и неизвестное действие!")
        else:
            print("нельзя складывать числа и буквы!")

    finalactions = ["w", "q"]

    print("\nнапечатайте: \nq = выход \nw = продолжить")

    number = input("\nзначение: ").strip().lower()

    if number == "w":
        continue

    elif number == "q":
        break


    if number not in finalactions:
       break
