# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler-bin
pkgver=0.10.22
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-703/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('fb1e068b6b6fa8f191d5c48d2662c8b24b8c9f990a1b85d928721da2a48e5cfd')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
