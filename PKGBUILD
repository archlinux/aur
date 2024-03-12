# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler-bin
pkgver=0.10.23
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-713/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('a281a56d1af29d17f09351d7d13101eb5aee425eafa88a8cc40b02b8033d0080')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
