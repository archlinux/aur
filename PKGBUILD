# Maintainer: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=gobgp-bin
pkgver=2.18.0
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

sha256sums_i686=("18466d2026e02ba5eedce3dd787424dfb4ee5fe4b67c6ebde5dc5aa6a39fe091")
sha256sums_x86_64=("919b434494c63ed77df62cf8d91b7893d8032a7bd2d9344a4206323f1c6c8939")
sha256sums_aarch64=("dd111c53c9db44a1a4f7a238c9e40a1501d5483bbb2ec5cc1d6efd580912cf9c")
sha256sums_armv6h=("705bf948016537a18e3418da9da8f76d0f3572ccde84e6cc3bcb161a41697893")

package() {
        install -d "${pkgdir}/usr/bin"
        install gobgp gobgpd "${pkgdir}/usr/bin"
}
