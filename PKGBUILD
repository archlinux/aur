# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="rustic-server-bin"
pkgver="nightly"
pkgrel=1
pkgdesc="A REST server built in rust for use with rustic and restic"
url="https://rustic.cli.rs/ecosystem/rustic-server/"
arch=("x86_64" "aarch64" "i686" "armv7h")
provides=("rustic-server" "restic-rest-server")
license=("Apache-2.0")
source_x86_64=("https://github.com/rustic-rs/nightly/raw/main/rustic_server/rustic-server-nightly-x86_64-unknown-linux-gnu.tar.gz"{,.asc})
source_aarch64=("https://github.com/rustic-rs/nightly/raw/main/rustic_server/rustic-server-nightly-aarch64-unknown-linux-gnu.tar.gz"{,.asc})
source_i686=("https://github.com/rustic-rs/nightly/raw/main/rustic_server/rustic-server-nightly-i686-unknown-linux-gnu.tar.gz"{,.asc})
source_armv7h=("https://github.com/rustic-rs/nightly/raw/main/rustic_server/rustic-server-nightly-armv7-unknown-linux-gnueabihf.tar.gz"{,.asc})
validpgpkeys=("12B7166D9FD59124416952E34018C5DE3BF8C081")
b2sums_x86_64=("SKIP" "SKIP")
b2sums_aarch64=("SKIP" "SKIP")
b2sums_i686=("SKIP" "SKIP")
b2sums_armv7h=("SKIP" "SKIP")

package(){
 install -d "$pkgdir/usr/share/rustic"
 cp -r "config" "$pkgdir/usr/share/rustic"
 install -D -m 755 "rustic-server" -t "$pkgdir/usr/bin"
}
