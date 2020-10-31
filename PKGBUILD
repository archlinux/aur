# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>

pkgname=cherrytree-bin
_basename=${pkgname%*-bin}
pkgver=0.99.18
pkgrel=1
pkgdesc='Binary version of cherrytree'
arch=('x86_64')
url='https://www.giuspen.com/cherrytree/'
license=('GPL3')
depends=('gtksourceviewmm' 'libxml++2.6' 'gspell')
optdepends=('p7zip: for password protection support')
provides=("${_basename}")
conflicts=("${_basename}")
source=("https://launchpad.net/~giuspen/+archive/ubuntu/ppa/+files/${_basename}_${pkgver}-1_amd64.deb")
sha256sums=('2c17352f96b713544b37790b0128b8828c41a3bacf1ade5f2a41c3e3e723ce0e')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
}

