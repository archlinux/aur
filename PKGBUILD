pkgname=ee
pkgver=1.5.2
pkgrel=1
pkgdesc="Easy Editor in FreeBSD"
url="https://cgit.freebsd.org/"
arch=("x86_64")
source=("https://gitee.com/hpszsp/aur-packages-mirror-hpszsp/raw/master/ee.tar.gz")
sha256sums=("3d9c6a6a2d46c4597c17b77ec8611c90a199806810c173a8b0b82b85a7391de8")

package(){
  chmod +x ee
  mkdir -p $pkgdir/usr/local/bin
  cp ee $pkgdir/usr/local/bin/ee
  mkdir -p $pkgdir/usr/local/man/man1
  cp ee.1 $pkgdir/usr/local/man/man1/ee.1
}
