# Maintainer: Cédric FARINAZZO <cedric.farinazzo@gmail.com>

pkgname=i3lock-fancy-multimonitor
pkgver=0.2
pkgrel=2
pkgdesc="Blurry lock screen for i3lock with multimonitor support"
arch=(any)
url="https://github.com/cedricfarinazzo/i3lock-fancy-multimonitor"
license=('MIT')
depends=('bash' 'imagemagick' 'i3lock' 'scrot')
makedepends=('git')
provides=('i3lock-fancy-multimonitor')
source=("https://github.com/cedricfarinazzo/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('SKIP')


package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR="$pkgdir/" install
}

