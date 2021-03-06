pkgname=webmusic-nginx
pkgver=0.1
pkgrel=3
arch=('x86_64')
url="https://cgit.ctu.cx/webmusic-nginx/"
license=( 'GPL-3' )
_commit="eed52e44922c9b8cc8dd04b026eb5efa6a9bf8ef"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('bc358adb3281eb07c36d1e869e2c38b14c2413956c316e3025daa5b75b76bbab')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/
  cp -r "$srcdir/${pkgname}-${_commit}" "${pkgdir}/usr/share/webapps/webmusic-nginx/"
  chmod 755 -R "${pkgdir}/usr/share/webapps/webmusic-nginx/"
}
