# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=flashfry
pkgver=1.13
pkgrel=1
pkgdesc="The rapid CRISPR characterization tool"
arch=('any')
url="https://github.com/mckennalab/FlashFry"
license=('GPL3')
depends=('java-runtime' 'sh')
source=("https://github.com/mckennalab/FlashFry/releases/download/$pkgver/FlashFry-assembly-$pkgver.jar"
        "flashfry")
sha256sums=('a315e3c053229c1839e785b2bc8b1e7217a46f5d87ee9309b802863e53764e5f'
            'bbd75fa11183b127d42c8d910f6b56f7bbcdcb4089982f5e70824a1aed28da28')


package() {
  install -Dm755 "flashfry" -t "$pkgdir/usr/bin"
  install -Dm644 "FlashFry-assembly-$pkgver.jar" "$pkgdir/usr/share/java/flashfry/FlashFry-assembly.jar"
}
