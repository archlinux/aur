pkgname=text-viewer
pkgver=1.0
pkgrel=1
pkgdesc="Simple read only text viewer."
arch=('x86_64')
depends=('gtk3' 'unzip')
source=('https://raw.githubusercontent.com/YOLOKIT/text-viewer/refs/heads/main/text-viewer.zip')
sha256sums=('SKIP')
prepare() {
  unzip text-viewer.zip
  sudo mkdir /usr/share/applications/text-viewer
  sudo install -Dm644 "$srcdir/text-viewer.png" /usr/share/applications
  sudo install -Dm644 "$srcdir/text-viewer.desktop" /usr/share/applications
  sudo install -Dm644 "$srcdir/text-viewer" /bin
}
