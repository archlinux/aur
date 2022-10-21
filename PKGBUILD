# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>
# Contributor: this.ven <misgi@ven.uber.space>

pkgname=clap
pkgver=1.1.2
pkgrel=1
pkgdesc='Clever Audio Plugin API'
arch=(any)
url='https://cleveraudio.org'
license=(MIT)
groups=(pro-audio)
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/free-audio/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8a2916e379df02818775872fdc80a89eb17acb0f94d7235efb714ad61c1fb024')

package() {
  cd $pkgname-$pkgver
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  cp -va include "$pkgdir"/usr
}
