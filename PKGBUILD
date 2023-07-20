# Maintainer: pika02
pkgname=hibernator-git
_pkgbase=hibernator
pkgver=0.1
pkgrel=2
pkgdesc="Script to automate setting up hibernation"
arch=(any)
url="https://github.com/Chrysostomus/$_pkgbase"
license=("MIT")
depends=('sed' 'awk' 'bash' 'mkinitcpio' 'update-grub')
makedepends=('git')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("git+https://github.com/Chrysostomus/$_pkgbase.git")
md5sums=('SKIP')

package () {
  cd "$srcdir"
  install -Dm755 "$srcdir/$_pkgbase/hibernator" "$pkgdir/usr/bin/hibernator"
} 
