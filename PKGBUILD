# Maintainer: sen <sen@archlinux.us>
pkgname=chrome-cntp
pkgver=1.1
pkgrel=2
pkgdesc="Chrome / Chromium extension that provides a customizable New Tab Page. Offers: RSS Feeds, Weather Forecast, Notes and Bookmarks"
arch=('x86_64' 'i686')
license=('GPL3')
source=("https://www.dropbox.com/s/ygasw6hets00msw/CNTP.crx?dl=1"
"https://www.dropbox.com/s/maooa5qr7ennpbb/jajbaigdfabgadnbmogpoichmgogbjmo.json?dl=1")
sha512sums=('2a4a85fc1fae982e6a6f442fd75622c02858645365a736c5832b120b30526ba7dc8511b7dceecda8ddf6e2b177dc4b4fab3fc005bda2bf43ea5bef1ff84702a2' 'c71ae7d8e319518556ef5bf531a46751f4b1dfdf94feeaf0cf8eb6790ae6ce37e40e8c4fe7f81bcc4fef26742d64f897998bf15fc61c9b2cbf65b1abb6e28655')

package() {
  cd "${srcdir}/"
  
  mv CNTP.crx?dl=1 CNTP.crx
  mv jajbaigdfabgadnbmogpoichmgogbjmo.json?dl=1 jajbaigdfabgadnbmogpoichmgogbjmo.json

  install -Dm644 CNTP.crx "$pkgdir/usr/share/CNTP/CNTP.crx"
  install -Dm644 jajbaigdfabgadnbmogpoichmgogbjmo.json "$pkgdir/usr/share/chromium/extensions/jajbaigdfabgadnbmogpoichmgogbjmo.json"
  install -Dm644 jajbaigdfabgadnbmogpoichmgogbjmo.json "$pkgdir/usr/share/google-chrome/extensions/jajbaigdfabgadnbmogpoichmgogbjmo.json"
}
