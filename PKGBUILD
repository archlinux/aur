# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=tunnelto-bin
_gitname=${pkgname%-bin}
pkgver=0.1.12
pkgrel=1
pkgdesc="Expose your local web server to the internet with a public URL."
arch=('any')
url="https://tunnelto.dev/"
license=('MIT')
makedepends=('cargo')
conflicts=('tunnelto')
provides=('tunnelto')
source=("https://github.com/agrinman/$_gitname/releases/download/$pkgver/tunnelto-linux.tar.gz")
sha256sums=('21169fe2bacf3e60db4a8ac95b96491df8e1ff9608ab1154d6178fa1774df0f7')

package() {
  # install binary
  install -Dm 755 "${srcdir}/tunnelto" -t "${pkgdir}/usr/bin"
}
