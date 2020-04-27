# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=psi-notify
pkgver=0.2
pkgrel=1
pkgdesc='Minimalistic PSI notifier using libnotify'
url="https://github.com/cdown/psi-notify"
license=('MIT')
depends=('libnotify')
arch=('any')
source=("https://github.com/cdown/psi-notify/archive/$pkgver.tar.gz")
md5sums=('7a914a9edb31ff8d9ea76b0dd6d4a2a9')

build() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    make
}

package() {
    mkdir -p "$pkgdir"/usr/bin
    cp -a "${srcdir?}/$pkgname-$pkgver"/psi-notify "$pkgdir"/usr/bin
}
