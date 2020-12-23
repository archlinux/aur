# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=flashfry
pkgver=1.12
pkgrel=1
pkgdesc="The rapid CRISPR characterization tool"
arch=('any')
url="https://github.com/mckennalab/FlashFry"
license=('GPL3')
depends=('bash' 'java-runtime')
source=("https://github.com/mckennalab/FlashFry/releases/download/$pkgver/FlashFry-assembly-$pkgver.jar"
        "flashfry")
sha256sums=('e7751b511db16c958fbe161adad10ff92f2d263d5858e33cc6faf955c4af1280'
            'bbd75fa11183b127d42c8d910f6b56f7bbcdcb4089982f5e70824a1aed28da28')


package() {
  install -Dm755 "flashfry" -t "$pkgdir/usr/bin"
  install -Dm644 "FlashFry-assembly-$pkgver.jar" "$pkgdir/usr/share/java/flashfry/FlashFry-assembly.jar"
}
