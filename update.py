from bs4 import BeautifulSoup
import mechanicalsoup
import re
import subprocess
import warnings

URL1="https://www.siedler25.org/"
URL2="https://www.siedler25.org/index.php?com=dynamic&mod=2&type=nightly"
LINK_URL_RE=re.compile('https://www.siedler25.org/uploads/nightly/s25rttr_([0-9]{8})-[0-9a-f]{40}-linux.x86_64.tar.bz2')
TEMPLATE="""
# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=s25rttr-nightly-bin
pkgver={date}
pkgrel=1
pkgdesc="Settlers II remake (Needs a copy of the original game!)"
arch=('x86_64')
url="http://www.siedler25.org/"
license=('GPL3')
depends=(sdl sdl_mixer)
install=s25rttr-nightly-bin.install
source=("{url}"
        "rttr"
        "s25rttr-nightly-bin.install")
sha256sums=('0000000000000000000000000000000000000000000000000000000000000000'
            '985b0e88823e3b7d525cedfb602bb249217dc0e5271223b2a810ef37c1908fdb'
            '774aaaafc556ccd3334ee0129267382117ec5e178095377a4676cbcf00845489')

build() {{
  cd "$srcdir"/s25rttr_"$pkgver"
  rm lib/libminiupnpc.so.*
}}

package() {{
  cd "$srcdir"/s25rttr_"$pkgver"
  install -d "$pkgdir"/usr
  cp -r lib/ share/ "$pkgdir"/usr/
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/lib/s25rttr
  install -m755 bin/s25client "$pkgdir"/usr/lib/s25rttr/
  install -m755 ../rttr "$pkgdir"/usr/bin/
}}

# vim:set ts=2 sw=2 et:
"""[1:]

browser = mechanicalsoup.StatefulBrowser()
browser.open(URL1)
browser.open(URL2)

hrefs = (a.get("href") for a in browser.get_current_page()("a"))
matching_hrefs = (LINK_URL_RE.match(href) for href in hrefs if href is not None)
result = [(m.group(0), m.group(1)) for m in matching_hrefs if m is not None]
if len(result) != 1:
    raise ValueError
url, date = result[0]
print(TEMPLATE.format(date=date, url=url), end="")
