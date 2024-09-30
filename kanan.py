#!/usr/bin/python
# Modules to check arguments, get the OS, and pick random strings
import sys, random, os

# Variables
# Amount of arguments
n = len(sys.argv)

# ASCII art for kananSpeech()
kananArt = """
       / \\__
      (    @\\___
      /         O
     /   (_____/
    /_____/     U
"""


# Functions
# Clean screen
def clean():
    # Unix
    if os.name == "posix":
        os.system("clear")
    # Windows
    elif os.name == "nt":
        os.system("cls")


# Read inputted file -r
def kananRead():
    # Get path of file via passed arguments
    file = sys.argv[2]
    try:
        # Open file and close after in read mode
        with open(file, "r") as openFile:
            printFile = openFile.read()  # Read file content
            print(printFile.strip())  # Print file content
    except FileNotFoundError:
        print(file + " was not found. Double check you have the correct file/path.")
    except Exception as otherError:
        print("An error occurred: " + str(otherError) + ".")


# Interactive prompt-friendly version of kananRead()
def kananReadI():
    file = input("Path to file? ")
    try:
        with open(file, "r") as openFile:
            printFile = openFile.read()  # Read file content
            print(printFile.strip())  # Print file content
            exit()
    except FileNotFoundError:
        print(file + " was not found. Double check you have the correct file/path.")
    except Exception as otherError:
        print("An error occurred: " + str(otherError) + ".")


# Say silly speeches -s
def kananSpeech():
    kananSpeeches = [
        "The people who need to be loved the most are often very hard to love.",
        "A different version of you exists in the minds of everyone who knows you.",
        "Someone out there vividly remembers something you said that you have completely forgotten.",
        "I wonder if there are any time combinations on the clock that I've never seen.",
        "You see people every single day that you'll never see again.",
        "It’s likely that over 99% of the trees that you look at will still be here when you’re dead.",
        "We go to work by car each day, taking the same route, but almost never encounter the same cars along the way.",
        "Having a toddler in their 'Why?' phase makes you realize how much you know and don't know about things.",
        "Every word in every language started out as gibberish until one person convinced enough people that what they said was a real word.",
        "There are half a million different occupations in the world, yet we pick our careers based on studying 10–15 subjects by age 18–21.",
        "You may have once made a decision that saved your life without knowing it.",
        "In every Olympic event, they should have an average person compete so we can have a point of reference and appreciate the athletes more.",
        "Kids are bullied for being different, while adults are praised for being different.",
        "If money is at the root of all evil, then why do churches ask for it?",
        "People cover their laptop cameras for fear of hackers but never their phone cameras.",
        "Therapists talk you into brainwashing yourself.",
        "One day, you'll be someone's ancestor.",
        "We talk about Ancient Romans like they were basically all the same, but the civilization lasted almost 1000 years. That’s like saying people in 2024 and 1024 are basically the same.",
        "On any given day in a hospital, you can find people having the best day of their life, the worst day of their life, the first day of their life, and the last day of their life all under one roof.",
        "The number of people older than you never goes up.",
        "The oldest sibling is the emergency designated adult.",
        "Someone studying atoms is just a bunch of atoms trying to understand themselves.",
        "Every single human in history has witnessed the same sun and moon as you have.",
        "You've never seen your own face before—only in pictures and reflections.",
        "Your life can't fall apart if it was never really together in the first place.",
        "Every single decision you've made in your life has led you to where you are now.",
        "Whatever happens inside our bodies happens in pitch-black darkness.",
        "You've survived 100% of your worst days.",
        "You only have one birthday; the rest are congratulations for surviving each year.",
        "Some stranger remembers you for being kind to them when no one else was.",
    ]
    print(kananArt)
    print("\nKanan says: ", random.choice(kananSpeeches))


# Help manual; like "man"
def helpManual():
    clean()  # Clear screen
    print(
        "It appears you don't know how to use Kanan.\n\n"
        "Kanan is:\n"
        " - A calculator\n"
        " - A speaker\n"
        " - A dog\n"
        " - An interactive prompt\n\n"
        "Arguments\n"
        " - --help: Prints this help screen\n"
        " - -r /path/to/file: Reads inputted file\n"
        " - -s: Says random speeches\n"
        " - -c: Interactive calculator\n\n"
        "Thanks for reading!"
    )


# Calculator
def kananCalc():
    print(
        "Please type in your calculation to be done: \n\n"
        "Key:\n"
        " - // Floor division\n"
        " - / Division\n"
        " - * Multiplication\n"
        " - ** Powers\n"
        " - + Addition\n"
        " - - Subtraction"
    )
    try:
        calcToEval = eval(input("\n\n>>> "))  # Evaluate input
        print(calcToEval)
    except Exception:
        print("An error has occurred. Please try using correct syntax or no letters.")


# Dawg mode
def kananDawg():
    speechd = [
        "You have unlocked the golden dog. You can use this to know you have achieved a 1/1000 (totally not kidding)",
        "Bark bark bark bark bark bark",
        "Hawowowowowowowowo",
        "Bark",
        "Woof",
        "Howl",
        "Bark woof",
        "Bark howl",
        "Bark bark",
        "Woof bark",
        "Woof woof",
        "Woof howl",
        "Woof howl bark",
        "Woof howl howl",
        "Woof howl woof",
        "Bark bark bark bark",
        "Barkk",
        "Whineeee",
        "Kanan woof howl",
        "Kanan howl bark woof",
    ]
    print(
        "Ctrl + C will immediately quit it. "
        "Type anything you want to say to the dog and he will reply! Play!"
    )
    try:
        while True:
            input(random.choice(speechd) + " ")
    except KeyboardInterrupt:
        exit()
    except Exception:
        print("An error has randomly happened!")


# Argument parsing
if n == 3:
    if sys.argv[1] == "-r":
        kananRead()
        exit()
    else:
        helpManual()

if n == 2:
    if sys.argv[1] == "-s":
        kananSpeech()
        exit()
    elif sys.argv[1] == "-c":
        kananCalc()
        exit()
    elif sys.argv[1] == "-d":
        kananDawg()
        exit()
    else:
        helpManual()

# No arguments (interactive mode)
if n == 1:
    try:
        option = input(
            "You are now using Kanan's interactive prompt. "
            "Did you know you can use --help to find out arguments to use certain features? "
            "What would you like to use Kanan for today?\n\n"
            "1) Reading files\n"
            "2) Seeing random speeches\n"
            "3) Using a calculator\n"
            "4) Talking to a dog\n"
            "5) Help\n>>> "
        )
        if option == "1":
            kananReadI()
            exit()
        elif option == "2":
            kananSpeech()
            exit()
        elif option == "3":
            kananCalc()
            exit()
        elif option == "4":
            kananDawg()
            exit()
        elif option == "5":
            helpManual()
            exit()
        else:
            helpManual()
    except Exception:
        print("An error has randomly occurred!")
    except KeyboardInterrupt:
        exit()

# Wrong amount of arguments
else:
    helpManual()
