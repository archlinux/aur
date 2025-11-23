# Maintainer: Alan Lutter (alan.lutter@outlook.sk)
pkgrel=0
pkgname=ld64
pkgver=530_3
pkgdesc="Apple LD64 for Arch Linux."
arch=('x86_64')
url="http://assets.checkra.in/debian"
license=('unknown')
depends=('base-devel')
makedepends=('base-devel' 'wget')
source=('http://assets.checkra.in/debian/ld64_530-2_amd64.deb')
sha256sums=('a2c017ca05d33325d4a39ba906ee2a535327d136adea5fd029fdc9407a4b7d31')

package(){
  wget -q -O ld64_530-2_amd64.deb "$url/ld64_530-2_amd64.deb"
  ar x ld64_530-2_amd64.deb
  tar -xf data.tar.xz
  sudo cp -r usr/ /
}
