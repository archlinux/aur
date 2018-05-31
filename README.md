# SnooScraper

A small program to scrape content from a subreddit, a reddit user, and from various popular image sites, downloading files matching your criteria.

You can scrape a subreddit or a username, downloading posts and content from their posts, depending on the options you pick. I have tested it by downloading large amounts of data and it works well. There are several parameters to customise what kind of content to get and where to get it from, the more you turn on the longer a scrape will take but the more content you will be able to download.
 
Animated GIFs/videos for example can be large, and can quickly add up to take up valuable disk space, so downloading them can be turned off. Another issue on reddit is that often images are not linked directly but via webpages on sites like imgur. I have included functions which go on to get data from those sites so as to not miss anything. These functions can be called separately using the command line options, to just download a whole imgur album for example.

My aim is to keep SnooScraper written in [POSIX-compliant shell](https://en.wikipedia.org/wiki/Unix_shell) script for portability and efficiency, it should work in any shell. I've tried it in bash and dash on GNU/Linux, and in bash in Cygwin on Windows so far. It should work on other operating systems that I haven't tried.

SnooScraper is free software: you can redistribute it and/or modify it under the terms of the [GNU General Public License](https://www.gnu.org/licenses/gpl.html) as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

**Supported External Sites:** imgur, instagram, pinterest, tumblr

## How To Use

Other than a shell, and standard tools curl, sed and grep, the only dependency is [jq](https://stedolan.github.io/jq/). jq is available in most GNU/Linux distributions, [on Homebrew](https://formulae.brew.sh/formula/jq) for macOS, [in Cygwin](https://cygwin.com/cgi-bin2/package-cat.cgi?file=x86_64%2Fjq%2Fjq-1.5-3&grep=jq) on Windows, or can be downloaded from [github](https://github.com/stedolan/jq/releases). Then download the script and default config file by [downloading](https://notabug.org/odg/SnooScraper/releases) and extracting a release, or cloning this repository, and make it executable:

```
git clone https://notabug.org/odg/SnooScraper.git #if you haven't downloaded it
cd SnooScraper
chmod +x snooscraper
./snooscraper -h
```

The help text (-h) should explain the command line options. Review the parameters in the [config](https://notabug.org/odg/SnooScraper/src/master/config) file and customise them as you like before using. Basically a subreddit's name or username can be passed to the script to download posts' contents, or URLs of the supported external sites can be passed directly. Any files already present will not be downloaded, delete them to force redownloading.

Files will be named after the ID (a [base 36](https://en.wikipedia.org/wiki/Base36) number) of the reddit post from which they originate, or a [unix timestamp](https://en.wikipedia.org/wiki/Unix_time) if the URL is passed to the script directly. Reddit post IDs are zero-padded, so when sorting alphabetically they are also in chronological order. Albums have their images with a zero-padded number suffix after a dash, for example: abcxyz-01.jpg, abcxyz-02.jpg...

A cleaning function (-c) is also included. This attempts to remove any duplicates (ie. reposts, by comparing checksums), empty files (404 errors, any failed downloads) or files with the wrong extension (depending on configuration).

## Planned Features

In the future I plan to add more sites (twitter, flickr wikimedia, maybe more), and the ability to scrape multiple subreddits/accounts simultaneously. Also more options: to change the [sort method](https://redditblog.com/2009/10/15/reddits-new-comment-sorting-system/), narrow down by upvotes, start/end searches at different dates, etc. Also potentially different download methods to increase speed and better handle parallel downloads.

## Thanks

 * Jason Baumgartner for his [pushshift](https://pushshift.io) APIs, using [Elasticsearch](https://www.elastic.co/products/elasticsearch)
 * [jq](https://stedolan.github.io/jq/) for being a great lightweight JSON parser
 * [Shellcheck](https://www.shellcheck.net/) for helping me write correct and portable code