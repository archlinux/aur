pkgname=hamler-bin
_pkgname=hamler
pkgver=0.2.2
pkgrel=1
pkgdesc='Haskell-style functional programming language running on Erlang VM.'
arch=(x86_64)
url='https://www.hamler-lang.org/'
license=('BSD')
source=("https://github.com/hamler-lang/hamler/releases/download/${pkgver}/${_pkgname}-${pkgver}.tgz")
sha256sums=('9e90297c2cd6de4d10b51cc229b66192eb755d58fa378a91045f639d0725fae9')
provides=('hamler')
depends=('ncurses5-compat-libs')

package() {
  mkdir -p "$pkgdir/usr/"{lib,bin}
  cp -r "$srcdir/${_pkgname}" "$pkgdir/usr/lib/"
  ln -sr "$pkgdir/usr/lib/hamler/bin/hamler" "$pkgdir/usr/bin/hamler"
}

