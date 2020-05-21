# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>

pkgname=python-av1an
pkgver=1.10
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
sha256sums=('130b01feb25ed904889b81c40e4165be5af9fa32bd224af6a4a20dd6d856b462')


package() {
    cd $srcdir/Av1an-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}
