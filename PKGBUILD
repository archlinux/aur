# Maintainer: Sungjoon Moon <sumoon at seoulsaram dot com>
# Contributor: <aggraef at gmail.com>

pkgname=pd-l2ork-bin
pkgver=20240401
_pkgrev=8bddcbf5e
pkgrel=1
pkgdesc="L2Ork (Linux Laptop Orchestra) version of PureData (upstream Debian package)"
arch=('x86_64')
url="http://l2ork.music.vt.edu/main/?page_id=56"
license=('GPL')
depends=('bluez-libs' 'fftw' 'flite' 'fluidsynth' 'fribidi' 'ftgl' 'glu' 'lua53' 'lame' 'libogg' 'libpng')
provides=('pd-l2ork')
conflicts=('pd-l2ork')
source=(http://l2ork.music.vt.edu/data/pd-l2ork/Pd-L2Ork-full-$pkgver-rev.$_pkgrev-x86_64.deb)
sha256sums=('b7ee5ab418ea499bfe44f39102d9a6d7fafa8f13ba3719608e1c78891580f11c')

package() {
    cd "$srcdir"
    bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"
}
