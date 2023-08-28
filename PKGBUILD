# Maintainer: nine

pkgname=nctl-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A CLI tool to interact with Nine API resources."
arch=('x86_64')
license=('Apache 2.0')
url="https://github.com/ninech/nctl"

source=("https://github.com/ninech/nctl/releases/download/v${pkgver}/nctl_${pkgver}_linux_amd64.tar.gz")
sha256sums=('b61f42e4614b93018d01cb0f5e198f08fd4da1c80a20f6f82cf2cf0a6a996849')

package() {
  install -Dm 0755 "${srcdir}"/nctl "${pkgdir}"/usr/bin/nctl
  install -Dm 0644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm 0644 "${srcdir}"/README.md "${pkgdir}"/usr/share/doc/$pkgname/README.md
}
