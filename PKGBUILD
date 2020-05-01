# Maintainer: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=gobgp-bin
pkgver=2.16.0
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

sha256sums_i686=("3e4c3ce8551746990f764693210a732b9d5d60e99b246b80a02d1f421572c50c")
sha256sums_x86_64=("dd78c3a60a337b779a5b525389b492939149f4e38c7711cb42bef1e2e5f50a5e")
sha256sums_aarch64=("4578289b424663e814d58f5c1bffcb8f134cf87e1cc929ff604a773eacccd724")
sha256sums_armv6h=("a27e108776bdf4dc3e4c417407dd77734c6058da793aff52d60f4cd3dc9d7cd5")

package() {
        install -d "${pkgdir}/usr/bin"
        install gobgp gobgpd "${pkgdir}/usr/bin"
}
