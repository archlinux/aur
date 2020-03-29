# Maintainer: Jonas Dellinger <jonas@dellinger.dev>
pkgname="hetzner-kube-bin"
pkgver=0.5.1
pkgrel=1
pkgdesc='A CLI tool for provisioning kubernetes clusters on Hetzner Cloud'
arch=('x86_64')
url='https://github.com/xetys/hetzner-kube  '
license=('Apache2.0')
provides=("hetzner-kube")
source=("${pkgname}-${pkgver}::https://github.com/xetys/hetzner-kube/releases/download/$pkgver/hetzner-kube-$pkgver-linux-amd64")
sha256sums=('94542b167e4f1fbba3228ac7d7d9f88e0b6a277fe1a01f16968898d07e947850')

package() {
  install -Dm 0755 ${pkgname}-${pkgver} "$pkgdir/usr/bin/hetzner-kube"
}
