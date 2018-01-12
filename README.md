####  Command line cryptocurrency price tracker. Information is taken from Coinmarketcap's web API.

How to install:
```bash
$ git clone https://github.com/aokellermann/getcrypt.git
$ cd getcrypt
$ make
$ sudo make install
```
If you are an Arch user, you can install from the AUR.
```bash
$ yaourt -S getcrypt
```
To get info about a currency, run
```bash
$ getcrypt [currency]
```
For example, to get info about Ripple (XRP), run
```bash
$ getcrypt ripple
```
To get info about the top *n* currencies, run
```bash
$ getcrypt [n]
```
For example, to get info about the top 12 currencies, run
```bash
$ getcrypt 12
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
* Get current balance of wallets from APIs (Would need a different api per crypto, which would be a lot of work.)
* Debian/RPM package
* Stock market integration (Google API is deprecated, but still works. Other APIs are slow and unwieldy.)
* Tray pop-up to show portfolio info (GTK StatusIcon deprecated, maybe use libappindicator?)