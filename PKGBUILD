# Maintainer: PRESFIL <echo cHJlc2ZpbEBwcm90b25tYWlsLmNvbQo= | base64 -d>

pkgname=cherrytree-bin
_basename=${pkgname%*-bin}
pkgver=0.99.37
pkgrel=1
pkgdesc='Binary version of cherrytree'
arch=('x86_64')
url='https://www.giuspen.com/cherrytree/'
license=('GPL3')
depends=('gtksourceviewmm' 'libxml++2.6' 'gspell' 'uchardet' 'fmt')
optdepends=('p7zip: for password protection support')
provides=("${_basename}")
conflicts=("${_basename}")
source=("https://launchpad.net/~giuspen/+archive/ubuntu/ppa/+files/${_basename}_${pkgver}-3_amd64.deb")
sha256sums=('8a31243e7e63da1f7b70e25225dd80eb610f3686820b95a6938dad8684c0f9a1')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
}

