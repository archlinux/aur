pkgname=lios-git
pkgver=7eeed0be
pkgrel=6
pkgdesc="Linux Intelligent OCR Solution is an easy to use OCR suite for tesseract and cuneiform"
arch=(any)
license=('GPL3')
url="https://gitlab.com/groups/Nalin-x-Linux"
source=('git+https://gitlab.com/Nalin-x-Linux/lios-3.git')
depends=('tesseract' 'imagemagick' 'cuneiform' 'python-sane' 'espeak-ng' 'poppler' 'python-pyenchant' 'aspell-en' 'speech-dispatcher' 'python-gobject' 'python-cairo' 'vte3' 'gst-plugins-base-libs')
makedepends=('git' 'gcc')
provides=('lios')
conflicts=('lios')

#pkgver() {
#}

#build() {
#}

package() {
  cd "${srcdir}/lios-3"
  python3 setup.py install --root="${pkgdir}"
}
md5sums=('SKIP')
