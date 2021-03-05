pkgname=webmusic-nginx
pkgver=0.1
pkgrel=0
arch=('x86_64')
url="https://cgit.ctu.cx/webmusic-nginx/"
license=( 'GPL-3' )
_commit="f769d3e24676b1cec9f950b985a55f3dff36aa2e"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('416711165c4ef7cba1eaba3556d4301abb82fed7b6bfa0cbf2b5db67201eecc4')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/
  cp -r "$srcdir/${pkgname}-${_commit}" "${pkgdir}/usr/share/webapps/webmusic-nginx/"
  chmod 755 -R "${pkgdir}/usr/share/webapps/webmusic-nginx/"
}
