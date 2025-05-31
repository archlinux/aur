# Maintainer : fkxxyz <fkxxyz@gmail.com>
# Contributor: fkxxyz <fkxxyz@gmail.com>

_theme_name=qaz-blue-vista
pkgname=emerald-theme-$_theme_name
pkgver=1.0
pkgrel=2
pkgdesc="A blue vista theme for emerald."
arch=('any')
url="https://github.com/fkxxyz/$pkgname"
license=('GPL3')
source=("qaz-blue-vista-v${pkgver}.tar.gz::https://github.com/fkxxyz/emerald-theme-qaz-blue-vista/archive/refs/tags/v${pkgver}.tar.gz")

package() {
  install -d "$pkgdir/usr/share/emerald/themes"
  cp -r "$srcdir/${pkgname}-${pkgver}/$_theme_name" "$pkgdir/usr/share/emerald/themes/"
}

sha256sums=('5511bcd1eacf2a79dbe92c0e2ede56373d1ac2770a386320beab0fac1188155f')

