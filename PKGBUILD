# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
pkgname='nyan'
pkgver=1.2.0
pkgrel=1
pkgdesc="a simple netcat wrapper"
arch=('any')
url="https://github.com/shibumi/nyan"
license=('GPL3')
depends=('gnu-netcat' 'pv')
source=('https://github.com/shibumi/nyan/archive/1.2.0.tar.gz')
sha512sums=('a68fd9f5bd423609d77d35f7e0dd1603ac52ef6765f1c9ca02261b6e8f6b13f062cd7939ec183a3129b7f8ca740b3defa6ef56d8940feb14c1988826e8a01092')

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  install -D -m755 nyan.sh "${pkgdir}/usr/bin/nyan"
}
