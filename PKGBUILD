# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}-bin
pkgver=0.9.22
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
license=('GPL3')
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
source=("https://github.com/jclehner/nmrpflash/releases/download/v$pkgver/nmrpflash-$pkgver-linux-x86_64.zip"
        "LICENSE::https://raw.githubusercontent.com/jclehner/nmrpflash/v$pkgver/LICENSE")
sha256sums=('bb3bfaf65839ab04a59d7f25216a97963e4a9c7858f2fb04dc70e48aff6e801e'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
b2sums=('1b2edc9e28e1629c4f3da259140b1d07f9b8ca700b3b6dedebe81c52681665e216d52f15cbd4a5adfab0bf86b590a429dfecd459e1e81c9a5e94b2c74e046981'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c')

package() {
  install -Dm0755 nmrpflash "$pkgdir/usr/bin/nmrpflash"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
