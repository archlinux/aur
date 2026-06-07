# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=nmrpflash
pkgname=${_pkgname}-bin
pkgver=0.9.27
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
license=('GPL3')
arch=('x86_64')
url="https://github.com/jclehner/nmrpflash"
depends=('libpcap' 'libnl>=3')
source=("https://github.com/jclehner/nmrpflash/releases/download/v$pkgver/nmrpflash-$pkgver-linux-x86_64.zip"
        "LICENSE::https://raw.githubusercontent.com/jclehner/nmrpflash/v$pkgver/LICENSE")
sha256sums=('77f4d3559284367595b63f5f7be8dada25465983e1bbde5afe182abfeb6f4095'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
b2sums=('d44b1bbb3fb29fac9cdc0e32c7e6b99370e2b8eea1d45c65992f797589d7707d0edc35eb3cedcaab2055711d68b97ace822d1b2a58e65ddcefb446e620d70e84'
        'ab7e38fc42fb6686add7393ecc3c7ec622cc0d72d0304ded3e56c2f96dc8433c584520896a30c037affa44461ecccfaf3ffa4a97a7e050e8ed0ec4c592caa45c')

package() {
  install -Dm0755 nmrpflash "$pkgdir/usr/bin/nmrpflash"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
