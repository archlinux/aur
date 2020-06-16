# Maintainer: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=gobgp-bin
pkgver=2.17.0
pkgrel=1
pkgdesc="An open source BGP implementation designed from scratch for modern environment and implemented in Golang."
arch=('i686' 'x86_64' 'aarch64' 'armv6h')
url="https://osrg.github.io/gobgp/"
license=('Apache')
provides=('gobgp')
conflicts=('gobgp' 'gobgp-git')

source_i686=("https://github.com/osrg/gobgp/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_386.tar.gz")
source_x86_64=("https://github.com/osrg/gobgp/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("https://github.com/osrg/gobgp/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("https://github.com/osrg/gobgp/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_armv6.tar.gz")

sha256sums_i686=("cdf8b9e62ea30df968fde8969b8298fde38ac241ecac89f1da93a049ca708146")
sha256sums_x86_64=("6078a2a5a4735bcc5bd3aecce865a66c2df6d9f3403d82c0094f4aa22dc13ee4")
sha256sums_aarch64=("6a02a377f6d05a93cb1fad09d3ea459ca60350b847720a8065d28b5a82fea052")
sha256sums_armv6h=("a9043274c5183335fabdd000386efeeb893970500416471b573c00234a0075b0")

package() {
        install -d "${pkgdir}/usr/bin"
        install gobgp gobgpd "${pkgdir}/usr/bin"
}
