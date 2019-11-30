# Maintainer: Arthur Williams <taaparthur at gmail dot com>

pkgname='clip-history'
pkgver='0.6'
_language='en-US'
pkgrel=0
pkgdesc='A clipboard manager that simply keeps a list of everything copied'
url='https://github.com/TAAPArthur/clip-history'
arch=('any')
license=('MIT')
depends=('python3' 'xsel' 'python-gobject')

source=('https://github.com/TAAPArthur/clip-history/archive/v0.6.tar.gz')
md5sums=('9466bcc600c111f9018f5bddde57838f')

package() {
    cd 'clip-history-$pkgver'
    make DESTDIR=$pkgdir install
}
