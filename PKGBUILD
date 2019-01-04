# Maintainer: William Belanger <echo d2lsbGlhbS5iZWxyQGdtYWlsLmNvbQ== | base64 -d>

pkgname=qoob
pkgver=0.1.0
pkgrel=1
pkgdesc="foobar-like music player for Linux"
url="https://gitlab.com/william.belanger/qoob"
arch=("any")
license=("GPL3")
depends=(python python-setuptools python-pyqt5 qt5-svg qt5-multimedia python-mutagen gst-plugins-base gst-plugins-good)
optdepends=('gst-libav: additional codecs (i.e. AAC)'
            'gst-plugins-bad: additional codecs (i.e. AAC)'
            'gst-plugins-ugly: additional codecs')
source=("https://gitlab.com/william.belanger/qoob/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('4a59a993e3136f487733034198d98c621c35ff12df8d86ec25ed9eb9141eb702')

package()
{
  cd "${pkgname}-v${pkgver}"
  python setup.py install --optimize="1" --root="$pkgdir"
}
