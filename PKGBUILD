# Maintainer: Chrysostomus @forum.manjaro.org
pkgname=hibernator
pkgver=0.1
pkgrel=1
pkgdesc="Script to automate setting up hibernation"
arch=(any)
url="https://github.com/Chrysostomus/$pkgname"
license=("MIT")
depends=('sed' 'gawk' 'bash' 'mkinitcpio')
makedepends=('git')
source=("git://github.com/Chrysostomus/$pkgname")
md5sums=('SKIP')

package () {
  cd "$srcdir"
  install -Dm755 "$srcdir/$pkgname/hibernator" "$pkgdir/usr/bin/hibernator"
}
