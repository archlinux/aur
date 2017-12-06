# Maintainer: deadc0de6 <info@deadc0de.ch>

pkgname=scannerl
pkgver=0.36
pkgrel=1
pkgdesc="The modular distributed fingerprinting engine"
arch=('any')
url="https://github.com/kudelskisecurity/scannerl"
license=('GPL')
groups=()
depends=('erlang-nox>=20' 'rebar')
source=("git+https://github.com/kudelskisecurity/scannerl.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  ./build.sh
}

package() {
  install -D -m 755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
