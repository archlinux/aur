# Maintainer: bcoiner <x6ji7ar9 at anonaddy dot me>

pkgname=ollama-dinit
pkgver=1
pkgrel=2
pkgdesc='Dinit user service scripts for Ollama'
arch=('any')
license=('Unlicense')
depends=('ollama' 'dinit')
optdepends=('init-turnstile: Artix Linux Dinit user service manager')
source=('ollama')
sha256sums=('6903992da2714074e03bfcc34c9680861b09358d2dfa629eda7ce3f6fff6ba8a')

package() {
    install -Dm644 ollama "$pkgdir/etc/dinit.d/user/ollama"
}
