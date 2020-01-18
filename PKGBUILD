# Maintainer: pngnwthbrd <coding@pngnwthbrd.com>
# Contributor: Daniel Kuester <coding@pngnwthbrd.com>
pkgname=vhost_creator
pkgver=0.99_10
pkgrel=1
pkgdesc="a little helper to create vhosts quickly"
arch=(i686 x86_64)
url="https://github.com/pngnwthbrd/vhost_creator"
license=('GPL')
#groups=
#provides=
depends=('python')
#makedepends=
#conflicts=
#replaces=
backup=("usr/share/${pkgname}/vhost_creator_conf.json")
install=
source=(https://pngnwthbrd.com/pkg/download/$pkgname-$pkgver.tar.gz)
md5sums=('2236a7ca375a043158fa0317228da1cc')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -Dm 755 "${pkgname}/vhost_creator.py" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${pkgname}/vhost_creator_conf.json" "${pkgdir}/usr/share/${pkgname}/vhost_creator_conf.json"
}
