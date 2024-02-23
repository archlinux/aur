# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler-bin
pkgver=0.10.15
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-657/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('1688c71f321445b3ef0a59b25e7c7d5ed0a5dbbd1f5ba2ad1e29bfb872ee9e60')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
