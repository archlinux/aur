# TODOAPP
 
This is a todolist app.
If you run the install script you will be able to run it in the terminal with the command 'todo'.
(The install script works only in bash terminals)
We are happy about any feedback! Do not hesitate.

---

Make sure you have installed the dependencies.

# DEPENDENCIES

You need rich for python.

```bash
python3 -m pip install rich
```

If pip is missing: 
```bash
sudo apt install python3-pip
```
or:
```bash
sudo pacman -S python-pip
```

# INSTALL

You first need to clone the repo into ~/TODOAPP:

```bash
git clone https://github.com/NVitschDEV/TODOAPP.git
```

Make sure the installer is executable:

```bash
sudo chmod +x ~/TODOAPP/install.sh
```

Then simply run the install script:
```bash
~/TODOAPP/install.sh
```
You will be able to use the app with this command.
```bash
todo
```
Please dont try the uninstall script. It is in the betaphase. :)

You can use an AUR helper
```bash
paru -S ptodo
```

You can clone it manually
```bash
git clone https://github.com/NVitschDEV/ptodo.git
cd ptodo/
makepkg -si
```
