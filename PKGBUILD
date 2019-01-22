# Maintainer: absrdspc <repom2[at]airmail[dot]cc>

pkgname=vk-dumper
pkgver=1.0
pkgrel=2
pkgdesc="Utility for saving your messages and media from vk.com to JSON format"
arch=('any')
url="https://github.com/AbsurdlySuspicious/vk-dumper"
license=('Apache')
depends=('java-runtime>=8' 'bash')

source=("vkdumper-bin"
        "https://github.com/AbsurdlySuspicious/vk-dumper/releases/download/$pkgver/vkdumper-$pkgver.jar")

sha256sums=('2f0e179c9368f92da7b182b122e83564f11dc5e980843a65d6690f830267f081'
            '5f2815216182287f807fd6b61b19bec01fef69a660d96d9f1b69a0f66370dc32')

package() {
  install -Dm755 -T "$srcdir/vkdumper-bin" "$pkgdir/usr/bin/vkdumper"
  install -Dm644 -T "$srcdir/vkdumper-$pkgver.jar" "$pkgdir/usr/share/java/vkdumper/vkdumper.jar"
}

