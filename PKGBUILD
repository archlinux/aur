# Maintainer: Jack Kinsey <journcy@gmail.com>

pkgname='tele-bin'
pkgver='0.0.4'
pkgrel='1'
pkgdesc='An alternative syntax for Erlang.'
arch=('x86_64')
url="https://github.com/fancycade/tele"
license=('Apache-2.0')
provides=('tele')
conflicts=('tele')
source=('https://telelang.org/artifacts/tele-x86_64-linux-gnu')
sha256sums=('5e0300d93deb1ef4598e8f7c1520390d9dd26fd7b35c031a7b13451c6953e26b')
depends=()
optdepends=('erlang-core: core erlang distribution'
            'rebar3: erlang dependency support')

package() {
  install -Dm 755 "$srcdir/tele-x86_64-linux-gnu" "$pkgdir/usr/bin/tele"
}
