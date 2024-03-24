# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler-bin
pkgver=0.10.27
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-746/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('67611181bac16da2f0c41db000691063f55b4b288c5451966c8641696f7c896e')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
