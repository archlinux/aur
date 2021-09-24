# Maintainer: Telegram: @SrDaza <dazars1@hotmail.com>
pkgname=radio_bash
pkgver=0.0.2
pkgrel=1
#epoch=
pkgdesc="Radio en terminal mediante bash y mpv"
arch=(x86_64)
url=""
license=('GPL')
groups=()
depends=('mpv' 'libnotify' 'figlet')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/dazars/radio_bash/-/blob/master/radio_bash" "https://gitlab.com/dazars/radio_bash/-/blob/master/radios")
noextract=()
md5sums=('546a6b4a0973d89866f23f161123f0ae' '9261c5dec2775e277009381345bde2cc')
validpgpkeys=()

package() {
install -Dm755 "$srcdir"/radio_bash "$pkgdir"/usr/bin/radio_bash
install -Dm644 "$srcdir"/radios "$HOME"/.config/bashradio/radios
}
