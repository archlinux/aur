# Contributor: mistgc <georgecai0908@outlook.com>
# Contributor: tee < teeaur at duck dot com >
pkgname=marker-md
pkgver=1.4.1
pkgrel=1
pkgdesc="A Desktop App for Easily Viewing and Editing Markdown Files"
arch=('x86_64')
url="https://marker.pages.dev"
conflicts=(marker)
license=(MIT)
depends=(cairo gdk-pixbuf2 glib2 glibc gtk3 hicolor-icon-theme libgcc libsoup pango webkit2gtk)
source=("https://github.com/tk04/Marker/releases/download/master/marker_${pkgver}_amd64.deb")
b2sums=('6d1c676722f5eb4a656df0e21815165ccd29ee0601e5b52d4ab16ea58c862d3daddf1937fe5cf705e76beb727a91df9d278c374a2eb5578134fe7f22837bf5dc')

package() {
  tar -xpf data.tar.gz -C "$pkgdir"
}
