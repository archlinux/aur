# Maintainer: Amanoel Dawod <amoka at amanoel dot com>

pkgname=ttf-amstelvar
pkgver=20210603
pkgrel=1
_commit=54e6bea24bb49536ad5de73adca23ee3e21e9fac
pkgdesc="Parametric variable font by David Berlow"
arch=('any')
url="https://github.com/TypeNetwork/Amstelvar"
license=('custom:OFL')
source=("$url/raw/$_commit/fonts/Amstelvar-Italic[wdth,wght,opsz].ttf"
        "$url/raw/$_commit/fonts/Amstelvar-Roman[wdth,wght,opsz].ttf"
        "$url/raw/$_commit/OFL.txt")
sha256sums=('298c5a045490cfaa8131584af6624f42ba6d12799c5dd9edf50cf852f5e811d9'
            'b9f00d24f1be8e614bc82e86254dea4106581337a11482657b1e21b675e5724b'
            '06c79c896894160a5810d869a822fa7d02a0e2ccffd97920b8cf3b880380f6e5')

package() {
  install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 *.ttf
  install -Dt "$pkgdir"/usr/share/licenses/$pkgname -m644 OFL.txt
}
