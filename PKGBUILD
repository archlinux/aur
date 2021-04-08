# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-amstelvar
pkgver=20210407
pkgrel=1
_commit=7f01717081f0daada51b799c3fe6a1e4e9554750
pkgdesc="Parametric variable font by David Berlow"
arch=('any')
url="https://github.com/TypeNetwork/Amstelvar"
license=('custom:OFL')
source=("$url/raw/$_commit/fonts/Amstelvar-Italic[wdth,wght,opsz].ttf"
        "$url/raw/$_commit/fonts/Amstelvar-Roman[wdth,wght,opsz].ttf"
        "$url/raw/$_commit/OFL.txt")
sha256sums=('298c5a045490cfaa8131584af6624f42ba6d12799c5dd9edf50cf852f5e811d9'
            '47d9802d7cbf04aec32ae6f6ac9695d63976b16aedde94d859283485b1381456'
            '06c79c896894160a5810d869a822fa7d02a0e2ccffd97920b8cf3b880380f6e5')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
