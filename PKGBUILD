# Maintainer: ju6ge <judge@felixrichter.tech>
pkgname=piri-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="High-performance Niri compositor extension (Binary Distribution)"
arch=('x86_64')
url="https://github.com/Asthestarsfalll/piri"
license=('MIT')
depends=('niri')
provides=('piri')
conflicts=('piri-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Asthestarsfalll/piri/releases/download/v${pkgver}/piri-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('54b5ca845c8179ebff64083d406c80b1be789f9d036a9f873d85707326def472')

package() {
  # Extract the archive
  cd "$srcdir"
  
  # Install the binary to /usr/bin/
  # Assuming the tarball contains the binary named 'piri'
  install -Dm755 piri "$pkgdir/usr/bin/piri"
}
