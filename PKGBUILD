pkgname=fool
appname='fool'
pkgver=0.2.1
pkgrel=1
arch=('x86_64' 'i686')
license=('MIT')
depends=('ncurses')
pkgdesc='A powerful git terminal interface which focuses on usability.'
url='https://github.com/spacekookie/fool'
provides=('fool')
source=("https://github.com/spacekookie/fool/releases/download/v${pkgver}/${pkgname}-v${pkgver}-${arch}-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')


package() {
  # local INSTALL_DIR=/usr/
  # local MAN_DIR=/usr/local/man

  mkdir -p "$pkgdir/usr/bin/"
  cp -v ./$pkgname "$pkgdir/usr/bin/"

  # Rust, Cargo and Documentation.
  # cd "${srcdir}/${pkgname}-${pkgver}"
  # cargo build --release
}
