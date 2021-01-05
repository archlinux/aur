# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Heiko Baums <heiko@baums-on-web.de>
# Contributor: Roman Kreisel <roman.kreisel@epost.de>
# Contributor: damir <damir@archlinux.org>

pkgname=ding
pkgver=1.9
pkgrel=1
pkgdesc="A Dictionary Lookup program and EN<->DE Dictionary"
arch=('any')
license=('GPL')
url="http://www-user.tu-chemnitz.de/~fri/ding"
depends=('sh' 'tk' 'tre' 'aspell')
source=(http://ftp.tu-chemnitz.de/pub/Local/urz/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('69a6c81fcf785a286c053a352f3201cc8671c72851615c4b707a434309b098e5')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm755 de-en.txt "${pkgdir}"/usr/share/dict/de-en-txt
  install -Dm755 $pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1
  install -Dm755 $pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.png
  install -Dm755 $pkgname.png "${pkgdir}"/usr/share/pixmaps/$pkgname.desktop
}
