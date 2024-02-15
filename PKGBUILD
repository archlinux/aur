# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler
pkgver=0.10.9
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-630/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('f3ee6b026c4af87dd8a24297a67624a72024376d4620d93b3e65a02a0cdca737')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
