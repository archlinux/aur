pkgname=fool
appname='fool'
pkgver=0.1.2
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
depends=('')
pkgdesc='A powerful git terminal interface which focuses on usability.'
url='https://github.com/spacekookie/fool'
provides=('fool')
source=("https://github.com/spacekookie/fool/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')


package() {
  local INSTALL_DIR=/usr/local
  local MAN_DIR=/usr/local/man

  # Rust, Cargo and Documentation.
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
}


install() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}