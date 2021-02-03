# Maintainer: fi-le <info at fi-le dot net>
# Everyone else seems to compile everything, but since I don't need any fancy features, just downloading the binary sounds much better to me. Correct me if I'm wrong please!
pkgname=kakikun
pkgver=0.1.0
pkgrel=1
pkgdesc='A paint and ASCII art application for the terminal'
arch=('x86_64')
url="https://fi-le.net/programming/#kakikun"
license=('MIT')
depends=('cargo' 'git')
source=("https://github.com/file-acomplaint/kakikun/releases/download/v0.1.0/kakikun.tar.gz")
md5sums=(26c5e57593cc1651f5e6edc402179a17)

package() {
  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
