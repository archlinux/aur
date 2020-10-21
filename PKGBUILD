# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>

pkgname=cherrytree-bin
_basename=${pkgname%*-bin}
pkgver=0.99.16
pkgrel=1
pkgdesc='Binary version of cherrytree'
arch=('amd64')
url='https://www.giuspen.com/cherrytree/'
license=('GPL3')
depends=('gtksourceviewmm' 'libxml++2.6' 'gspell')
optdepends=('p7zip: for password protection support')
source=("https://launchpad.net/~giuspen/+archive/ubuntu/ppa/+files/${_basename}_${pkgver}-1_amd64.deb")
sha256sums=('1e4c1d972c21897bd120757c076ea5211aa31eeb615c8e2c22f8c1bab6129f08')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
}

