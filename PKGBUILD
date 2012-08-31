# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
# Maintainer: Thomas Weißschuh <thomas_weissschuh@lavabit.com>

pkgname=batctl
pkgver=2012.3.0
pkgrel=1
pkgdesc="B.A.T.M.A.N. advanced control and management tool"
arch=('i686' 'x86_64')
url="http://www.open-mesh.net/"
license=('GPL')
depends=('glibc')
source=("http://downloads.open-mesh.net/batman/releases/batman-adv-${pkgver}/${pkgname}-${pkgver}.tar.gz")

build(){
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}  PREFIX=/usr install

}
sha512sums=('c584568fb9198644772e40c51fea7905bc5314ca3c403c71a78db56031b64a00395ae05402ccca137582fb1d4122dcaa1f6c4a5b6bcab34cbf2532fa983d6dcd')
