# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=hmetis
pkgver=1.5.3
pkgrel=2
pkgdesc="A set of programs for partitioning hypergraphs such as those corresponding to VLSI circuits"
arch=(x86_64)
url="https://karypis.github.io"
license=(custom)
depends=(lib32-glibc)
source=(${url}/glaros/files/sw/${pkgname}/${pkgname}-1.5-linux.tar.gz)
sha512sums=('8716367f826d983b85524706df75a6b2412215533a298afa36c35c2c14ca8daef5b2d705a5da935b9e07b048860f3538323109acae1f56a3b503ae7f52c6019f')

package() {
  install -Dm755 ${pkgname}-1.5-linux/shmetis -t "${pkgdir}/usr/bin"
  install -Dm755 ${pkgname}-1.5-linux/hmetis -t "${pkgdir}/usr/bin"
  install -Dm755 ${pkgname}-1.5-linux/khmetis -t "${pkgdir}/usr/bin"
  install -Dm644 ${pkgname}-1.5-linux/manual.ps -t "${pkgdir}/usr/share/doc/hmetis/"
  install -Dm644 ${pkgname}-1.5-linux/COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ${pkgname}-1.5-linux/libhmetis.a -t "${pkgdir}/usr/lib/hmetis"
  install -Dm644 ${pkgname}-1.5-linux/s13207P.hgr -t "${pkgdir}/usr/share/hmetis/examples/"
}
