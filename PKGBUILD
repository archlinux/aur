# Maintainer: Choi Madeleine <gankiann.niu@gmail.com>
pkgname=nekoweb-cli-bin
_pkgname=${pkgname%-bin}
pkgver=v0.1.0
pkgrel=1
pkgdesc="CLI for Nekoweb"
arch=('x86_64' 'aarch64')
url="https://github.com/meganekkogekirabu/${_pkgname}"
license=('GPL')
source_x86_64=("${url}/releases/download/${pkgver}/neko-${pkgver}-amd64-linux")
source_aarch64=("${url}/releases/download/${pkgver}/neko-${pkgver}-aarch64-linux")
sha256sums_x86_64=('ba6ade51e912e120e3e353545291487aa9147e852800ab0cec06f57c69cd232d')
sha256sums_aarch64=('5a16ff3a97cf43fb36963e4f4b5b8c594a1ec9d9ab9ff5a92188cd7e63358c5e')

package() {
    cd "$srcdir"
    install -Dm0755 "neko-${pkgver}-${CARCH/x86_64/amd64}-linux" "$pkgdir/usr/bin/neko"
}
