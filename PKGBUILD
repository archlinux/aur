# Maintainer: gCurse <gcurse at web de>

pkgname=otr-verwaltung3p-vdub
pkgver=1.0.0
pkgrel=1
pkgdesc="Preconfigured wine prefix with ffdshow for otr-verwaltung3p"
arch=("any")
url="https://github.com/gCurse/otr-verwaltung3p-vdub"
license=("GPL3")
depends=("otr-verwaltung3p" "wine")

source=("https://github.com/gCurse/otr-verwaltung3p-vdub/archive/v1.0.0.tar.gz")
md5sums=('8c9f8e4a9cae26bf5641b43d293cbff7')
options=("!strip")
#PKGEXT=".pkg.tar"

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p ${pkgdir}/usr/share/otrverwaltung3p/tools
    cp -r intern-VirtualDub ${pkgdir}/usr/share/otrverwaltung3p/tools/
}
