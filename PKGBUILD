# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler
pkgver=0.10.7
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-624/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('4b756fd2ee2c36f9008d1bed219f57d467fe989219edaca426f3259404b2c60d')


package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
