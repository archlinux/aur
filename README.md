# harvard-linux-printer
A script to allow Harvard Linux users to connect to the FAS printer system. 

Harvard University IT does not currently offer Linux users any way to connect to the printing system from their laptops. I wrote this bash script to remedy that problem. 


## Instructions

**Note:** *Do not run this script on an insecure Wi-Fi network (like Harvard Guest or Harvard University).*

Download `harvard-linux-printer.sh` to some directory. 

Then, run the following:

~~~~
sudo chmod 755 harvard-linux-printer.sh
sudo ./harvard-linux-printer.sh
~~~~

Note that you need to know your PaperCut username and password, which can be different from your my.harvard login information. 

The printer connections are preserved across restarts (unlike with the Windows setup), so you can delete the script after it has been run. Also, running the script multiple times will not create duplicate printer entries, but rather overwrite existing printers with the same names. 


## Known Issues

- If your PaperCut username or password contains a colon or percent sign, then the script will fail to authenticate. 
- If printing from Chrome, it is recommended to use the system print dialog (`Ctrl + Shift + P`) rather than Chrome's built-in one. In particular, printing to a color printer from within Chrome results in a black-and-white image. 
- Duplex printing is not available on all printers. 

Please report any bugs [here](https://github.com/djsavvy/harvard-linux-printer/issues).