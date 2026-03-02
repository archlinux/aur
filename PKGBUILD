# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=iptv-checker
pkgver=0.29.2
pkgrel=1
pkgdesc="Node.js CLI tool for checking links in IPTV playlists"
arch=('any')
url="https://github.com/freearhey/iptv-checker"
license=('MIT')
depends=('nodejs' 'ffmpeg')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('1a486857eb38c711ea971426e559f48d3401d212dc2a6513a14c267b4f66c5b4')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
