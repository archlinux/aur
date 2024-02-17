# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler
pkgver=0.10.10
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-634/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('509f28fd04f465c7333791dae6a866b59545adaba429700fcaf631ba1eacc7e1')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
