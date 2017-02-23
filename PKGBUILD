
# Maintainer Alexis Pereda <alexis@pereda.fr>

pkgname=ci
pkgver=0.1
pkgrel=1
pkgdesc="a simple test"
arch=('i686', 'x86_64')
url=""
license=('GPL')
depends=()
source_i686=("https://pkg.celforyon.fr//pool/main/c/ci/ci_0.1_arch_i386.deb")
md5sums_i686=('d41d8cd98f00b204e9800998ecf8427e')
source_x86_64=("https://pkg.celforyon.fr//pool/main/c/ci/ci_0.1_arch_amd64.deb")
md5sums_x86_64=('d41d8cd98f00b204e9800998ecf8427e')

package() {
  msg2 "Extracting the data.tar.xz"
  bsdtar -xf data.tar.xz -C "$pkgdir/"
}
