# Maintainer: Roberto "Roobre" Santalla <roobre (a) roobre , es>
pkgname=chezmoi-bin
pkgver=1.5.3
pkgrel=1
pkgdesc="Manage your dotfiles across multiple machines, securely. Pre-compiled."
arch=('x86_64')
url="https://github.com/twpayne/chezmoi"
license=('MIT')
provides=('chezmoi')
conflicts=('chezmoi')

_filename="${pkgname/-bin/}_${pkgver}_linux_amd64.tar.gz"

source_x86_64=("${url}/releases/download/v${pkgver}/${_filename}")
sha256sums_x86_64=('45d9985d4d5a1b4283cad52328bb8c0d32bed39a7fd033c85c6da8aa56e5af32')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
