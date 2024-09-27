# Maintainer: jer4q <xp dot w1nd0ws dot xp dot mic at gmail dot com

pkgname=nekoget
pkgver=0.4.5
pkgrel=1
pkgdesc="A cli tool for fetching random catgirl images from NekosAPI or yande.re"
arch=('x86_64')
url="https://github.com/jer4q/nekoget.git"
license=('MIT')
depends=('python' 'python-pillow' 'python-requests' 'wget' 'python-colorama' 'libsixel')
optdepends=('xclip: for copying links on x11'
			'wl-clipboard: for copying images on wayland')
source=("https://github.com/jer4q/nekoget.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir"
  git clone https://github.com/jer4q/nekoget.git
  cd nekoget
}

package() {
  cd "$srcdir/nekoget"
  install -Dm755 nekoget "$pkgdir/usr/bin/nekoget"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

