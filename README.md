# zipkg
*Pronounced: “zip package”*

> [!WARNING]
> **Officially supported on Arch Linux and Arch-based distributions only.**
>
> **Windows users:** use `winget` or download software from the official website  
> **macOS users:** use `brew`, `.dmg` installers, or the official website  

> [!NOTE]
> **Other Linux distributions:**  
> zipkg may work with manual modifications, but it is **not officially supported** outside of Arch-based systems.  
> Expect breakage, missing features, and zero guarantees.

zipkg is a lightweight, low-level package manager written in **C**, built specifically for Arch Linux and Arch-based distributions.  
It is designed to be fast, minimal, and script-friendly while staying true to Arch’s philosophy of simplicity and user control.

When running on Arch Linux, zipkg integrates directly with the **Arch User Repository (AUR)**, allowing access to both official repository packages and community-maintained AUR packages through a single, consistent interface.

Rather than reinventing the wheel, zipkg acts as a thin layer on top of the existing Arch package ecosystem, focusing on clarity, speed, and automation without unnecessary abstraction.

## Usage

```bash
zipkg [option] <package>
````

Options:

* `-i` Install a package by name
* `-r` Uninstall a package

## Contributing

zipkg welcomes **developers, power users, and curious nerds**.

If you want to:

* Improve performance
* Add features
* Fix bugs
* Experiment with other distributions

Feel free to **fork the project** or submit a **pull request**.
Clean code, clear intent, and practical changes are always appreciated.

## Installation (For arch and other arch based distros)
zipkg is actually not that hard to install, Funnily enough the installation
process is just a simple command with **yay**.

### Use this command to install:
```bash
yay -S zipkg
```
Simply launch **zipkg** by using ```zipkg```. This will initialize everything and then you can use it from there. 

## Contributing

zipkg welcomes **developers, power users, and curious nerds**.

If you want to:

* Improve performance
* Add features
* Fix bugs
* Experiment with other distributions

Feel free to **fork the project** or submit a **pull request**.
Clean code, clear intent, and practical changes are always appreciated.

