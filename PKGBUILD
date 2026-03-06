# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=iptv-checker
pkgver=0.30.3
pkgrel=1
pkgdesc="Node.js CLI tool for checking links in IPTV playlists"
arch=('any')
url="https://github.com/freearhey/iptv-checker"
license=('MIT')
depends=('nodejs' 'ffmpeg')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('564cf654a5df43036f634e58ab14f977b0c7378fbd1a50d93b04eabd3dcc95e5')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
