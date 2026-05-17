# Maintainer: Hashim-K <Hashim-K@users.noreply.github.com>

pkgname=usagestat-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Scriptable CLI for local agent usage data"
arch=("x86_64")
url="https://github.com/Hashim-K/usagestat"
license=("MIT")
depends=("glibc")
provides=("usagestat")
conflicts=("usagestat")
source_x86_64=("usagestat-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/usagestat-linux-x86_64.tar.gz")
sha256sums_x86_64=("53a6c30fc482330b60b889aa5e53dbbdaecef5931f792bf9381ee875f0ba6950")

package() {
  install -Dm755 "${srcdir}/usagestat" "${pkgdir}/usr/bin/usagestat"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
