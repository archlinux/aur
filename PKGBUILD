# Maintainer: absrdspc <repom2[at]airmail[dot]cc>

pkgname=vk-dumper
pkgver=1.0
pkgrel=1
pkgdesc="Utility for saving your messages and media from vk.com to JSON format"
arch=('any')
url="https://github.com/AbsurdlySuspicious/vk-dumper"
license=('Apache')
depends=('java-runtime>=8' 'bash')

source=("vkdumper-bin"
        "https://github.com/AbsurdlySuspicious/vk-dumper/releases/download/$pkgver/vkdumper-$pkgver.jar")

sha256sums=('2f0e179c9368f92da7b182b122e83564f11dc5e980843a65d6690f830267f081'
            '116f42c03f3340c710b1378d200da47af70f3a3272f4bf102beb0d81bb93d542')

package() {
  install -Dm755 -T "$srcdir/vkdumper-bin" "$pkgdir/usr/bin/vkdumper"
  install -Dm644 -T "$srcdir/vkdumper-$pkgver.jar" "$pkgdir/usr/share/java/vkdumper/vkdumper.jar"
}

