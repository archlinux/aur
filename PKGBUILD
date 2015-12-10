# Maintainer: sen <sen@archlinux.us>
pkgname=chrome-cntp
pkgver=1.1
pkgrel=4
pkgdesc="Chrome / Chromium extension that provides a customizable New Tab Page. Offers: RSS Feeds, Weather Forecast, Notes and Bookmarks"
arch=('arm' 'x86_64' 'i686')
url="https://github.com/sen87/Chrome-CNTP"
license=('GPL3')
source=("https://github.com/sen87/Chrome-CNTP/files/57562/Chrome-CNTP.crx.zip")
sha512sums=('d90459d5f95c73f9eaf02de1af3993955a983154f1b8d169c33bc12b33830f869bfae75b9ed7f7062b8b317e8c77efb502058efae8f663da2decb1c965434968')

package() {
  cd "${srcdir}/"

  install -Dm644 Chrome-CNTP.crx "$pkgdir/usr/share/Chrome-CNTP/Chrome-CNTP.crx"
  install -Dm644 jajbaigdfabgadnbmogpoichmgogbjmo.json "$pkgdir/usr/share/chromium/extensions/jajbaigdfabgadnbmogpoichmgogbjmo.json"
  install -Dm644 jajbaigdfabgadnbmogpoichmgogbjmo.json "$pkgdir/usr/share/google-chrome/extensions/jajbaigdfabgadnbmogpoichmgogbjmo.json"
}
