# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=iptv-checker
pkgver=0.26.0
pkgrel=1
pkgdesc="Node.js CLI tool for checking links in IPTV playlists"
arch=('any')
url="https://github.com/freearhey/iptv-checker"
license=('MIT')
depends=('nodejs' 'ffmpeg')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('a5e0fb68dbd742f68e3303a0b51e058543b334fb34e1b2f4d6fc0619ea6d5ff0')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
}
