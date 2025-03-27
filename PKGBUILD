# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}-bin
pkgver=0.9.25
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
license=('GPL3')
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
source=("https://github.com/jclehner/nmrpflash/releases/download/v$pkgver/nmrpflash-$pkgver-linux-x86_64.zip"
        "LICENSE::https://raw.githubusercontent.com/jclehner/nmrpflash/v$pkgver/LICENSE")
sha256sums=('b46cdb481786821c4e1adef597d3e58c9dbce73badb7d63261d36426bc179475'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
b2sums=('40515639300aef8018b0a99a8f601f0474bfc2207f2cedf62dba5f6296a275d083e70e7f94da29a5302f2c7676e4d507c8710c82a56edbfcb9d5356ad66ae8cc'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c')

package() {
  install -Dm0755 nmrpflash "$pkgdir/usr/bin/nmrpflash"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
