# Maintainer: Roberto "Roobre" Santalla <roobre (a) roobre , es>
pkgname=chezmoi-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Manage your dotfiles across multiple machines, securely. Pre-compiled."
arch=('x86_64')
url="https://github.com/twpayne/chezmoi"
license=('MIT')
provides=('chezmoi')
conflicts=('chezmoi')

_filename="${pkgname/-bin/}_${pkgver}_linux_amd64.tar.gz"

source_x86_64=("${url}/releases/download/v${pkgver}/${_filename}")
sha1sums_x86_64=('ee5baa2e3f8378df2df4cc4ba6730349c2a01f32')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
