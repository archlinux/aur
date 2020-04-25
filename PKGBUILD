# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>

pkgname=python-av1an
pkgver=1.8.0
pkgrel=2
pkgdesc='All-in-one tool for streamlining av1 encoding'
arch=('any')
url='https://github.com/master-of-zen/Av1an'
license=('MIT')
makedepends=('python-setuptools')
depends=('python>=3.7.0' 'python-numpy' 'python-scenedetect' 'opencv'
         'python-tqdm' 'python-psutil' 'python-scipy' 'python-matplotlib'
         'ffmpeg')
optdepends=('aom: Aomenc encoder support'
            'svt-av1: SVT-AV1 encoder support'
            'rav1e: rav1e encoder support')
source=("av1an-${pkgver}.tar.gz"::"https://github.com/master-of-zen/Av1an/archive/1.8.tar.gz")
sha256sums=('fbf485988fe30ccf5b8b1b9555912911da49033527e908155177b2f7b3b77e87')


package() {
    cd $srcdir/Av1an-1.8
    python setup.py install --root="${pkgdir}/" --optimize=1
}
