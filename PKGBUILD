# Maintainer:  chocotan < loli at linux.com>

pkgname='snappify-bin'
_pkgname='snappify-bin'
pkgver='0.0.5';
_major="${pkgver%%.*}"
pkgrel='1'
pkgdesc="snappify Slides enable developers to create impressive presentations and smoothly animated videos."
arch=('x86_64')
url='https://snappify.com/'
license=('custom')
provides=()
_filename=snappify_${pkgver}_amd64.deb
source=(
  "https://release.snappi.fyi/deb/x64/${_filename}"
)

md5sums=('d123b423e81c0e5bf752a1e8b27dba9d')
sha256sums=('771b76f4c40fd0402b8dba389493f95f2c7e17e596ebc7289a57ac27b2b2a419')


package() {
    bsdtar -xf "$srcdir/data.tar.zst" -C ${pkgdir}/
}
