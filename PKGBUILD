# Maintainer: Sungjoon Moon <sumoon at seoulsaram dot com>
# Contributor: <aggraef at gmail.com>

pkgname=pd-l2ork-bin
pkgver=20241217
_pkgrev=9d763e8a
pkgrel=1
pkgdesc="L2Ork (Linux Laptop Orchestra) version of PureData (upstream Debian package)"
arch=('x86_64')
url="https://l2ork.music.vt.edu/main/make-your-own-l2ork/software/"
license=('GPL')
depends=('bluez-libs' 'fftw' 'flite' 'fluidsynth' 'fribidi' 'ftgl' 'glu' 'lua53' 'lame' 'libogg' 'libpng')
provides=('pd-l2ork')
conflicts=('pd-l2ork')
source=(https://github.com/pd-l2ork/pd-l2ork/releases/download/${pkgver}-rev.${_pkgrev}/Pd-L2Ork-${pkgver}-rev.${_pkgrev}.deb)
sha256sums=('0e743494fe0a2c2c0c2978051bced210afa9ff220d1917a55262a38cd11472e7')

package() {
    cd "$srcdir"
    bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"
}
