# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=psf-unifont
pkgver=17.0.02
pkgrel=1
pkgdesc="GNU Unifont Glyphs (PSF version)"
arch=('any')
url="https://unifoundry.com/unifont/"
license=('OFL-1.1 OR GPL-2.0-or-later WITH Font-exception-2.0')
source=("https://ftp.gnu.org/gnu/unifont/unifont-$pkgver/Unifont-APL8x16-$pkgver.psf.gz"{,.sig}
        "unifont-LICENSE.txt::https://unifoundry.com/LICENSE.txt")
noextract=("Unifont-APL8x16-$pkgver.psf.gz")
sha256sums=('f6845bb729ac22845398925b93932469b32a25cf9450c071683808b7b8db6fd6'
            'SKIP'
            '1e74cb82bf476843e97c2596297b04219b1a7e51f7238944a8c031cb9401fa87')
validpgpkeys=('95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>

package() {
  cd "$srcdir"
  install -Dm644 "Unifont-APL8x16-$pkgver.psf.gz" "$pkgdir/usr/share/kbd/consolefonts/Unifont-APL8x16.psf.gz"
  install -Dm644 unifont-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
