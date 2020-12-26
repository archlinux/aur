# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>

pkgname=cherrytree-bin
_basename=${pkgname%*-bin}
pkgver=0.99.27
pkgrel=1
pkgdesc='Binary version of cherrytree'
arch=('x86_64')
url='https://www.giuspen.com/cherrytree/'
license=('GPL3')
depends=('gtksourceviewmm' 'libxml++2.6' 'gspell')
optdepends=('p7zip: for password protection support')
provides=("${_basename}")
conflicts=("${_basename}")
source=("https://launchpad.net/~giuspen/+archive/ubuntu/ppa/+files/${_basename}_${pkgver}-2_amd64.deb")
sha256sums=('ef9cbd4c809ef2ae756ed9eb26bf660b5f2b7dbe6a4ffbacbc6c0352051bbbd6')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
}

