# Maintainer: Tim Rice < t [dot] rice [at] ms [dot] unimelb [dot] edu [dot] au>
pkgname=satanic-icon-themes
pkgver=666.9
pkgrel=1
pkgdesc="Icons from Ubuntu Satanic Edition."
url="http://www.ubuntusatanic.org"
arch=('any')
license=('GPL')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("$url/hell/pool/main/s/${pkgname}/${pkgname}_${pkgver}_all.deb")
md5sums=('da67063378ed26a966c6f364e56a1f63')

build() {
  msg "Extracting ... "
  ar xv ${pkgname}_${pkgver}_all.deb || return 1
  tar xvf data.tar.gz || return 1
  msg2 "Done extracting."
}

package() {
  msg "Moving files ... "
  mv $srcdir/usr $pkgdir || return 1
  msg2 "Done moving files."
}

