# Packet Tracer 9.0.0 (AUR Package)

## Maintainer
**Sx4DoW** – yuformini9@gmail.com

## Description
Cisco Packet Tracer 9.0.0 is a network simulation tool that allows users to create network topologies and simulate modern computer networks.  
This package installs Packet Tracer without replacing any official packages, using a wrapper script to launch it safely.

## Installation
1. Download the Cisco Packet Tracer `.deb` file from the official NetAcad site:  
   [https://www.netacad.com/resources/lab-downloads](https://www.netacad.com/resources/lab-downloads)

2. Clone this AUR repository and build the package:

```bash
git clone https://aur.archlinux.org/packettracer900-bin.git
cd packettracer900-bin
```
3. Move the downloaded .deb file into the repository folder and rename it:
```bash
mv ~/Downloads/CiscoPacketTracer900_Open_Beta_July_Build680_linux_amd64.deb _manual_CiscoPacketTracer900_Open_Beta_July_Build680_linux_amd64.deb
```
4. Build and install the package:
```bash
makepkg -si
```
## Usage
Run Packet Tracer with the wrapper:
```bash
packettracer_run.sh
```
Or launch it from your desktop environment using the provided .desktop entry.
