# Maintainer: Minecraftchest1 <minecraftchest1 at outlook dot com>

pkgname=file-sharing-tool
pkgver=0.3.0
pkgrel=1
pkgdesc="A tool to help setup file sharing using ssh."
arch=('any')
url="https://gitlab.com/minecraftchest1/steamdeck-file-share-tool"
license=('GPL3')
depends=('openssh' 'zenity')
makedepends=('git')
source=("git+${url}#tag=${pkgver}")
sha256sums=('SKIP')

package() {
        cd "${srcdir}/steamdeck-file-share-tool"
        install -Dm 755 "bin/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm 444 "doc/*" "${pkgdir}/usr/share/doc/${pkgname}"
}
