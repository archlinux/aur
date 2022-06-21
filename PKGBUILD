# Maintainer: Rain Clark <rain AT melonbread DOT dev>

pkgname=httprobe-bin
pkgver=0.2
pkgrel=2
pkgdesc="Take a list of domains and probe for working HTTP and HTTPS servers"
arch=('i686' 'x86_64')
url="https://github.com/tomnomnom/httprobe"
license=('MIT')

source_i686=(https://github.com/tomnomnom/httprobe/releases/download/v${pkgver}/httprobe-linux-386-${pkgver}.tgz)
source_x86_64=(https://github.com/tomnomnom/httprobe/releases/download/v${pkgver}/httprobe-linux-amd64-${pkgver}.tgz)

sha256sums_i686=('8502e5942c132a8fa63cfe236720a92022851b2a3629c65ccc95d38eaf9c55e1')
sha256sums_x86_64=('4a43ae3cb355c698b811f4ddf1da117ad215984a1187997deb41f89a5c5fff40')

package() {
    mkdir -p ${pkgdir}/usr/bin
    install ${srcdir}/httprobe ${pkgdir}/usr/bin/httprobe
}
