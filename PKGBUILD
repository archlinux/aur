# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>
pkgname=virustotal
pkgver=1.3
pkgrel=1
pkgdesc='Command-line client for virustotal.com'
arch=('any')
url="https://github.com/botherder/virustotal"
license=('BSD')
depends=('python')
source=("https://github.com/shibumi/$pkgname/archive/$pkgver.tar.gz"
"virustotal.install")
sha512sums=('90ab565c537765bb6463591bd3635c91f3fceca4fd6450883250551275f818132287e08e6d05617a838da7f6fa353cf09ae9f4e593d4a1f77a45f265ff92cf9c'
            '9fc9a73398e517a0bd330712633b2884bf3ab35f10c908650390f74341f368e9cf5528eca89a75fc2ceea27191659b4eee57a3ae7899eb1d3c102dcdaf6cc5be')
backup=('etc/virustotal.conf')
install='virustotal.install'

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 vt.py "$pkgdir/usr/bin/virustotal"
  install -D -m644 virustotal.conf "$pkgdir/etc/virustotal.conf"

}
