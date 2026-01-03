# Seija

[![License](https://img.shields.io/badge/license-GPLv3-brightgreen)]()
[![Language](https://img.shields.io/badge/language-Ruby-red)]()


A tiny **text-flipping CLI utility for Linux**, written in **Ruby**.  
Seija reverses input text and flips characters using Unicode glyphs to create  
**upside-down / mirrored text**, inspired by the touhou character seija kijin

---

##  Features

- **Reverse + Flip Text**

Seija reverses the input string and replaces characters with visually flipped  
Unicode equivalents.

Usage:
```bash
seija <text>
```

Example:
```bash
seija this is a test
```

Output:
```bash
ʇsǝʇ ɐ sᴉ sᴉɥʇ
```

##  Installation

### From the AUR

Install directly using an AUR helper;

```bash
yay -S seija
```
```bash
paru -S seija
```
```bash
ame ins seija
```

### Manual Installation

Clone the repository and build the package manually:

```bash
git clone https://github.com/0xraincandy/seija.git
cd seija
makepkg -si
```


