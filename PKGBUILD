# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=cryptsetup-gui
pkgver=0.6.1
pkgrel=1
epoch=
pkgdesc="Simple GUI for unlocking LUKS encrypted devices"
arch=('any')
url="https://github.com/jonhoo/cryptsetup-gui"
license=('MIT')
groups=()
depends=('glib2' 'cryptsetup')
makedepends=('gcc' 'glib2')
conflicts=()
replaces=()
install=$pkgname.install
changelog=
source=("https://github.com/jonhoo/$pkgname/archive/v${pkgver}.tar.gz")
noextract=()
md5sums=('38044a3b67f488b8f8b9adfea36b50ba')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
