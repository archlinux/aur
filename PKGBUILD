# Maintainer: Not1Emerald <entityinf@gmail.com>
pkgname=lunaro
pkgver=2.2
pkgrel=1
pkgdesc="yad launcher, appimage/py/jar/sh support, igpu/dgpu forcing, favorites, aliases, logs everything, dumps your stuff in ~/pwogams, maybe has an easter egg, still being updated, recc removing your sudo password or -r (run as root) might not work"
arch=('any')
url="https://github.com/not1emerald/lunaro"
license=('MIT')
depends=('yad' 'switcheroo-control')
optdepends=('python: for running .py apps'
            'jre-openjdk: for running .jar apps')
install=lunaro.install
source=("lunaro.sh::https://raw.githubusercontent.com/not1emerald/lunaro/main/lunaro.sh"
        "LICENSE::https://raw.githubusercontent.com/not1emerald/lunaro/main/LICENSE"
        "lunaro.install")
sha256sums=('5f488246328704557c905c21bce8fc3c57d736dac2bca49582d26a7a63b2113f'
            '1cdc4498db31a881a21077e32db0c1e6ffb7f12aa41fdef8f860b933318042ff'
            'SKIP')

package() {
    install -Dm755 "$srcdir/lunaro.sh" "$pkgdir/usr/bin/lunaro"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
