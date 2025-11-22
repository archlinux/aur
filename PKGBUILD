# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=rquickshare-bin
pkgver=0.11.5
pkgrel=1
pkgdesc=" Rust implementation of NearbyShare/QuickShare from Android for Linux and macOS."
arch=(x86_64)
url="https://github.com/Martichou/rquickshare"
license=('GPL-3.0-or-later')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
depends=('glibc' 'glib2' 'gdk-pixbuf2' 'hicolor-icon-theme' 'gtk3' 'webkit2gtk-4.1' 'dbus' 'gcc-libs' 'libsoup3' 'cairo')
source=("$url/releases/download/v${pkgver}/r-quick-share-main_v${pkgver}_glibc-2.39_amd64.deb")
sha256sums=('49085e77e351bcadcb0aff7707d371435ec1cd5a409a1e146e2cf824f48ff189')

package() {
	cd "$pkgdir"
	bsdtar xf "$srcdir/data.tar.gz"
}
