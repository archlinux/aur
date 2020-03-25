# Maintainer: BrLi <brli@chakralinux.org>

pkgname=ttf-jf-openhuninn
pkgver=1.0
pkgrel=1
pkgdesc='An opensource Chinese font by justfont, based on Kosugi Maru and Varela Round'
arch=('any')
url='https://justfont.com/huninn/'
license=('OFL')
source=('https://github.com/justfont/open-huninn-font/raw/master/font/jf-openhuninn-1.0.ttf'
        'https://github.com/justfont/open-huninn-font/raw/master/license.txt')
sha256sums=('20b18c056608ec078d22f1677b52fd1b616def1512f17be5d37831f09f517d5d'
            'dd5ddc3cda1eabd38140f4ba423a25b19f293bf17ae4885d8795495a5c227f2e')

package() {
  install -Dm644 $srcdir/jf-openhuninn-1.0.ttf $pkgdir/usr/share/fonts/TTF/jf-openhuninn-1.0.ttf
  install -Dm644 $srcdir/license.txt $pkgdir/usr/share/licenses/ttf-jf-openhuninn/license.txt
}
