# Maintainer: Thomas Weischuh <thomas t-8ch de>

pkgname=ubuntu-keyring
pkgver=2016.09.19
pkgrel=1
pkgdesc="GnuPG keys of the Ubuntu archive"
arch=('any')
url="http://packages.ubuntu.com/trusty/ubuntu-keyring"
license=('GPL')
depends=('gnupg')

source=("http://mirrors.kernel.org/ubuntu/pool/main/u/ubuntu-keyring/ubuntu-keyring_${pkgver}_all.deb")

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}

sha256sums=('13b2632027b62c0506d1d35fb032e60a31eac5676072c6289660c494082a7eac')
