# Maintainer: Daniel Bowring <aur@daniel.bowring.email>
pkgname=gitbutler-bin
pkgver=0.10.13
pkgrel=1
pkgdesc="Version control client, backed by Git, powered by Tauri/Rust/Svelte "
arch=('x86_64')
url="https://gitbutler.com/"
depends=('libayatana-appindicator' 'webkit2gtk' 'gtk3')
license=('FSL-1.0-MIT')
source=("https://releases.gitbutler.com/releases/release/${pkgver}-651/linux/$CARCH/git-butler_${pkgver}_amd64.deb")
sha256sums=('bcc5fe192eb9d9b2f10434d774d8525966f6ee097e276df2893dfe867bb84597')

package() {
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"
}
