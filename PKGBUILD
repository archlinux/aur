# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=times-newer-roman
pkgver=1
pkgrel=1
pkgdesc='A font that kinda looks like Times New Roman, except each character is 5-10% wider.'
url='https://timesnewerroman.com/'
license=(GPL2)
arch=(any)

source=('https://timesnewerroman.com/assets/TimesNewerRoman.zip')
sha256sums=('2f4d66839d5b72105269d3a9d019ec19f0946280b33b2437460364c0d98dadba')

package() {
  install -d "$pkgdir/usr/share/fonts/OTF"
  install -m644 *.otf "$pkgdir/usr/share/fonts/OTF"
}
