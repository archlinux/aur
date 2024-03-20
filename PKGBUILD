# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler-bin
pkgver=0.10.25
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-734/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('71911aeb05a2a0f354d20cb9296a30d21148b5a72ab821c058cb7b3a9c58fc3f')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
