# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>
# Contributor: this.ven <misgi@ven.uber.space>

pkgname=clap
pkgver=1.0.3
pkgrel=1
pkgdesc='Clever Audio Plugin API'
arch=(any)
url='https://cleveraudio.org'
license=(MIT)
groups=(pro-audio)
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/free-audio/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('84fef9f2e975177b320ede47365fc8e04a459d34d967eef2afc5a57b6992b0c6')

package() {
  cd $pkgname-$pkgver
  install -vDm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  cp -va include "$pkgdir"/usr
}
