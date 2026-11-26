# Maintainer: tee < teeaur at duck dot com >
pkgname=minipg-bin
pkgver=0.3
pkgrel=1
pkgdesc="PostgreSQL as a single executable"
arch=(x86_64)
url="https://progrium.github.io/minipg"
license=(MIT)
provides=(minipg)
conflicts=(minipg)
source_x86_64=("https://github.com/progrium/minipg/releases/download/v${pkgver}/minipg_${pkgver}_linux_amd64.zip")
b2sums_x86_64=('c2bfe92ca16e4b1f7d6c03dba0c90bdc9e95f47ac263a9532c9b79fe9bc5383878f888aa36be26c2bc564b60a85b3399976ade5c5a57465ec35a09818c478b44')

package() {
  install -Dm755 minipg -t "$pkgdir/usr/bin/"
}
