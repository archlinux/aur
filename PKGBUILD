# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>

pkgname=python-av1an
pkgver=1.12
pkgrel=2
pkgdesc='A cross-platform all-in-one tool for streamlining AV1 encoding'
arch=('any')
url='https://github.com/master-of-zen/Av1an'
license=('GPL3')
makedepends=('python-setuptools')
depends=('python>=3.6.0' 'python-numpy' 'python-scenedetect' 'opencv' 'hdf5'
         'python-tqdm' 'python-psutil' 'python-scipy' 'python-matplotlib'
         'ffmpeg' 'aom')
optdepends=('svt-av1: SVT-AV1 encoder support'
            'rav1e: rav1e encoder support'
            'libvpx: vpx encoder support'
            'vmaf: VMAF calculation support'
            'x265: x265 encoder support')
source=("av1an-${pkgver}.tar.gz"::"https://github.com/master-of-zen/Av1an/archive/${pkgver}.tar.gz")
sha256sums=('0d6ee58775d48aaf26c5131b1c03d4b8107523c6a551859fc6ed487ef859f8f5')


package() {
    cd $srcdir/Av1an-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1
}
