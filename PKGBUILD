# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=iptv-checker
pkgver=0.30.1
pkgrel=1
pkgdesc="Node.js CLI tool for checking links in IPTV playlists"
arch=('any')
url="https://github.com/freearhey/iptv-checker"
license=('MIT')
depends=('nodejs' 'ffmpeg')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('fae60beb61b8e1a107184948ec8efdf958ff7d9ae2394e5c3ede1ba7f830cf8f')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
