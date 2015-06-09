# Maintainer: aaditya <aaditya_gnulinux@zoho.com>

pkgname=pdf2png
pkgver=0.5
pkgrel=1
pkgdesc="Convert PDF books to PNG, JPG, and other image formats."
url="https://github.com/aadityabagga/pdf2png"
arch=('any')
license=('GPL')
depends=('python-gobject' 'ghostscript')
makedepends=()
conflicts=('pdf2img-git')
source=("http://github.com/aadityabagga/pdf2png/archive/${pkgver}.tar.gz")
md5sums=('f7cb3d67d5acb978e6ce910dfd213937')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
