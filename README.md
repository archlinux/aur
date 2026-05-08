# multiple-network-deauth
It is compiled with `make` on Linux.
**IT DOESN'T WORK ON WINDOWS**
## Dependencies
- `make`
- `aircrack-ng`
- `iwconfig`
## Usage
Before you do anything, it would not be bad idea to run `touch networks.json`. Then, database file is networks.json.
### Add
Example: 
```bash
  sdn add AA:BB:CC:11:22:33 4 networks.jsom
```
Arguments in order:
- bssid
- channel
- database file
### Remove
Example: 
```bash
  sdn remove AA:BB:CC:11:22:33 networks.jsom
```
Arguments in order:
- bssid
- channel
- database file
### Takedown
Example: 
```bash
  sudo sdn takedown 10 wlan0mon networks.json
```  
Arguments in order:
- packet number
- interface
- database file
