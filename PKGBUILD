pkgname=lios-git
pkgver=7eeed0be
pkgrel=1
pkgdesc="Linux Intelligent OCR Solution is an easy to use ORC suite for tesseract and cuneiform"
arch=(any)
license=('LGPL')
url=('https://gitlab.com/groups/Nalin-x-Linux')
source=('git+https://gitlab.com/Nalin-x-Linux/lios-3.git')
depends=('tesseract' 'imagemagick' 'cuneiform' 'python-pyinsane' 'espeak' 'poppler' 'python-pyenchant' 'aspell-en' 'speech-dispatcher')
makedepends=('git' 'gcc')


#pkgver() {
#}

#build() {
#}

package() {
  cd "${srcdir}/lios-3"
  python3 setup.py install --root="${pkgdir}"
}
md5sums=('SKIP')
