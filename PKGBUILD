# Maintainer: aaditya <aaditya_gnulinux@zoho.com>

pkgname=pdf2png
pkgver=0.5.2
pkgrel=1
pkgdesc="Convert PDFs to PNG, JPG, and other image formats"
url="https://github.com/abchk1234/pdf2png"
arch=('any')
license=('GPL')
depends=('python-gobject' 'ghostscript')
makedepends=()
conflicts=('pdf2img-git')
source=("https://github.com/abchk1234/pdf2png/archive/${pkgver}.tar.gz")
md5sums=('715f12b459d72b8db216c66a3b7287bf')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
