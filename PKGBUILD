# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}-bin
pkgver=0.9.28
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
license=('GPL3')
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
source=("https://github.com/jclehner/nmrpflash/releases/download/v$pkgver/nmrpflash-$pkgver-linux-x86_64.zip"
        "LICENSE::https://raw.githubusercontent.com/jclehner/nmrpflash/v$pkgver/LICENSE")
sha256sums=('fbb954bee2d067ff523fe68b3633b4fa6253b50a2b3ea245d3f013c7e69b28bf'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
b2sums=('06837c6f217b757857cf40d9c68cc050e9e1f139436473451c0d43b12bed27c783538eed676d6efc69ba3a2eaa8e84be48b5be07ae18681814ddf86fe59c0520'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c')

package() {
  install -Dm0755 nmrpflash "$pkgdir/usr/bin/nmrpflash"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
