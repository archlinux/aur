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
sha512sums=('1020aeb648a8eecf355944c9b8836a67af887bc87011490afd42ee7b09ebd777d9be4feafda68d3573ce5568bc37cfd8609df388cddcb25f776ee20fa08ae02e'
            '9fc9a73398e517a0bd330712633b2884bf3ab35f10c908650390f74341f368e9cf5528eca89a75fc2ceea27191659b4eee57a3ae7899eb1d3c102dcdaf6cc5be')
backup=('etc/virustotal.conf')
install=('virustotal.install')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 vt.py "$pkgdir/usr/bin/virustotal"
  install -D -m644 virustotal.conf "$pkgdir/etc/virustotal.conf"

}
