# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=vykar-bin
_pkgname=vykar
pkgver=0.21.1
pkgrel=1
pkgdesc='Fast, encrypted, deduplicated backups in Rust — with friendly YAML config, a desktop GUI, and support for S3, custom REST and SFTP storage.'
arch=('x86_64')
url='https://vykar.borgbase.com'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'gtk3' 'glib2' 'gdk-pixbuf2' 'freetype2' 'fontconfig' 'xdotool')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver-$CARCH-unknown-linux-gnu.tar.gz::https://github.com/borgbase/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('db1fc9ae44fbe57def0d644e416e07d9a37ce68543735a579fbdae9054bf3e97f9cb87239d4e62c8df7b0a3b167057662a5866dbcac873748565e30852fdab7e')

package() {
    install -Dm755 "$srcdir/vykar" "$pkgdir/usr/bin/vykar"
    install -Dm755 "$srcdir/vykar-server" "$pkgdir/usr/bin/vykar-server"
    install -Dm755 "$srcdir/vykar-gui" "$pkgdir/usr/bin/vykar-gui"
}
