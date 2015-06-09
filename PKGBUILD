# Maintainer: fqqbar
# Contributor: Matthew Longley <randomticktock@gmail.com>

pkgname='squeak-sources-41'
pkgver='41'
pkgrel='1'
pkgdesc='Source code file required by Squeak to view function names, source code, etc. within the VM.'
arch=('any')
url='http://www.squeak.org'
license=('Apache')
depends=('squeak-vm')
source=("http://ftp.squeak.org/sources_files/SqueakV$pkgver.sources.gz")
sha512sums=('f2ec7320ddb73b2da8d8bbde190f44d502aec6b26f9a219960118d23410a3ee0f8dd708d65e36098b48ee56a58f41a270ed5ebaafe688b896b719d61e1161b24')

package() {
    mkdir -p "$pkgdir/usr/lib/squeak"
    install -m644 "$srcdir/SqueakV$pkgver.sources" "$pkgdir/usr/lib/squeak/SqueakV$pkgver.sources"
}
