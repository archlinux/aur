# Maintainer: Andy Couturier <smoolak@gmail.com>

pkgname=dmenu-lpass-nu
pkgver=1.0.2
pkgrel=1
pkgdesc="dmenu script for lastpass-cli with account name and account user"
arch=("any")
url="https://smoolak.com/git/Smoolak/dmenu-lpass-nu"
license=("GPL3")
depends=("bash>=4" "lastpass-cli" "dmenu")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b4312a8302314fbde2fc3d1f843d5bbed9c61ab1e7ac6e40df218e832ee7fc09')

package() {
    mkdir -p "$pkgdir/usr/bin"
	install -D -m755 "${pkgname}/dmenu-lpass.sh" "${pkgdir}/usr/bin/${pkgname}"
}
