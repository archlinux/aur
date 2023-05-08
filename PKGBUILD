# Maintainer:Bipin Kumar <kbipinkumar@pm.me>

pkgname=any2fasta
pkgver=0.4.2
pkgrel=1
pkgdesc="convert various sequence formats to FASTA"
arch=('any')
url="https://github.com/tseemann/any2fasta"
license=('GPL3')
depends=('perl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tseemann/any2fasta/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('1ba622430294a8966572031d77fee362a9b265059596bc249c8e2936829453eace9ede722bdee2586f9235de338d530560256abb845965193de451f005c37be6')

prepare(){
  cd "$pkgname-$pkgver"
  chmod +x any2fasta
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 any2fasta "$pkgdir"/usr/bin/any2fasta
}
