# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=linuxmint-keyring
pkgver=2016.05.26
pkgrel=1
pkgdesc="GnuPG keys of the Linux Mint archive"
arch=('any')
url="http://packages.linuxmint.com/pool/main/l/linuxmint-keyring/"
license=('GPL')
depends=('gnupg')
source=("http://packages.linuxmint.com/pool/main/l/linuxmint-keyring/linuxmint-keyring_${pkgver}_all.deb")
sha256sums=('b956df964925f3aeb9e8f4cc935e0514efa0352570773e1551b0cda878fcb53d')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}/"
}
