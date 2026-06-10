# Maintainer: baboon

pkgname=cwtch-ui-bin
_pkgname=cwtch-ui
pkgver=1.16.1
pkgrel=1
pkgdesc="A Flutter based Cwtch UI"
provides=('cwtch' 'cwtch-ui')
conflicts=('cwtch' 'cwtch-git' 'libcwtch-go' 'cwtch-bin')
provides=('cwtch' 'cwtch-ui')
arch=('x86_64')
url='https://cwtch.im'
license=('MIT')
optdepends=(
    'tor: use system tor'
)

source_x86_64=("https://git.openprivacy.ca/cwtch.im/cwtch-ui/releases/download/v1.16.1/cwtch-${pkgver}_amd64.deb")
sha512sums_x86_64=('SKIP')
options=('!strip')

package() {
  cd $pkgdir
  tar xf $srcdir/data.tar.*
}
