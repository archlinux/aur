# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=tunnelto-bin
_gitname=${pkgname%-bin}
pkgver=0.1.14
pkgrel=1
pkgdesc="Expose your local web server to the internet with a public URL."
arch=('any')
url="https://tunnelto.dev/"
license=('MIT')
makedepends=('cargo')
conflicts=('tunnelto')
provides=('tunnelto')
source=("https://github.com/agrinman/$_gitname/releases/download/$pkgver/tunnelto-linux.tar.gz")
sha256sums=('edeb7ede6b6823b65aac742844de01090515e42268f544aa8b69b9ea1ad591b4')

package() {
  # install binary
  install -Dm 755 "${srcdir}/tunnelto" -t "${pkgdir}/usr/bin"
}
