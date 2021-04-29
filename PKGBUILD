# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.me>

pkgname=drone-cli-bin
pkgver=1.2.4
pkgrel=1
pkgdesc="Command Line Tools for Drone CI"
arch=('x86_64')
license=('custom')
url="https://www.zoho.com/mail/"

source=("https://github.com/drone/drone-cli/releases/download/v${pkgver}/drone_linux_amd64.tar.gz")
sha256sums=("81ff259d12eea0459a1b9f560a3b7d66125da4ce43620b16f5eb2ec0f1f95b2f")

package() {
  mkdir -p "${pkgdir}"/usr/bin/
  cp "${srcdir}"/drone "${pkgdir}"/usr/bin/
}
