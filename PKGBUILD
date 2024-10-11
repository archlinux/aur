pkgname=erlang_ls
pkgver=1.1.0
pkgrel=1
pkgdesc='The Erlang Language Server'
arch=(any)
url=https://erlang-ls.github.io/
license=(Apache)
depends=(erlang-nox)
makedepends=(rebar3)
source=(git+https://github.com/erlang-ls/erlang_ls.git#tag=$pkgver)
b2sums=('SKIP')

build() {
  cd $pkgname

  make
}

package() {
  cd $pkgname

  PREFIX="$pkgdir/usr" make install
}
