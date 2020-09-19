# Maintainer: Alexis Janon <kardyne+aur@gmail.com>

_pkgsrcname=simple-line-icons
_pkgmaintainer=thesabbir
_versionprefix=v
pkgver=2.5.4
pkgrel=1
pkgdesc="Simple and Minimal Line Icons "
pkgname=ttf-simple-line-icons
arch=(any)
url="https://thesabbir.github.io/simple-line-icons"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
md5sums=('52b2bb4b232f7254a8a5e1791870a91d')

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}/fonts"
  install -D -m644 "Simple-Line-Icons.ttf" "$pkgdir/usr/share/fonts/TTF/Simple-Line-Icons.ttf"
}
