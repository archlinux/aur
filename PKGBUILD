# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=any2fasta
pkgver=0.8.1
pkgrel=1
pkgdesc="convert various sequence formats to FASTA"
arch=('any')
url="https://github.com/tseemann/any2fasta"
license=('GPL3')
depends=('perl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tseemann/any2fasta/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('0fcb4c5322060ac5776e98c6ce3e6f61e0aed0f91818002548572e1c7b66f9d4d5a84ca5cb2ba889f14e29843235f1a0ecb473983b3692184181e121fc6c75b8')

prepare(){
  cd "$pkgname-$pkgver"
  chmod +x any2fasta
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 any2fasta "$pkgdir"/usr/bin/any2fasta
}
