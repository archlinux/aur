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
sha256sums=('bddc893e19a3b37921fab7b9db7d5b1968432470d267d6931b60d30bf767793e')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
}

