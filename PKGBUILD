# Contributor: Brett Cornwall <ainola@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=ttf-ionicons
# TODO: Newer versions of ionicons don't come with any .ttf; They only
# distribute SVGs.
pkgver=4.2.0
epoch=1
pkgrel=1
pkgdesc='Font from the Ionic mobile framework'
arch=('any')
license=('MIT')
url='https://ionicons.com/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/ionic-team/ionicons/archive/v${pkgver/_/-}.tar.gz")
sha256sums=('33d85e4f970edea75dbe11626075834a5142c5cd817f61c9b505270addb49414')

package() {
    cd "ionicons-${pkgver/_/-}"
    install -Dm644 docs/fonts/ionicons.ttf -t "$pkgdir/usr/share/fonts/TTF/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
