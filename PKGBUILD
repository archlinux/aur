# Maintainer: Marie Ramlow <me[at]nycode.dev>

_pkgname=stellwerksim-rich-presence
pkgname=stellwerksim-rich-presence-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight Discord rich presence plugin for StellwerkSim"
url='https://github.com/NyCodeGHG/stellwerksim-rich-presence'
arch=('x86_64')
license=('GPL3')
source=("$url/releases/download/$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('febfdc08e795d35d4a457c9ca0cca48f2994f4029f8f14a06ed064bafed2d8e4')
conflicts=('stellwerksim-rich-presence')
provides=('stellwerksim-rich-presence')

package() {
  install -Dm 755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
