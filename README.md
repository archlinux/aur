####  Command line cryptocurrency price tracker. Information is taken from Coinmarketcap's web API.

How to install:
```bash
$ git clone https://github.com/aokellermann/getcrypt.git
$ cd getcrypt
$ make
$ sudo make install
```
To get info about a currency, run
```bash
$ getcrypt [currency]
```
For example, to get info about Ripple (XRP), run
```bash
$ getcrypt ripple
```
To update your portfolio, use the options add, rm, or set like this
```bash
$ getcrypt [add/rm/set] [currency] [amount of currency] [amount of money spent]
```
For example, to add $200 spent on 150 Ripple (XRP), run
```bash
$ getcrypt add ripple 150 200
```
The parameter add will add your input to the current portfolio, rm will subtract from your current portfolio, and set will set your portfolio to the input, discarding any existing data about that currency.

To get info about your current holdings, run
```bash
$ getcrypt check [currency/all]
```

##### Future ideas/things to add
* Man page
* Arch/Debian/RPM package
* Print info of daily/weekly gains
* Stock market integration