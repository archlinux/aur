# Maintainer : qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

_theme_name=qaz-blue-vista
pkgname=emerald-theme-$_theme_name
pkgver=1.0
pkgrel=1
pkgdesc="A blue vista theme for emerald."
arch=('any')
url="https://github.com/fkxxyz/$pkgname"
license=('GPL3')
source=("https://github.com/fkxxyz/emerald-theme-qaz-blue-vista/archive/master.zip")

package() {
  install -d "$pkgdir/usr/share/emerald/themes"
  cp -r "$srcdir/$pkgname-master/$_theme_name" "$pkgdir/usr/share/emerald/themes/"
}

sha256sums=('b37583a1fcefb6114660db1149099879f0851201326c67dbe1c587b613efb5a5')

