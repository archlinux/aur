# Maintainer: Drommer <drommer@github.com>

pkgbase=ttf-pt-public-pack
pkgname=('ttf-pt-astra-sans' 'ttf-pt-astra-serif' 'ttf-pt-sans' 'ttf-pt-serif' 'ttf-pt-mono' 'ttf-pt-root_ui')
pkgver=22.09
pkgrel=1
arch=('any')
url='https://www.paratype.ru'
license=('custom:OFL')
source=("PT-Public-Pack.ottt.zip"::"https://api.paratype.com/api/editions/ofl/download/59384")
DLAGENTS=('https::/usr/bin/curl -gqb "" -fLC - --retry 3 --retry-delay 3 -o %o %u --referer https://www.paratype.com/ --user-agent Mozilla')
sha256sums=('SKIP')

pkgver() {
  date +%Y.%m.%d
}

package_ttf-pt-astra-sans() {
  pkgdesc='ParaType font based on PT Sans family, metric-compatible with Times New Roman'
  provides=('ttf-font' 'ttf-pt-astra-sans')
  conflicts=('ttf-pt-astra-sans' 'ttf-astra-sans')
  install -Dm644 $srcdir/PT/PT/PT-Astra-Sans/*.ttf -t $pkgdir/usr/share/fonts/paratype/pt-astra-sans
  install -Dm644 $srcdir/OFL.txt -t $pkgdir/usr/share/licenses/${pkgname}
}

package_ttf-pt-astra-serif() {
  pkgdesc='ParaType font based on PT Serif family, metric-compatible with Times New Roman'
  provides=('ttf-font' 'ttf-pt-astra-serif')
  conflicts=('ttf-pt-astra-serif' 'ttf-astra-serif')
  install -Dm644 $srcdir/PT/PT/PT-Astra-Serif/*.ttf -t $pkgdir/usr/share/fonts/paratype/pt-astra-serif
  install -Dm644 $srcdir/OFL.txt -t $pkgdir/usr/share/licenses/${pkgname}
}

package_ttf-pt-sans() {
  pkgdesc='PT Sans is a ParaType family font for universal use'
  provides=('ttf-font' 'ttf-pt-sans')
  conflicts=('ttf-pt-sans' 'ttf-paratype')
  install -Dm644 $srcdir/PT/PT/PT-Sans/*.ttf -t $pkgdir/usr/share/fonts/paratype/pt-sans
  install -Dm644 $srcdir/OFL.txt -t $pkgdir/usr/share/licenses/${pkgname}
}

package_ttf-pt-serif() {
  pkgdesc='PT Serif is a ParaType family font designed for universal use together with PT Sans'
  provides=('ttf-font' 'ttf-pt-serif')
  conflicts=('ttf-pt-serif' 'ttf-paratype')
  install -Dm644 $srcdir/PT/PT/PT-Serif/*.ttf -t $pkgdir/usr/share/fonts/paratype/pt-serif
  install -Dm644 $srcdir/OFL.txt -t $pkgdir/usr/share/licenses/${pkgname}
}

package_ttf-pt-mono() {
  pkgdesc='PT Mono is a monospaced font of the ParaType PT Project series'
  provides=('ttf-font' 'ttf-pt-mono')
  conflicts=('ttf-pt-mono' 'ttf-paratype')
  install -Dm644 $srcdir/PT/PT/PT-Mono/*.ttf -t $pkgdir/usr/share/fonts/paratype/pt-mono
  install -Dm644 $srcdir/OFL.txt -t $pkgdir/usr/share/licenses/${pkgname}
}

package_ttf-pt-root_ui() {
  pkgdesc='PT Root UI is a modern uniwidth sans serif whose individual character widths are constant across all weights (ParaType family)'
  provides=('ttf-font' 'ttf-pt-root-ui')
  conflicts=('ttf-pt-root-ui')
  install -Dm644 $srcdir/PT/PT/PT-Root-UI/*.ttf -t $pkgdir/usr/share/fonts/paratype/pt-root-ui
  install -Dm644 $srcdir/OFL.txt -t $pkgdir/usr/share/licenses/${pkgname}
}
