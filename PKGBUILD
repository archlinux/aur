# Maintainer: Thomas Weischuh <thomas t-8ch de>

pkgname=ubuntu-keyring
pkgver=2016.09.01
pkgrel=1
pkgdesc="GnuPG keys of the Ubuntu archive"
arch=('any')
url="http://packages.ubuntu.com/trusty/ubuntu-keyring"
license=('GPL')
depends=('gnupg')

source=("http://mirror.netcologne.de/ubuntu/pool/main/u/ubuntu-keyring/ubuntu-keyring_${pkgver}_all.deb")

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}

sha256sums=('8b8956f84e446859f5009a5836956173109dc63f4fc4eb018ea9cb120f77d2e0')
