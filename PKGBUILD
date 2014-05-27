# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# WARNING: Unfinished, aguilas has a lot of stuff in the makefile that needs
# fixing (e.g. hard coded Debian paths) before this should be released

pkgname=aguilas
pkgver=1.0.2
pkgrel=0
url=https://code.google.com/p/aguilas/
pkgdesc="An LDAP user manager and password self-service webaapp."
arch=('any')
license=('GPL3')
#depends=('php' 'php-mcrypt' 'php-gd' 'php-ldap' 'php-suhosin' 'smtp-forwarder' 'mailx')
makedepends=('python-sphinx' 'icoutils' 'python-docutils' 'imagemagick')
# libmagickcore-extra
source=("https://github.com/LuisAlejandro/$pkgname/archive/$pkgver.tar.gz" 'tempfile.patch' 'config.php')
md5sums=('b6f23c4bc771a0ca512e45fd7e265749'
         '7b285c7af3d739d26efe17c34c9957ee'
         '354f77b0725b89efedd7c8682ad7e5de')

build () {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 -i "${srcdir}"/tempfile.patch
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    find
}
