# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler-bin
pkgver=0.10.21
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-696/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('205d62966cf4c36975be0540e4cfbeb1c0badb6c921e4dcefbb065bd50e8f6cf')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
