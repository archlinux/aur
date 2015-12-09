# Maintainer: sen <sen@archlinux.us>
pkgname=chrome-cntp
pkgver=1.1
pkgrel=3
pkgdesc="Chrome / Chromium extension that provides a customizable New Tab Page. Offers: RSS Feeds, Weather Forecast, Notes and Bookmarks"
arch=('arm' 'x86_64' 'i686')
url="https://github.com/sen87/Chrome-CNTP"
license=('GPL3')
makedepends=('unzip')
source=("https://github.com/sen87/Chrome-CNTP/files/57379/aur.zip")
sha512sums=('1d339ba78c39cb9194f2215c1202e6617c986803307895949f91e1e8fc80af11bc2f4b15a19b80ab7f40695ccf64b9115ae055e00cfa6e39584172503ca9ebf1')

package() {
  cd "${srcdir}/"

  install -Dm644 CNTP.crx "$pkgdir/usr/share/CNTP/CNTP.crx"
  install -Dm644 jajbaigdfabgadnbmogpoichmgogbjmo.json "$pkgdir/usr/share/chromium/extensions/jajbaigdfabgadnbmogpoichmgogbjmo.json"
  install -Dm644 jajbaigdfabgadnbmogpoichmgogbjmo.json "$pkgdir/usr/share/google-chrome/extensions/jajbaigdfabgadnbmogpoichmgogbjmo.json"
}
