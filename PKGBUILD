# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=vykar-bin
_pkgname=vykar
pkgver=0.17.0
pkgrel=1
pkgdesc='Fast, encrypted, deduplicated backups in Rust — with friendly YAML config, a desktop GUI, and support for S3, custom REST and SFTP storage.'
arch=('x86_64')
url='https://vykar.borgbase.com'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'gtk3' 'glib2' 'gdk-pixbuf2' 'freetype2' 'fontconfig' 'xdotool')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver-$CARCH-unknown-linux-gnu.tar.gz::https://github.com/borgbase/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('f34b1637791205a04052a7de4830343dc3e7b690066ddab8e0e6c2121e1343336d683df00537db4ed0c0bd3c2a8b3b8b4b05148cbe92081b078d8d997dd5ea5c')

package() {
    install -Dm755 "$srcdir/vykar" "$pkgdir/usr/bin/vykar"
    install -Dm755 "$srcdir/vykar-server" "$pkgdir/usr/bin/vykar-server"
    install -Dm755 "$srcdir/vykar-gui" "$pkgdir/usr/bin/vykar-gui"
}
