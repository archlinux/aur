## Command line and GTK stock and cryptocurrency portfolio tracker.
#### How to install:
Before installation, make sure all dependencies are installed:
* curl
* json-c
* ncurses
* gtk3
* cairo
* libglade
```bash
$ git clone https://github.com/aokellermann/tick.git && cd tick
$ sudo make install
```
If you are an Arch user, you can install from the AUR.
```bash
$ aurman -S tick
```

### Usage
The GTK+ window can be opened by simply running the command "tick".
Currently, it only supports portfolio operations. If you would like to
use the CLI, additional arguments must be used.
#### Portfolio
To update your portfolio, use the options add, rm, or set. You may use the
special string "USD$" to add US Dollars to your portfolio.
```bash
$ tick [add/rm/set] [symbol/crypto_id/USD$] [quantity of shares] [USD spent]
```
For example, to add 3 shares of Tesla bought for $918.12 total, run
```bash
$ tick add tsla 3 918.12
```
You can also specify the price per share instead of total spent:
```bash
$ tick add tsla 3 306.04ea
```

The parameter "add" will add your input to the current portfolio, "rm" will
subtract from your current portfolio, and "set" will set your portfolio to
the input, discarding any existing data about that security. Trading costs/fees
should be factored into your USD spent. When adding a cryptocurrency to your
portfolio, you must use the cryptocurrency's name. For instance, to add Ripple,
you must use "ripple" instead of "xrp". This is due to some cryptocurrency
tickers also being listed on the stock market, such as ETH.

To get info about your current holdings, run
```bash
$ tick check
```
Prints information about all of your current holdings and a grand total
in an NCurses window. By default, your holdings will be sorted
alphabetically. You may press the left and right arrow keys to change
the sort category, or up and down to highlight different securities.
Press "q" to exit the window. You can also get information on a specific
security using
```bash
$ tick check [symbol/crypto_id/USD$]
```

You may encrypt your portfolio using the RC4 algorithm
```bash
$ tick encrypt
```
and decrypt it with
```bash
$ tick decrypt
```
You can modify and check your portfolio without explicitly decrypting it.

#### Security Information

To get information about a security, you can use the info command.
```bash
$ tick info tsla
```

The graph command will print out a graph in your terminal of the historic
price of the given security. Cryptocurrencies aren't supported yet, due to
API constraints. You may press the UP arrow key to zoom in, the DOWN arrow
key to zoom out, the LEFT arrow to pan left, the RIGHT arrow to pan right,
or the letter "q" to quit.
```bash
$ tick graph [symbol]
```

The cmp command has the same functionality as graph, but is intended for
comparing two securities. The command takes two symbols as arguments.
Both graphs will be displayed.
```bash
$ tick cmp [symbol] [symbol]
```
To compare the graphs of Tesla and Ford, run
```bash
$ tick cmp tsla f
```

To get news articles about a security you can use the news command. The
number of articles can be specified, but will default to three. You may
request a maximum of 50 articles.
```bash
$ tick news [symbol] [number of articles (optional)]
```

Once installed, you may read the man page for more information.

#### License
MIT License

Stock information is taken from IEX's free API. Mutual fund and
over-the-counter information is taken from and Morningstar and AlphaVantage's
free API.
Cryptocurrency information is taken from Coinmarketcap's free API.
Please do not abuse the APIs by repeatedly requesting information. Read
the provided license for more information.
#### Future Ideas/To-do
* APIv2 will be released in early Q4 (https://github.com/iexg/IEX-API/issues/403), which will likely enable:
    * Better reliability for issue type (I had problems in the past with it)
    * Mutual funds
    * Options
    * Commodities
    * Indices
    * OTC
    * Treasuries
    * Ratings
    * Currencies
    * International
* DEB/RPM package
* Bookmark certain stocks (not included in portfolio)
* Zoom in more than one month for ncurses graph
* Average graph points when skipping indices for greater accuracy
* Android app?
* Implement Coinmarketcap v2
* Notes for portfolio securities
* Mutex on portfolio
* Add security without reloading every security
* Refactoring
* gtk graph zoom