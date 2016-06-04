# Maintainer: Fahad Hossain <8bit.demoncoder g-mail>

pkgname=dukto-bin
pkgver=6.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Dukto is an easy file transfer tool designed for LAN use. This aur uses the Ubuntu binaries for dukto."
url='http://msec.it/blog/?page_id=11'
license=('GPL')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt4')
optdepends=()
provides=('dukto')
conflicts=('dukto' 'dukto-qt5-git')
options=('!emptydirs' '!strip')
install=$pkgname.install
source_i686=("http://download.opensuse.org/repositories/home:/colomboem/xUbuntu_16.04/amd64/dukto_${pkgver}-${pkgrel}_i386.deb")
source_x86_64=("http://download.opensuse.org/repositories/home:/colomboem/xUbuntu_16.04/amd64/dukto_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_i686=('b8aa8d5de72844040f77e76fde6a892feba13f84a92d721bb7a7213682316033')
sha256sums_x86_64=('8a442a2f04089c447a0727c5e06a08896f9d64512be24fd40f98f9f2ce87218b')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
