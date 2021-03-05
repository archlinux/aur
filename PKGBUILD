pkgname=webmusic-nginx
pkgver=0.1
pkgrel=1
arch=('x86_64')
url="https://cgit.ctu.cx/webmusic-nginx/"
license=( 'GPL-3' )
_commit="fff8c358ca194b9b87881054bb596d9b4a3727bb"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('7cf958a20e2177d428d3124ab3b47b70bd4cde821feca564a05d3d3c28423581')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/
  cp -r "$srcdir/${pkgname}-${_commit}" "${pkgdir}/usr/share/webapps/webmusic-nginx/"
  chmod 755 -R "${pkgdir}/usr/share/webapps/webmusic-nginx/"
}
