#Maintainer: iamawacko <iamawacko@protonmail.com>
#Contributor: Trevor Bergeron <mal@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-bin

pkgver=1.15.5
pkgrel=1

pkgdesc="UI for A decentralized, privacy-preserving, multi-party messaging protocol client (binary distribution)"
provides=('cwtch')
conflicts=('cwtch' 'cwtch-git' 'libcwtch-go')
arch=('x86_64')
url='https://cwtch.im'
license=('MIT')
optdepends=(
    'tor: use system tor instead of packaged'
)
source_x86_64=("https://git.openprivacy.ca/$_pkgname.im/$_pkgname-ui/releases/download/v$pkgver/cwtch-v$pkgver.tar.gz")
sha512sums_x86_64=('a61118adc2a5459f12e18fbd4b8fa67b7990781cb42b25e8a53c68886b36bdca8c3b844ff2c078bc593109c2c95523f01843c027785dfd8f45a629c27f71e2ed')

package() {
    cd "$srcdir/$_pkgname"
    INSTALL_PREFIX="$pkgdir/usr" DESKTOP_PREFIX="/usr" ./install.sh
}
