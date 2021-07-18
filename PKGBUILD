# Maintainer: Konstantin Braza <konsn5@pm.me>
pkgname=shipit
pkgver=0.4.0
pkgrel=1
pkgdesc="Minimalistic ssh deployment"
arch=(any)
url="https://github.com/sapegin/shipit"
license=("MIT")
depends=("bash" "openssh")
provides=(shipit)
source=("git+$url.git")
md5sums=("SKIP")

package() {
    echo ${pkgdir}
    echo ${srcdir}
    mkdir -p "${pkgdir}/usr/local/bin"
    cp "shipit/bin/shipit" "${pkgdir}/usr/local/bin/"
    chmod +x "${pkgdir}/usr/local/bin/shipit"
}
