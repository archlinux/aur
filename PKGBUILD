# Maintainer: Rain Clark <rain AT melonbread DOT dev>
# Contributor: Tom Hudson <mail at tomnomnom dot com>

pkgname=httprobe-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Take a list of domains and probe for working HTTP and HTTPS servers"
arch=('i686' 'x86_64')
url="https://github.com/tomnomnom/httprobe"
license=('MIT')

source_i686=(https://github.com/tomnomnom/httprobe/releases/download/v${pkgver}/httprobe-linux-386-${pkgver}.tgz)
source_x86_64=(https://github.com/tomnomnom/httprobe/releases/download/v${pkgver}/httprobe-linux-amd64-${pkgver}.tgz)

sha256sums_i686=('3a19bc71cbcbf352636f70a2585a2aaedbe9f53290dcccd4bfbb3ab56ece7a49')
sha256sums_x86_64=('a8e5dbaa09e4c35a6a1ac441667d1bd39f079d007ff77c6ffc4431687d875a94')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/httprobe ${pkgdir}/usr/bin/${pkgname}
}
