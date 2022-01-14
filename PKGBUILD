# Maintainer: Jad Chehimi <jadchehimi0@gmail.com>
pkgname=generatorfabricmod
pkgver=0.1.4
pkgrel=3
pkgdesc="Prompts the user for various information and outputs a skeleton mod for the Fabric toolchain"
arch=('any')
url="https://github.com/ExtraCrafTX/GeneratorFabricMod"
license=('APACHE')
depends=('bash' 'java-runtime>=8')
source=("$pkgname-$pkgver.tar::$url/releases/download/$pkgver/$pkgname.tar")
sha256sums=('3052124a8cdee451572b8dbe2b5efd0f9d8d4d3b192160060075d6b6bf302465')

package() {
    install -dm 755 "$pkgdir/opt/$pkgname"
    cd GeneratorFabricMod
    cp -r * "$pkgdir/opt/$pkgname"
    install -dm 755 "$pkgdir/usr/bin/"
    ln -sf "/opt/$pkgname/bin/GeneratorFabricMod" "$pkgdir/usr/bin/"
}
