pkgname=webmusic-nginx
pkgver=0.1
pkgrel=3
arch=('x86_64')
pkgdesc="nginx generated index files optimized for music"
url="https://cgit.ctu.cx/${pkgname}"
license=( 'GPL-3' )
_commit="ac42fd4ab6820f5e840b13cbd03f3cdf0ae149ff"
source=("${pkgname}-${_commit}.tar.gz::https://cgit.ctu.cx/${pkgname}/snapshot/${pkgname}-${_commit}.tar.gz")
sha256sums=('59a659a17f2385d42f29928773cfd5d77591f10ee6b4816150ba45e944b830c7')

package() {
  mkdir -p ${pkgdir}/usr/share/webapps/
  cp -r "$srcdir/${pkgname}-${_commit}" "${pkgdir}/usr/share/webapps/webmusic-nginx/"
  chmod 755 -R "${pkgdir}/usr/share/webapps/webmusic-nginx/"
}
