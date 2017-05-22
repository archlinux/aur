# Maintainer: Bruce <zttt183525594@gmail.com>

_pkgname=wechat_web_devtools
pkgname=wechat-web-devtools-git
pkgver=0.17.171900
pkgrel=1
pkgdesc="Wechat Web Developer Tools"
arch=("any")
url="https://github.com/BruceZhang1993/${_pkgname}"
license=('unknown')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
install="wechat-web-devtools-git.install"
source=("git://github.com/BruceZhang1993/${_pkgname}.git")
md5sums=('SKIP')

package() {
	cd "${srcdir}/${_pkgname}"
	find ./ -type f -exec install -Dm755 {} \
	    "${pkgdir}/opt/tencent/${_pkgname}/{}" \;
	install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
