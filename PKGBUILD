# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>
# Contributor: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=ffmulticonverter
pkgver=1.8.0
pkgrel=1
pkgdesc="Convert audio, video, image and document files between all popular formats"
arch=(any)
url="https://sites.google.com/site/ffmulticonverter/"
license=('GPL3')
depends=('python-pyqt5')
optdepends=('ffmpeg: for video conversions'
            'imagemagick: for image conversions'
            'unoconv: for document conversions')
conflicts=('ffmulticonverter-git')
source=(https://sourceforge.net/projects/ffmulticonv/files/$pkgname-$pkgver.tar.gz)
sha256sums=('5f2d8ed0acc70952c54fb1f3d13caa858988ebc7cc3b99b9fae7b6856d6a7f85')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
