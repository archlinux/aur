pkgname=starcal
pkgver=3.1.1
pkgrel=1
pkgdesc='A full-featured international calendar writen in Python'
arch=('any')
url='http://ilius.github.io/starcal'
license=('GPLv3')
depends=('python>=3.2' 'python-gobject' 'python-httplib2' 'python-psutil' 'python-dateutil' 'python-cairo' 'python-requests')
optdepends=('python-igraph' 'libappindicator-gtk3: Better systray support' 'python-igraph' 'python-ujson' 'lxqt-openssh-askpass')
makedepends=('gettext')
conflicts=('starcal-git')
source=("https://github.com/ilius/starcal/archive/$pkgver.tar.gz")
md5sums=('e6b028370f36b514413ebc90cd13d941')
package() {
    "$srcdir/$pkgname-$pkgver"/install "$pkgdir" --for-pkg
}
