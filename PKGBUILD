# Maintainer: Elio Esteves Duarte <elio.esteves.duarte@gmail.com>
_pkgname=tomate
pkgname=python-$_pkgname
pkgver=0.13.0
pkgrel=2
pkgdesc="This package has been joined to tomate-gtk. To prevent upgrade problems in the tomate-gtk, this package will be still a dependency of it but will be empty."
arch=('any')
url="https://github.com/eliostvs/tomate/"
license=('GPL')
depends=()
makedepends=()
options=(!emptydirs)
source=("https://github.com/eliostvs/$_pkgname/archive/$pkgver.tar.gz")
md5sums=('7388a4072394b78695dfedd66f35ae4a')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

# vim:set ts=2 sw=2 et:
