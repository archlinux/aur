# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>

pkgname=python-av1an
pkgver=1.11
pkgrel=1
pkgdesc='A cross-platform all-in-one tool for streamlining AV1 encoding'
arch=('any')
url='https://github.com/master-of-zen/Av1an'
license=('GPL3')
makedepends=('python-setuptools')
depends=('python>=3.6.0' 'python-numpy' 'python-scenedetect' 'python-opencv-python'
         'python-tqdm' 'python-psutil' 'python-scipy' 'python-matplotlib'
         'ffmpeg' 'aom')
optdepends=('svt-av1: SVT-AV1 encoder support'
            'rav1e: rav1e encoder support'
            'libvpx: vpx encoder support'
            'vmaf: VMAF calculation support'
            'x265: x265 encoder support')
source=("av1an-${pkgver}.tar.gz"::"https://github.com/master-of-zen/Av1an/archive/${pkgver}.tar.gz")
sha256sums=('afa48d84468b99536e9bdc363a85b45678349ba906076bd0a5f06a1d34f4797f')


package() {
    cd $srcdir/Av1an-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}
