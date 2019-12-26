# Maintainer: yubimusubi
# Current Maintainer: Thomas Koller-Cherek <tk120 at protonmail dot com>

pkgname=('3dsconv-git')
provides=('3dsconv-git')
conflicts=('3dsconv')
pkgver=r117.383fc1c
pkgrel=1
pkgdesc='Tool to convert Nintendo 3DS CTR Cart Image files (CCI, ".3ds") to the CTR Importable Archive format (CIA).'
arch=('any')
url="https://github.com/ihaveamac/3dsconv"
license=('MIT')
depends=('python' 'python-pyaes')
makedepends=('git')
options=('!strip')
optdepends=('python-crypto: support for zerokey-encryption')
source=("git+https://github.com/ihaveamac/3dsconv.git")
sha256sums=('SKIP')

package() {
    install -d "$pkgdir/usr/bin/"
    install "3dsconv/3dsconv/3dsconv.py" "$pkgdir/usr/bin/3dsconv"
} 
