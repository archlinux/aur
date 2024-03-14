# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler-bin
pkgver=0.10.24
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-718/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('7939a32051b6ab7b9afe5e0f7a909060a7620ff2ff272074932a4bf1f7c86a37')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
