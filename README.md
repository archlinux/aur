#### Command line stock price tracker. Information is taken from IEX's web API.
How to install:
```bash
$ git clone https://github.com/aokellermann/tick.git
$ cd tick
$ make
$ sudo make install
```
If you are an Arch user, you can install from the AUR.
```bash
$ yaourt -S tick
```
To update your portfolio, use the options add, rm, or set like this
```bash
$ tick [add/rm/set] [symbol] [quantity of shares] [USD spent]
```
For example, to add 3 shares of Tesla bought for $918.12 total, run
```bash
$ tick add tsla 3 918.12
```
The parameter add will add your input to the current portfolio, rm will subtract from your current portfolio, and set will set your portfolio to the input, discarding any existing data about that stock.

To get info about your current holdings, run
```bash
$ tick check [symbol/all]
```