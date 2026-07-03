# Maintainer: asm0dey <pavel.finkelshtein@gmail.com>

pkgname=vykar-bin
_pkgname=vykar
pkgver=0.17.1
pkgrel=1
pkgdesc='Fast, encrypted, deduplicated backups in Rust — with friendly YAML config, a desktop GUI, and support for S3, custom REST and SFTP storage.'
arch=('x86_64')
url='https://vykar.borgbase.com'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'gtk3' 'glib2' 'gdk-pixbuf2' 'freetype2' 'fontconfig' 'xdotool')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver-$CARCH-unknown-linux-gnu.tar.gz::https://github.com/borgbase/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('5237658f7622d549150e72768b0410467849029170e5e087adf8e1e24c4e5ec2ecffd1d7a70bb6d3efa234228b0ab6af3ba8c15ee853aa9e45c68fab6c8c827e')

package() {
    install -Dm755 "$srcdir/vykar" "$pkgdir/usr/bin/vykar"
    install -Dm755 "$srcdir/vykar-server" "$pkgdir/usr/bin/vykar-server"
    install -Dm755 "$srcdir/vykar-gui" "$pkgdir/usr/bin/vykar-gui"
}
