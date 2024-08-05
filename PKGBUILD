# Maintainer: qwjyh <urataw421 at gmail dot com>

pkgname=servitor-bin
_pkgname=servitor
pkgver=3
pkgrel=1
pkgdesc="A command-line Fediverse client that doesn’t require a server"
arch=('x86_64' 'arm64')
url="https://github.com/BentonEdmondson/servitor"
license=('GPL-3.0-only')
makedepends=()
optdepends=()
source=("https://github.com/BentonEdmondson/servitor/releases/download/v$pkgver/servitor.linux.$CARCH")
# sha256sums=('5387a1f240c0bedc0693fbc609a948803e44cb6a6e1dfee908b11d51fdfcfbac')
case "${CARCH}" in
  'x86_64')
sha256sums=('7de82bb60850a40504a5005695d4109196b521501ae87106c10ea59377494cf4')
    ;;
  'arm64')
    ;;
esac

package() {
    install -Dm755 "servitor.linux.${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim: sw=2:
