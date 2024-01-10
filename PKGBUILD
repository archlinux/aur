# Maintainer: Dandraghas <dandraghas at proton dot me>

pkgname=gomerge-bin
pkgver=3.3.0
pkgrel=1
pkgdesc="Gomerge is a tool which allows you to quickly bulk merge, approve and close several pull requests from your terminal."
url="https://github.com/Cian911/gomerge"
license=('MIT')
arch=('x86_64' 'armv6' 'arm64')

source_x86_64=("${url}/releases/download/${pkgver}/gomerge_${pkgver}_linux_amd64.tar.gz")
source_armv6=("${url}/releases/download/${pkgver}/gomerge_${pkgver}_linux_armv6.tar.gz")
source_arm64=("${url}/releases/download/${pkgver}/gomerge_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('eacca9f3572fe769e041d880b8a6031ca46655fda938673bda51439e0339c3e2')
sha256sums_armv6=('3a52d831cd3d5328945e003dc281f0d62c49a1f34063cf3f5a8af1d7ffc92535')
sha256sums_arm64=('d7c0d9d5eb4e5a364ffd5b129f5c62a95e3eb83ef71250f91a228d6f556658ea')


package() {
    install -D gomerge "${pkgdir}/usr/bin/gomerge"
}
