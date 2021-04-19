# Maintainer: Charles Delfly <charles@delfly.fr>
pkgname=xs-update-manjaro
pkgver=3.5.5
pkgrel=1
pkgdesc="Automatic update of Manjaro System"
arch=('i686' 'x86_64')
url="https://github.com/lectrode/xs-update-manjaro.git"
license=('GPL3')
groups=()
depends=('curl')
optdepends=('wget' 'notify-desktop' 'flatpak')
makedepends=('git')
provides=()
conflicts=()
replaces=()
options=()
install=
source=("git+https://github.com/lectrode/$pkgname.git#tag=v$pkgver")
noextract=()
md5sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
}

build() {
    cd "$srcdir/$pkgname"
}

check() {
    cd "$srcdir/$pkgname"
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p $pkgdir/usr/share/pixmaps $pkgdir/usr/share/xs $pkgdir/etc/systemd/system $pkgdir/etc/xdg/autostart
    install -m 644 ElectrodeXS.png $pkgdir/usr/share/pixmaps/
    install -m 755 auto-update.sh $pkgdir/usr/share/xs/
    install -m 644 xs-autoupdate.service $pkgdir/etc/systemd/system/
    install -m 644 xs-updatehelper.desktop $pkgdir/etc/xdg/autostart/
}
