# Maintainer: pika02
pkgname=hibernator-git
_pkgname=hibernator
pkgver=0.1
pkgrel=1
pkgdesc="Script to automate setting up hibernation"
arch=(any)
url="https://github.com/Chrysostomus/hibernator"
license=("MIT")
depends=('sed' 'gawk' 'bash' 'mkinitcpio' 'update-grub')
makedepends=('git')
source=("git+https://github.com/Chrysostomus/$_pkgname.git")
md5sums=('SKIP')

package () {
  cd "$srcdir"
  install -Dm755 "$srcdir/$_pkgname/hibernator" "$pkgdir/usr/bin/hibernator"
} 
