# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3-maim
pkgver=2021.01.01
pkgrel=1
pkgdesc="simple screenshot script using maim"
arch=('any')
groups=('therepoclub')
url="https://github.com/TheCynicalTeam/i3-maim"
license=('CC BY-NC-SA 4.0')
depends=('libnotify' 'maim' 'xdg-user-dirs' 'xdotool')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('39d360b31f4228c6f07aa4c5212bf32a37df27f2b118f5e71311d589efa9833e')

package() {
  mkdir -p $pkgdir/usr
  cp -a $srcdir/$pkgname-$pkgver/usr/bin $pkgdir/usr/bin
}
