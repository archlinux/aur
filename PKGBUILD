# Maintainer: zlfn <elusive1102@naver.com>

pkgname=krita-next-bin
_pkgver=5.2.0
pkgver=${_pkgver/-/}
pkgrel=1
pkgdesc='The pre-built package of Krita Next. If you do not true me, install krita-next instead.'
arch=(x86_64)
url='https://krita.org'
license=(GPL3)
provides=(krita)
conflicts=(krita)
depends=(kitemviews kitemmodels ki18n kcompletion kguiaddons kcrash qt5-svg qt5-multimedia quazip
         gsl libraw exiv2 openexr fftw openjpeg2 opencolorio libwebp hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools boost eigen vc poppler-qt5 python-pyqt5 libheif
             qt5-tools sip kseexpr libmypaint)
optdepends=('poppler-qt5: PDF filter' 'ffmpeg: to save animations'
            'python-pyqt5: for the Python plugins' 'libheif: HEIF filter'
            'kseexpr: SeExpr generator layer' 'kimageformats: PSD support' 'libmypaint: support for MyPaint brushes'
            'krita-plugin-gmic: GMic plugin')
source=(https://github.com/zlfn/krita-aur/releases/download/v5.2.0-prealpha/krita-next-bin-5.2.0-1-x86_64.pkg.tar.zst)
sha256sums=('SKIP')
