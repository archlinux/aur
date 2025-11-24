# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=linuxmint-keyring
pkgver=2022.06.21
pkgrel=1
pkgdesc="GnuPG keys of the Linux Mint archive"
arch=('any')
url="http://packages.linuxmint.com/pool/main/l/linuxmint-keyring/"
license=('GPL')
depends=('gnupg')
source=("http://packages.linuxmint.com/pool/main/l/linuxmint-keyring/linuxmint-keyring_${pkgver}_all.deb")
sha256sums=('b71be690c543112ea7b65f43e9bbce9a3f17dd5cc784074858f0824154942a99')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
