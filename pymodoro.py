# add modules here
import time as timemod
import os
import argparse
  
class pomodoro():
    
    def __init__(self, workTime, breakTime): 
        self.workTime = workTime
        self.breakTime = breakTime
        self.startPomodoro()
    
    def startPomodoro(self): 
        counter = 1
        while True: 
            if (counter % 2 == 1):
                print(f"Pomodoro Cycle {counter}")
                codeUtils.timer(self.workTime, True)
            elif (counter % 8 == 0):
                codeUtils.timer(self.workTime, True)
            else: 
                codeUtils.timer(self.breakTime, False)
            counter += 1

class codeUtils(): 

    @staticmethod
    def timer(time, isWorking): 
        time *= 60
        while time: 
            mins, secs = divmod(time, 60)
            timer = '{:02d}:{:02d} remain'.format(mins, secs)
            print(timer, end='\r    ')
            timemod.sleep(1)
            time -= 1
        print()
        # Return the control back

        if (isWorking):
            os.system('notify-send "  Work over!!! Have smol break ^^"')
        else: 
            os.system('notify-send "  Break over, get back to work mate"')
        return

    # To Do 
    # Add Help Functionality
    @staticmethod
    def getHelp(): 
        pass

if __name__ == "__main__": 
    try:
        parser = argparse.ArgumentParser()
        parser.add_argument("workTime", help = "Work Time (Minutes), set the work time param to the time you want to work for", type = int)
        parser.add_argument("breakTime", help = "Break Time (Minutes), set the break time param to the longevity of your smol break time", type = int)
        args = parser.parse_args()
        newPomodoroTimer = pomodoro(args.workTime, args.breakTime)
    except Exception as error: 
        print("Some error occured while parsing arguments, defaulting to 25 minutes, 5 minutes pomodoro")
        newPomodoroTimer = pomodoro(25, 5)
