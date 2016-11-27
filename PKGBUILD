# Maintainer: mitts <mittens2001@opmbx.org>

pkgname=gmusicproxy
pkgver=1.0.5
pkgrel=1
pkgdesc="Stream Google Play Music using any media-player"
arch=('any')
url="https://github.com/diraimondo/gmusicproxy"
license=('GPL')
depends=('python2-gmusicapi=9.0.0' 'python2-netifaces>=0.10.4' 'python2-xdg>=0.25' 'python2-eyed3>=0.7.8' 'python2-daemon>=2.0.5')
makedepends=('python2-setuptools')
source=("https://github.com/diraimondo/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('d101e1fbd1a0e0cceb6c5313e39cc531')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
