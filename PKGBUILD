# Maintainer: Sungjoon Moon <sumoon at seoulsaram dot com>
# Contributor: <aggraef at gmail.com>

pkgname=pd-l2ork-bin
pkgver=20240930
_pkgrev=4d094c625
pkgrel=1
pkgdesc="L2Ork (Linux Laptop Orchestra) version of PureData (upstream Debian package)"
arch=('x86_64')
url="https://l2ork.music.vt.edu/main/make-your-own-l2ork/software/"
license=('GPL')
depends=('bluez-libs' 'fftw' 'flite' 'fluidsynth' 'fribidi' 'ftgl' 'glu' 'lua53' 'lame' 'libogg' 'libpng')
provides=('pd-l2ork')
conflicts=('pd-l2ork')
source=(http://l2ork.music.vt.edu/data/pd-l2ork/Pd-L2Ork-full-$pkgver-rev.$_pkgrev-x86_64.deb)
sha256sums=('4a9acbd886f5c131a58aca43f58d026c229c63c55c6052003c7ede6914c5e2de')

package() {
    cd "$srcdir"
    bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"
}
