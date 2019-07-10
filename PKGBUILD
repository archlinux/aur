# Maintainer: Andy Couturier <smoolak@gmail.com>

pkgname=dmenu-lpass-nu
pkgver=1.0.1
pkgrel=1
pkgdesc="dmenu script for lastpass-cli with account name and account user"
arch=("any")
url="https://smoolak.com/git/Smoolak/dmenu-lpass-nu"
license=("GPL3")
depends=("bash>=4" "lastpass-cli" "dmenu")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('619ea06deb418f72fb09f88b64c9515208e83b2529d64d8801f32e0306ae71cf')

package() {
    mkdir -p "$pkgdir/usr/bin"
	install -D -m755 "${pkgname}/dmenu-lpass.sh" "${pkgdir}/usr/bin/${pkgname}"
}
