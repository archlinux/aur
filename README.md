# SnooScraper

A small program to scrape a subreddit, downloading content matching your criteria. It can also go deeper and scrape images and albums on commonly linked sites.

You can scrape a subreddit downloading posts and content from their links, depending on the options you pick. I have tested it by downloading large amounts of data and it works well. There are several parameters to customise what kind of content to get and where to get it from, the more you turn on the longer a scrape will take but the more content you will be able to download. 
 
Animated GIFs for example can be large, and can quickly add up to take up valuable disk space, so downloading them can be turned off. Another issue on reddit is that often images are not linked directly but via webpages on sites like imgur. I have included functions which go on to get data from those sites so as to not miss anything. These functions can be called separately using the command line options, to just download a whole imgur album for 
example.

My aim is to keep SnooScraper written in POSIX-compliant shell script, for portability and efficiency, it should work in any shell. I've tried it in bash, dash and zsh on GNU/Linux so far. It should work on other operating systems but I haven't tried. SnooScraper is free software, feel free to submit issues, patches, or use it in your own project.

**Supported External Sites:** imgur, tumblr, instagram

## How To Use

The dependencies are simple: any standard shell, [jq](https://stedolan.github.io/jq/), curl, sed and grep.
Download the script by cloning this repository, and make it exectutable.

```
git clone https://notabug.org/odg/SnooScraper.git
cd snooscraper
chmod +x snooscraper.sh
./snooscraper -h
```

The help text should explain the command line options. Review the parameters and customise them as you like before using. Basically a subreddit's name can be passed to the script to download posts' contents, or URLs of the supported external sites can be passed directly.

Files will be named after the ID (a base 36 number) of the reddit post from which they originate, or a unix timestamp if the URL is passed to the script directly. Reddit post IDs are zero-padded, so when sorting alphabetically they are also in chronological order. Albums have their images with a zero-padded number suffix after a dash, for example: abcxyz-01.jpg, abcxyz-02.jpg,...

## Planned Features

In the future I plan to add more sites (twitter, flickr, wikimedia, pinterest, maybe more), and the ability to scrape multiple subreddits simultaneously. Also more options: to change the sort method, narrow down by upvotes, start/end searches at different dates, etc.

I would also like to add the ability to scrape whole reddit accounts, and possibly accounts on the external sites. Reddit accounts are becoming [their own subreddits](https://www.reddit.com/60p3n1) anyway. Also potentially different download methods to increase speed and better handle parallel downloads.

## Credit

 * Jason Baumgartner for his [pushshift](https://pushshift.io) APIs, using [Elasticsearch](https://www.elastic.co/products/elasticsearch)
 * [jq](https://stedolan.github.io/jq/) for being a great lightweight JSON parser
 * [Shellcheck](https://www.shellcheck.net/) for helping me write correct and portable code