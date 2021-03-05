pkgname=webmusic-nginx
pkgver=0.1
pkgrel=2
arch=('x86_64')
url="https://cgit.ctu.cx/webmusic-nginx/"
license=( 'GPL-3' )
_commit="c96ceb864636c6c7dc388dfcc0f3f3e66f27ce44"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('fec0b266d1450fae9c51700103eccdbfd66e874ec24e5f73a89e55556884ee27')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/
  cp -r "$srcdir/${pkgname}-${_commit}" "${pkgdir}/usr/share/webapps/webmusic-nginx/"
  chmod 755 -R "${pkgdir}/usr/share/webapps/webmusic-nginx/"
}
