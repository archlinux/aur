import sys
import os
import shutil
import subprocess
from PyQt5.QtWidgets import QApplication, QSystemTrayIcon, QMenu, QAction
from PyQt5.QtGui import QIcon

class CustomTrayIcon(QSystemTrayIcon):
    def __init__(self, parent=None):
        super(CustomTrayIcon, self).__init__(parent)
        self.setIcon(QIcon("/usr/share/icons/hicolor/512x512/apps/clash-console-tray-script.png"))  # 替换为你的图标文件路径

        # 创建菜单项
        self.menu = QMenu()
        self.action_open = QAction("开启clash", self)
        ## 配置文件
        self.action_button1 = QAction("config1", self)
        self.action_button2 = QAction("config2", self)
        
        self.action_webui = QAction("开启WebUI(yacd)", self)
        self.action_quit = QAction("关闭clash", self)
        self.action_about = QAction("关于(使用教程，不会用看这里)", self)
        self.action_exit = QAction("Exit", self)

        # 将菜单项添加到菜单
        self.menu.addAction(self.action_open)
        self.menu.addAction(self.action_button1)
        self.menu.addAction(self.action_button2)
        self.menu.addAction(self.action_webui)
        self.menu.addAction(self.action_quit)
        self.menu.addAction(self.action_about)
        self.menu.addAction(self.action_exit)

        # 将菜单设置为托盘图标的上下文菜单trash:/Readme.html
        self.setContextMenu(self.menu)

        # 设置点击事件
        self.action_open.triggered.connect(self.open_action_triggered)
        self.action_button1.triggered.connect(self.button1_action_triggered)
        self.action_button2.triggered.connect(self.button2_action_triggered)
        self.action_webui.triggered.connect(self.webui_action_triggered)
        self.action_quit.triggered.connect(self.quit_action_triggered)
        self.action_about.triggered.connect(self.about_action_triggered)
        self.action_exit.triggered.connect(self.exit_action_triggered)
# 各项菜单功能
    def open_action_triggered(self):
        # 处理打开操作，可以添加你的自定义逻辑
        user_home = os.path.expanduser("~")
        try:
            open_command = "nohup clash-meta > /dev/null 2>&1 &"  # 根据实际情况修改重启命令
            subprocess.run(open_command, shell=True)
        
        except Exception as e:
            print(f"Error: {e}")

    def button1_action_triggered(self):
        # 处理Button1操作，切换到配置1，可以添加你的自定义逻辑
        user_home = os.path.expanduser("~")

        source_file = os.path.join(user_home, ".config", "clash", "profiles", "config-1.yaml")
        target_file = os.path.join(user_home, ".config", "clash", "config.yaml")

        try:
            shutil.copyfile(source_file, target_file)
            print(f"File copied from {source_file} to {target_file}")

            kill_command = "killall clash-meta"  # 根据实际情况修改重启命令
            subprocess.run(kill_command, shell=True)

            restart_command = "nohup clash-meta > /dev/null 2>&1 &"  # 根据实际情况修改重启命令
            subprocess.run(restart_command, shell=True)
            print("clash-meta restarted")

        except Exception as e:
            print(f"Error: {e}")

    def button2_action_triggered(self):
        # 处理Button2操作，切换到配置2，可以添加你的自定义逻辑
        user_home = os.path.expanduser("~")

        source_file = os.path.join(user_home, ".config", "clash", "profiles", "config-2.yaml")
        target_file = os.path.join(user_home, ".config", "clash", "config.yaml")

        try:
            shutil.copyfile(source_file, target_file)
            print(f"File copied from {source_file} to {target_file}")
            
            kill_command = "killall clash-meta"  # 根据实际情况修改重启命令
            subprocess.run(kill_command, shell=True)

            restart_command = "nohup clash-meta > /dev/null 2>&1 &"  # 根据实际情况修改重启命令
            subprocess.run(restart_command, shell=True)
            print("clash-meta restarted")

        except Exception as e:
            print(f"Error: {e}")
            
    def webui_action_triggered(self):
        # 处理webui操作，可以添加你的自定义逻辑
        user_home = os.path.expanduser("~")
        try:
            open_command = "xdg-open https://yacd.haishan.me/"  # 根据实际情况修改重启命令
            subprocess.run(open_command, shell=True)
        except Exception as e:
            print(f"Error: {e}")
            
    def quit_action_triggered(self):
        # 处理关闭clash操作，可以添加你的自定义逻辑
        user_home = os.path.expanduser("~")
        try:
            quit_command = "killall clash-meta"  # 根据实际情况修改重启命令
            subprocess.run(quit_command, shell=True)
        
        except Exception as e:
            print(f"Error: {e}")
            
    def about_action_triggered(self):
        # 处理打开教程页操作，可以添加你的自定义逻辑
        user_home = os.path.expanduser("~")
        try:
            open_command = "xdg-open /opt/clash-console-tray-script/Readme.md"  # 根据实际情况修改重启命令
            subprocess.run(open_command, shell=True)
        except Exception as e:
            print(f"Error: {e}")
            
    def exit_action_triggered(self):
        # 处理退出操作，可以添加你的自定义逻辑
        QApplication.quit()

if __name__ == "__main__":
# Run nohup clash-meta > /dev/null 2>&1 & command
    try:
        open_command = "nohup clash-meta > /dev/null 2>&1 &"
        subprocess.run(open_command, shell=True)
    except Exception as e:
        print(f"Error running clash-meta: {e}")

    app = QApplication(sys.argv)
    
    # 创建托盘图标
    tray_icon = CustomTrayIcon()
    tray_icon.show()

    sys.exit(app.exec_())
