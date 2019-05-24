# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=ghidra-bin
pkgver=9.0.4
_date=20190516
pkgrel=1
pkgdesc='Software reverse engineering framework (bin)'
arch=(x86_64)
url=https://ghidra-sre.org
license=(Apache)
provides=(ghidra)
conflicts=(ghidra ghidra-git)
depends=('java-environment>=11' bash)
source=(https://ghidra-sre.org/ghidra_${pkgver}_PUBLIC_$_date.zip)
sha256sums=('a50d0cd475d9377332811eeae66e94bdc9e7d88e58477c527e9c6b78caec18bf')
sha512sums=('be8c6ed3bfc8661489e9da191e643a7fbbe15b3adb82cd312f5c1abb08b761e8d8bef7cf7125fef0faa55e8660cd3ce405a580adce9adee5b52ea98eec625103')

package() {
  install -d "$pkgdir"/{opt,usr/bin}
  cp -a ghidra_$pkgver "$pkgdir"/opt/ghidra
  ln -s /opt/ghidra/ghidraRun "$pkgdir"/usr/bin/ghidra
}
