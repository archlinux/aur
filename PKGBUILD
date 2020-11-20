# Maintainer: Nathaniel Chin <thegamingorangutans+aur at gmail.com>

_name=Av1an
pkgname=python-av1an
pkgver=2
pkgrel=2
pkgdesc='A cross-platform all-in-one tool for streamlining AV1 encoding'
arch=('any')
url='https://github.com/master-of-zen/Av1an'
license=('GPL3')
makedepends=('python-setuptools')
depends=('python>=3.6.0' 'python-numpy' 'python-scenedetect' 'python-fuzzywuzzy' 'opencv'
         'python-tqdm' 'python-psutil' 'python-scipy' 'python-matplotlib'
         'ffmpeg' 'aom' 'hdf5')
optdepends=('svt-av1: SVT-AV1 encoder support'
            'rav1e: rav1e encoder support'
            'libvpx: vpx encoder support'
            'svt-vp9: SVT-VP9 encoder support'
            'vmaf: VMAF calculation support'
            'x265: x265 encoder support'
            'x264: x264 encoder support'
            'vapoursynth: Vapoursynth support'
            'mkvtoolnix-cli: mkvmerge support'
            'ffms2'
            'vapoursynth-plugin-lsmashsource'
            )
source=("av1an-${pkgver}.tar.gz"::"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5552282d8063e3739ae9765056c2a06fda0ecd6a34cbbe11e178698d8973c4c1')


package() {
    cd $srcdir/Av1an-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}
