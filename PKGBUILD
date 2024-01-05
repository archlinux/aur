pkgname=els_dap
pkgver=0.1.3
pkgrel=1
pkgdesc='The Erlang LS DAP Debugger'
arch=(any)
url=https://github.com/erlang-ls/els_dap
license=(Apache)
depends=(erlang-nox)
makedepends=(rebar3)
source=(git+https://github.com/erlang-ls/els_dap.git#tag=$pkgver)
b2sums=('SKIP')

build() {
  cd $pkgname

  make
}

package() {
  cd $pkgname

  PREFIX="$pkgdir/usr" make install
}
