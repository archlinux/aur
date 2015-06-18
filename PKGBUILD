# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>
# Contributor: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=ffmulticonverter
pkgver=1.7.1
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
sha256sums=('7236b065f327e9b54d8a8d8ed6b04ef4891c996b7030e68c02f5e4a2e21f6019')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
