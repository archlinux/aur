# Maintainer: bilabila <bilabila@qq.com>
pkgname=duguanjia
pkgver=1.0.1
pkgrel=2
pkgdesc='Du Gatekeeper'
arch=(x86_64)
url=https://duguanjia.baidu.com/
provides=($pkgname)
conflicts=($pkgname)
license=(custom)
depends=()
source=('https://duguanjia.baidu.com/download/duguanjia/DuGuanjia_Setup_Linux_amd64.deb')
sha512sums=(SKIP)
install=$pkgname.install
package() {
  tar -C $pkgdir -xf $srcdir/data.tar.xz ./opt/
  chmod 755 $pkgdir/opt
}
