# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>

pkgname=python-av1an
pkgver=1.9
pkgrel=1
pkgdesc='A cross-platform all-in-one tool for streamlining AV1 encoding'
arch=('any')
url='https://github.com/master-of-zen/Av1an'
license=('MIT')
makedepends=('python-setuptools')
depends=('python>=3.6.0' 'python-numpy' 'python-scenedetect' 'opencv'
         'python-tqdm' 'python-psutil' 'python-scipy' 'python-matplotlib'
         'ffmpeg')
optdepends=('aom: Aomenc encoder support'
            'svt-av1: SVT-AV1 encoder support'
            'rav1e: rav1e encoder support'
            'libvpx: vpx encoder support')
source=("av1an-${pkgver}.tar.gz"::"https://github.com/master-of-zen/Av1an/archive/${pkgver}.tar.gz")
sha256sums=('065cbc3a6ee3799f4a89b84c84c4a13820a9a14cfeee8bb89bfbd7e6d6a667fb')


package() {
    cd $srcdir/Av1an-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}
