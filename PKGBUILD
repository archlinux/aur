# Maintainer:F43nd1r <support@faendir.com>

pkgname=forge-quark-2.0-bin
pkgver=210.949
pkgrel=1
epoch=
pkgdesc="Minecraft mod quark by Vazkii"
arch=('any')
url="https://quark.vazkii.net/"
license=('custom:CC BY-NC-SA 3.0')
depends=('forge-server>=1.14.4_28.1.61' 'forge-autoreglib-1.4-bin')
makedepends=()
optdepends=()
source=("$pkgname-$pkgver.jar::https://maven.blamejared.com/vazkii/quark/Quark/r2.0-$pkgver/Quark-r2.0-$pkgver.jar" "LICENSE")
noextract=("$pkgname-$pkgver.jar")
sha1sums=('b7adb0c6de3b9c53b6c27fe8090ec7e3f8bfd9c8'
          '1b35b35bbf6797b707011443c71704dcd072d718')

package() {
    cd $srcdir
    install -D -m644 -g forge -o forge "$pkgname-$pkgver.jar" "${pkgdir}/srv/forge/mods/$pkgname-$pkgver.jar"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
