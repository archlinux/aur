# Maintainer: TImeTrap <zhaoyuanpan@gmail.com>
pkgname='copytranslator'
pkgver=9.1.0
pkgrel=1
pkgdesc="Foreign language reading and translation assistant based on copy and translate."
arch=('x86_64')
url="https://copytranslator.gitee.io/"
license=('GPL2')
source=("https://github.com/CopyTranslator/CopyTranslator/releases/download/v${pkgver}/copytranslator_${pkgver}_amd64.deb")
sha256sums=('426f706acc80610731116b2317540fd10e844f597ca0489c83934f8ac3c0527a')

package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
}
