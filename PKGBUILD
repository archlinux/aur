# Maintainer: Soroush Seirani G. <swodig@gmail.com>
# Contributor: Saeed Rasooli <saeed.gnu@gmail.com>
pkgname=starcal
pkgver=3.2.4
pkgrel=1
pkgdesc='A full-featured international calendar written in Python'
arch=('any')
url=http://ilius.github.io/starcal
license=('GPLv3')
depends=('python>=3.8' 'python-gobject>=3.24' 'gtksourceview4' 'python-cairo' 'python-httplib2' 'python-dateutil' 'python-psutil' 'python-cachetools' 'python-requests' 'python-setuptools' 'python-six')
optdepends=('libappindicator-gtk3' 'python-igraph' 'igraph' 'icu' 'lxqt-openssh-askpass' 'python-pygit2' 'ntp')
makedepends=('libarchive')
conflicts=('starcal-git')
source=("https://github.com/ilius/starcal/releases/download/3.2.4/starcal3-3.2.4-1-any.pkg.tar.zst")
md5sums=('bc1c7e3b99787db7e51928c1f067d7b1')
package() {
    bsdtar -xvf "${srcdir}/${pkgname}3-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst" --exclude='.*' -C "${pkgdir}"
}
