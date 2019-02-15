# Maintainer: Josh VanderLinden <arch@cloudlery.com>
# Contributor: sekret
_appname=baton
pkgname=${_appname}-bin
pkgver=0.1.5
pkgrel=2
pkgdesc="CLI / TUI to remotely manage Spotify playback"
provides=("${_appname}")
arch=('x86_64')
url="https://github.com/joshuathompson/${_appname}"
license=('MIT')
source=(
  "${pkgname}-${pkgver}::https://github.com/joshuathompson/${_appname}/releases/download/${pkgver}/${_appname}-${pkgver}-linux-amd64"
  "LICENSE::https://raw.githubusercontent.com/joshuathompson/${_appname}/master/LICENSE"
)
sha256sums=('01578bba3536678c4a08f76dbe5c8f3e92fa8dff4d678f561ec5278ec7915154'
            'a6106dc2efa5ca23da297495bf6011e32e0015aa240537f487a0b9ddb0b39a93')
options=(!strip)

package() {
  install -Dm755 ${pkgname}-${pkgver} "${pkgdir}/usr/bin/${_appname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et ai:
