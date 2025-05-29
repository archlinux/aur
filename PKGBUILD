# Maintainer: Your Name <address at domain dot tld>
pkgname=goose-cli-bin
_pkgname=goose
pkgver=stable
pkgrel=1
pkgdesc='an open source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM'
url='https://github.com/block/goose'
arch=('x86_64' 'arm64' 'aarch64')
_file=$_pkgname-$arch-unknown-linux-gnu.tar.bz2
source=("$_file::$url/releases/download/$pkgver/$_file")
source_arm64=("$_pkgname-aarch64-unknown-linux-gnu.tar.bz2::$url/releases/download/$pkgver/$_pkgname-aarch64-unknown-linux-gnu.tar.bz2")
license=('Apache-2.0')
depends=('libxcb')
optdepends=('keepassxc: D-bus secret service provider' 'gnome-keyring: GNOME secrets provider' 'kwallet: KDE secrets provider')
sha256sums=('bc51131961543c9a8b553e3ca72aba1997db84c43b28c0ee461702b403b47a08')
sha256sums_aarch64=('b4c88a3764ffc90daa6bbd16e7cfa7f0af1bce38afe2acd839a19d9bfe43eeff')
sha256sums_arm64=('b4c88a3764ffc90daa6bbd16e7cfa7f0af1bce38afe2acd839a19d9bfe43eeff')

package() {
    cd $srcdir/$file
    install -Dm755 goose "$pkgdir/usr/bin/goose"
}
