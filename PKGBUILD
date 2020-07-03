# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor:  TDY <tdy@archlinux.info>
# Contributor: Darwin Bautista <djclue917@gmail.com>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>

pkgname=ttf-mgopen
pkgver=1.1
pkgrel=14
pkgdesc="TrueType fonts containing glyphs for the Latin and Greek alphabet"
arch=('any')
url="https://web.archive.org/web/20120409173416/http://www.zvr.gr/typo/mgopen/index"
license=('custom')
depends=('fontconfig')
source=(http://ftp.debian.org/debian/pool/main/f/fonts-mgopen/fonts-mgopen_$pkgver.orig.tar.bz2
        license.txt)
sha256sums=('c612a978a3c0c0dc469d1eb9364b35afad5dbc7cb3fa2523bc4fad6708474cb4'
            '2e2cbbc817d6b3e48b6aabd8d88fa800418cefe5b523d5429ce4f29480a4cad9')

package() {
  cd "$srcdir/fonts-mgopen-$pkgver/TTFs"
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 MgOpen*.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:
