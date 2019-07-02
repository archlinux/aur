# Maintainer : qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=qaz-blue-vista
pkgver=1.0
pkgrel=1
pkgdesc="A blue vista theme for emerald."
arch=('any')
url="https://github.com/fkxxyz/emerald-themes-qaz-blue-vista"
license=('GPL3')
source=("https://github.com/fkxxyz/emerald-themes-qaz-blue-vista/archive/master.zip")

package() {
  install -d "$pkgdir/usr/share/emerald/themes"
  cp -r "$srcdir/emerald-themes-$pkgname-master/$pkgname" "$pkgdir/usr/share/emerald/themes/"
}

sha256sums=('7953c059b221b6f7d2797bede650a8c362df155cae9d527fce4c549d0a4f7033')

