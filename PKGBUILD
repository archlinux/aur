# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler
pkgver=0.10.6
pkgrel=2
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/0.10.6-619/linux/$CARCH/git-butler_0.10.6_amd64.deb")
sha256sums=('dcdab541508778ff1129a1b43c5a23b415c8066f9e44a96aaa373ae473d6cc66')


package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
