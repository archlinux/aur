# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=gitego-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Your Git identity manager and automatic profile switcher.'
url='https://github.com/bgreenwell/gitego'
arch=('x86_64')
license=('MIT')
conflicts=('gitego')
provides=('gitego-bin')

source=("gitego-$pkgver-${arch}.tar.gz::${url}/releases/download/v${pkgver}/gitego-v${pkgver}-linux-${arch}.tar.gz")
sha256sums=('3c2c1685e5e80592220c37ba6ab7ce5e9dabd2f2c572f9a5996fae9404107e04')

package() {
    cd "${srcdir}"
    install -Dm755 "gitego" "${pkgdir}/usr/bin/gitego"
}
