# Maintainer: Dirk Rauber <dirk@nine.ch>

pkgname=nctl
pkgver=1.2.5
pkgrel=1
pkgdesc="A CLI tool to interact with Nine API resources."
arch=('x86_64')
license=('Apache')
url="https://www.nine.ch/"

source=("https://github.com/ninech/nctl/releases/download/v${pkgver}/nctl_${pkgver}_linux_amd64.tar.gz")
sha256sums=('9443550cfb4423b0b0cece040e088f5b024f8460c7ef46880ec84704f5125b84')

package() {
  install -Dm 0755 "${srcdir}"/nctl "${pkgdir}"/usr/bin/nctl
  install -Dm 0644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm 0644 "${srcdir}"/README.md "${pkgdir}"/usr/share/doc/$pkgname/README.md
}
