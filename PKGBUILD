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
source=("https://gitlab.com/dazars/radio_bash/-/archive/master/radio_bash-master.tar.gz")
noextract=()
sha256sums=('5b32a2f9db772d72fc3031d3ca56cb9c4f96367ec277022b23f9556c2c714faa')
#validpgpkeys=()

package() {
    install -Dm755 "$srcdir/radio_bash-master/radio_bash" "$pkgdir/usr/bin/radio_bash"
    install -Dm644 "$srcdir/radio_bash-master/radios" "$HOME/.config/bashradio/radios"
}
