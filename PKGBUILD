# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>
# Contributor: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=ffmulticonverter
pkgver=1.7.2
pkgrel=1
pkgdesc="Convert audio, video, image and document files between all popular formats"
arch=(any)
url="https://sites.google.com/site/ffmulticonverter/"
license=('GPL3')
depends=('python-pyqt4')
optdepends=('ffmpeg: for video conversions'
            'imagemagick: for image conversions'
            'unoconv: for document conversions')
conflicts=('ffmulticonverter-git')
source=(https://sourceforge.net/projects/ffmulticonv/files/$pkgname-$pkgver.tar.gz)
sha256sums=('bb1a2e12c26515f177cfdebaa0f7845a04c406db840f870bfe416ca0ad197d78')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
