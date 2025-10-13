# Maintainer: Sungjoon Moon <sumoon at seoulsaram dot com>
# Contributor: <aggraef at gmail.com>

pkgname=pd-l2ork-bin
pkgver=20250730
_pkgrev=656389ec
_ubuntu_ver=24.04
pkgrel=2
pkgdesc="L2Ork (Linux Laptop Orchestra) version of PureData (upstream Debian package)"
arch=('x86_64')
url="https://l2ork.music.vt.edu/main/make-your-own-l2ork/software/"
license=('GPL')
depends=('bluez-libs' 'fftw' 'flite' 'fluidsynth' 'fribidi' 'ftgl' 'glu' 'lua53' 'lame' 'libogg' 'libpng')
provides=('pd-l2ork')
conflicts=('pd-l2ork')
source=(https://github.com/pd-l2ork/pd-l2ork/releases/download/${pkgver}-rev.${_pkgrev}/Pd-L2Ork-${_ubuntu_ver}-${pkgver}-rev.${_pkgrev}.deb)
sha256sums=('1806410e0ea902c06e17be7448392389a6915d7115dc7b542c1b52d84923a7c3')

package() {
    cd "$srcdir"
    bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"
}
