# Maintainer: Felix Laurie von Massenbach <felix@erbridge.co.uk>
pkgname=amulet
pkgver=1.0.8
pkgrel=1
pkgdesc="Lua-based audio / visual toolkit for small-scope games and experimentation"
arch=('x86_64')
url="http://www.amulet.xyz/"
license=('MIT')
depends=('gcc-libs-multilib')
source=("https://github.com/ianmaclarty/amulet/releases/download/v${pkgver}/amulet-v${pkgver}-linux.zip")
md5sums=('80bbe9fcae5d6f328bca28f45357dc1f')

package() {
    cd "amulet-v${pkgver}"
    install -D -m755 amulet "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 amulet_license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.pdf"
}
