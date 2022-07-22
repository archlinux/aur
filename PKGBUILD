# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>
# Contributor: this.ven <misgi@ven.uber.space>

pkgname=clap
pkgver=1.1.1
pkgrel=1
pkgdesc='Clever Audio Plugin API'
arch=(any)
url='https://cleveraudio.org'
license=(MIT)
groups=(pro-audio)
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/free-audio/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('eef67a38df6c20fd4cb79698772d35d30aefc2e1a8d5275a5169f58cd530333e')

package() {
  cd $pkgname-$pkgver
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  cp -va include "$pkgdir"/usr
}
