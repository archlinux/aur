# Maintainer: Hendrik R. <hendrikr_10 [at] yahoo [dot] de>

pkgname=ttf-arvo
pkgver=2.0.1
pkgrel=1
pkgdesc="A geometric slab-serif typeface family suited for screen and print."
url="http://files.korkork.com/index.php?/fonts/arvo/"
arch=(any)
license=(custom)
_commit="ae906e99ab549103549c68252edfcb1816a6bf08"
source=("arvo.zip::https://github.com/antonxheight/Arvo/archive/${_commit}.zip"
        "LICENSE")

sha256sums=('186bca4e3bf1ebd3e1be712da384b477b9ee799d974272c443d6732d54b6223e'
            '359671bf16c00cae69cb66d041296b2adc7a4becd73a463cb8c5e101d97c7986')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "${srcdir}/Arvo-${_commit}/"
  install -Dt "$pkgdir/usr/share/fonts/arvo" -m644 *.ttf
}

# vim:set ts=2 sw=2 et:
