# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler
pkgver=0.10.4
pkgrel=2
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://app.gitbutler.com/downloads/release/linux/$CARCH/deb")
sha256sums=('07f00103fd64befd8325d5d0d76a660c89c05468b5cb89f23ed6e0b6cbf7f574')


package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
