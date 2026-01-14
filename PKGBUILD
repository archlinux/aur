# Maintainer: Sean Adams seana@tuta.io
pkgname=fidovault
pkgver=0.1.0
pkgrel=0
arch=('any')

license=('GPL-3.0-or-later')

pkgdesc='A tool to control access to secrets via symmetric encryption and decryption using hardware FIDO2 keys.'
url='https://github.com/tmo1/fidovault'
depends=(python-cryptography python-fido2)

source=("$pkgname-$pkgver.tar.gz::https://github.com/tmo1/fidovault/archive/v${pkgver}.tar.gz")
sha256sums=(48e9bc9cd048d4179a94220cdc51e054b827762a297cf853d696a8ec67368aeb)

package() {
    cd "$pkgname-$pkgver" || return $?
    install -D fidovault.py "$pkgdir/usr/bin/fidovault"
}
