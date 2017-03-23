# Maintainer: Chris Charles chris (at) ccharles (dot) ca

pkgname=lispm-font
pkgver=0.1
pkgrel=3
pkgdesc='M.I.T. "CADR LispMachine" main console font'
url="http://web.archive.org/web/20160304051032/http://www.eurogaran.com/downloads/lispmfont/"
arch=('any')
license=('MIT')
source=('http://kmkeen.com/tmp/lispmfont/FixedMediumLispm-13.pcf.gz'
        'http://kmkeen.com/tmp/lispmfont/lispm-8x14.psf'
        'http://kmkeen.com/tmp/lispmfont/LICENSE')
md5sums=('001d989e6e9d8fa703371a1e470d6d4f'
         '0003d6abb28f2e54cde4bc34e6d563ed'
         'a2c819ba084de33ac2579865b367da87')
optdepends=('fontconfig: For the X Windows version'
            'xorg-font-utils: For the X Windows version')

package() {
  cd "$srcdir"

  install -Dm644 'FixedMediumLispm-13.pcf.gz' "$pkgdir/usr/share/fonts/misc/FixedMediumLispm-13.pcf.gz"
  install -Dm644 'lispm-8x14.psf' "$pkgdir/usr/share/kbd/consolefonts/lispm-8x14.psf"
  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
