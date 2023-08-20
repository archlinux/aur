# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>

pkgname=cherrytree-bin
_basename=${pkgname%*-bin}
pkgver=1.0.0
pkgrel=1
pkgdesc='Binary version of cherrytree'
arch=('x86_64')
url='https://www.giuspen.com/cherrytree/'
license=('GPL3')
depends=('gtksourceviewmm' 'libxml++2.6' 'gspell' 'uchardet' 'fmt')
optdepends=('p7zip: for password protection support')
provides=("${_basename}")
conflicts=("${_basename}")
source=("https://launchpad.net/~giuspen/+archive/ubuntu/ppa/+files/${_basename}_${pkgver}-5_amd64.deb")
sha256sums=('b39a7b37105446660ad328ff07c38d4b154597a3da1a7beccdb64d6d8af2cf14')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.zst -C "$pkgdir/"
}
