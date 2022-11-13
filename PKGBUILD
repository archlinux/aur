pkgname=erlang_ls
pkgver=0.44.1
pkgrel=1
pkgdesc='The Erlang Language Server'
arch=(x86_64)
url=https://erlang-ls.github.io/
license=(Apache)
depends=(erlang)
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
