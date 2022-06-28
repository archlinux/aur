# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=himitsu-mutt
pkgver=0.1.0
pkgrel=1
pkgdesc="Helper for using himitsu with neomutt."
arch=('any')
url="https://sr.ht/~whynothugo/himitsu-mutt"
license=('ISC')
depends=('himitsu')
makedepends=('git')
source=("git+https://git.sr.ht/~whynothugo/himitsu-mutt#commit=d2841478440adaef643814fa5e7268f2b0829bea")
sha256sums=('SKIP')

package() {
  cd "$srcdir/himitsu-mutt"
  install -Dm755 himitsu-mutt "$pkgdir/usr/bin/himitsu-mutt"
  install -Dm755 README.md "$pkgdir/usr/share/doc/himitsu-mutt/README.md"
}
