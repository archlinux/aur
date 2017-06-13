# Maintainer: Faruk Uzun <farukuzun@mail.com>
pkgname=equivs
pkgver=2.0.9
pkgrel=1
pkgdesc="Circumvent Debian package dependencies"
arch=('any')
url="http://packages.debian.org/sid/equivs"
license=('GPL')
depends=('debhelper' 'dpkg' 'fakeroot' 'make' 'perl')

source=("http://httpredir.debian.org/debian/pool/main/e/${pkgname}/${pkgname}_${pkgver}_all.deb")
md5sums=('4b3ac16cb43543742ed8d6be6ba62ac1')

package() {
  tar xvf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
}

# vim:set ts=2 sw=2 et:
