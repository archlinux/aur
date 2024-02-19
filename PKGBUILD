# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler-bin
pkgver=0.10.11
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-640/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('a5cf2cbd8bec831de87631bcf75362a6d35f6c5aac2c3bff77436f492186aaf1')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
