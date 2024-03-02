# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler-bin
pkgver=0.10.19
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-680/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('e6ad991c5b40d9c081c5a21bf9d4b89717303ee8f3b54dc32ba37d4775e57619')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
