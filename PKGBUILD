# Maintainer: Jaron Kent-Dobias <jaron@kent-dobias.com>

pkgname=dmarc-report-display
pkgver=1.5
pkgrel=2
pkgdesc='Parse and display DMARC reports for human review.'
arch=(any)
url='https://gist.github.com/nemunaire/c6700e608c6cd462392d'
license=('GPL3')
depends=('perl' 'perl-file-libmagic' 'perl-xml-libxml')
optdepends=('perl-archive-zip: support for zip archives'
            'perl-email-mime: support for rfc822')
source=("https://gist.githubusercontent.com/nemunaire/c6700e608c6cd462392d/raw/e62ccec0cb874e8f7a9d476985c5898d76d95964/dmarc-report-display.pl")
md5sums=('5e19bf14f3a82782fc27011189581dde')

package() {
  install -D dmarc-report-display.pl "${pkgdir}/usr/bin/dmarc-report-display"
}
