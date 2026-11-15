# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=vykar-bin
_pkgname=vykar
pkgver=0.22.0
pkgrel=1
pkgdesc='Fast, encrypted, deduplicated backups in Rust — with friendly YAML config, a desktop GUI, and support for S3, custom REST and SFTP storage.'
arch=('x86_64')
url='https://vykar.borgbase.com'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'gtk3' 'glib2' 'gdk-pixbuf2' 'freetype2' 'fontconfig' 'xdotool')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver-$CARCH-unknown-linux-gnu.tar.gz::https://github.com/borgbase/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('0ca18ca47f60fb217aa9dbb2124d2014918706699ee100f9881a16227393a26571405752a96e580f1bff096efb27ebd67ebd156e0bebe64276833557a6168478')

package() {
    install -Dm755 "$srcdir/vykar" "$pkgdir/usr/bin/vykar"
    install -Dm755 "$srcdir/vykar-server" "$pkgdir/usr/bin/vykar-server"
    install -Dm755 "$srcdir/vykar-gui" "$pkgdir/usr/bin/vykar-gui"
}
