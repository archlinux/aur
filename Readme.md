# 本程序使用教程

#### 如果不出意外你的clash默认目录应该是在~/.config/clash里面

那么在此处创建一个`profiles`文件夹，将你的clash配置文件放进去，并按照config-1.yaml、config-2.yaml的顺序依次命名你的各个配置。



此后如果你有超过两个配置文件，那么请在/opt/clash-console-tray-script/clash-console.py脚本的`# 创建菜单项`注释下的`## 配置文件`注释下，添加新的菜单也就是复制这一行`self.action_button2 = QAction("config2", self)`，并将其中的’2‘顺延到后面一位数字如‘3’。

在后面的`# 将菜单项添加到菜单`注释下也是一样的将`self.menu.addAction(self.action_button2)`的数字顺延一位

还有`# 设置点击事件`中的`self.action_button2.triggered.connect(self.button2_action_triggered)`

以及`# 各项菜单功能`注释下的也是依次顺延其中的`2`

```py
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

            restart_command = "clash-meta&"  # 根据实际情况修改重启命令
            subprocess.run(restart_command, shell=True)
            print("clash-meta restarted")

        except Exception as e:
            print(f"Error: {e}")
```

完成后保存文件，并重新运行脚本即可