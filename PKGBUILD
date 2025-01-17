_pkgname='dumb-init'
pkgname="${_pkgname}-bin"
pkgver=1.2.5
pkgrel=1
pkgdesc='A minimal init system for Linux containers'
arch=('x86_64')
url='https://github.com/Yelp/dumb-init'
license=('mit')
depends=()
optdepends=()
makedepends=()
conflicts=("${_pkgname}")
provides=('dumb-init' 'dumb-init-bin')

source=("$_pkgname::https://github.com/Yelp/dumb-init/releases/download/v${pkgver}/dumb-init_${pkgver}_x86_64")
sha256sums=('e874b55f3279ca41415d290c512a7ba9d08f98041b28ae7c2acb19a545f1c4df')

package() {
  cd "${srcdir}"
  install -Dm755 "dumb-init" "${pkgdir}/usr/bin/dumb-init"
}