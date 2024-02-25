# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler-bin
pkgver=0.10.17
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-665/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('915227fb99d6a6a0fdc0a4446534d2bc25692267fe7cb5c801dab2e59664b02c')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
