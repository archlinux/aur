# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-amstelvar
pkgver=20210325
pkgrel=1
_commit=c05f64b2926802b1a1f25dbb5dee70b02f89ef8c
pkgdesc="Parametric variable font by David Berlow"
arch=('any')
url="https://github.com/TypeNetwork/Amstelvar"
license=('custom:OFL')
source=("$url/raw/$_commit/fonts/Amstelvar-Italic[wdth,wght,opsz].ttf"
        "$url/raw/$_commit/fonts/Amstelvar-Roman[wdth,wght,opsz].ttf"
        "$url/raw/$_commit/OFL.txt")
sha256sums=('b4f620099a38503e9ebe25160d350c14a42dfd31821babdac89f1d265c08b6cc'
            '46613a4cac0097afe4a6c453c7c335a59717a55cc85a63a62c8fc6f210671cf2'
            '06c79c896894160a5810d869a822fa7d02a0e2ccffd97920b8cf3b880380f6e5')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
