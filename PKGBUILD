# Maintainer: Josh VanderLinden <arch@cloudlery.com>
# Contributor: sekret
_appname=baton
pkgname=${_appname}-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="CLI / TUI to remotely manage Spotify playback"
provides=("${_appname}")
arch=('x86_64')
url="https://github.com/joshuathompson/${_appname}"
license=('MIT')
source=(
  "${pkgname}-${pkgver}::https://github.com/joshuathompson/${_appname}/releases/download/${pkgver}/${_appname}-${pkgver}-linux-amd64"
  "LICENSE::https://raw.githubusercontent.com/joshuathompson/${_appname}/master/LICENSE"
)
sha256sums=('5ead3a74b087cdbd3b35d8916c1165fdbce88f7087e455f996732e6fb0bf9156'
            'a6106dc2efa5ca23da297495bf6011e32e0015aa240537f487a0b9ddb0b39a93')
options=(!strip)

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${_appname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ai:
