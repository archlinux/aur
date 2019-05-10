# Maintainer: desbma
pkgname=r128gain
pkgver=0.9.1
pkgrel=1
pkgdesc='Fast audio loudness (ReplayGain / R128) scanner & tagger'
arch=('any')
url="https://github.com/desbma/${pkgname}"
license=('LGPL')
depends=('python' 'python-setuptools' 'python-mutagen' 'python-crcmod' 'ffmpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/desbma/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('3bc611388f4f0f2281839898c76d2ac36f501c8c3150610ea7346ed1c50536bcdf90fe442a7057e0edb6abb1d6ee7e55957c5cb3f0955b7b5f0bfaef76aba893')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
}
