pkgname=passmango-bin
pkgver=1.1
pkgrel=1
pkgdesc="A custom Go-based CLI password manager with AES-GCM encryption"
arch=('x86_64' 'aarch64')
url="https://github.com/kebabcode1/PassmanGO"
license=('MIT')
provides=('passmango')
conflicts=('passmango')
# This points exactly to your GitHub Release link
source=("https://github.com/kebabcode1/PassmanGO/releases/download/v1.1/PassmanGO")
sha256sums=('SKIP')
package() {
    # Make sure 'PassmanGO' matches your filename exactly!
    install -Dm755 "${srcdir}/PassmanGO" "${pkgdir}/usr/bin/passmango"
}
depends=('xclip')
