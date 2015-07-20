# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
pkgname=virustotal
pkgver=1.1
pkgrel=3
pkgdesc='Command-line client for virustotal.com'
arch=('any')
url="https://github.com/botherder/virustotal"
license=('BSD')
depends=('python')
source=("https://github.com/shibumi/$pkgname/archive/$pkgver.tar.gz"
"virustotal.install")
sha512sums=('48254029c3adf8ea25ed070a68363b5224a86291b5bfd3f14e102ecc3d377fd79f4d1a21ad00c2991c9b3ab4d81422aad5c710782b5e5214680c02bbda240ad9'
'9fc9a73398e517a0bd330712633b2884bf3ab35f10c908650390f74341f368e9cf5528eca89a75fc2ceea27191659b4eee57a3ae7899eb1d3c102dcdaf6cc5be')
backup=('etc/virustotal.conf')
install=('virustotal.install')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 vt.py "$pkgdir/usr/bin/virustotal"
  install -D -m644 virustotal.conf "$pkgdir/etc/virustotal.conf"

}
