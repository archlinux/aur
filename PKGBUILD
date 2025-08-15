# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
pkgname=palemoon-extension-flash
pkgver=1.7
pkgrel=1
pkgdesc="Pale Moon Flash extension"
arch=('x86_64')
url="https://github.com/darktohka/clean-flash-builds"
depends=('palemoon')
license=('custom:Flash Player EULA' 'LGPL-2.1-or-later')
source=("https://github.com/darktohka/clean-flash-builds/releases/download/v${pkgver}/flash_player_patched_npapi_linux.x86_64.tar.gz")
sha256sums=('bddbebc5bf3b0aa4974eea23797daf9ca8627f740e64108e52460b06bf32fba5')

package(){
  install -Dm644 "$srcdir"/license.pdf "$pkgdir"/usr/share/licenses/$pkgname/license.pdf
  install -Dm644 "$srcdir"/libflashplayer.so "$pkgdir"/usr/lib/mozilla/plugins/libflashplayer.so
}
