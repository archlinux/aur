# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>

_pkgname="vivify"
pkgname="vivify-bin"
provides=(vivify)
conflicts=(vivify)
pkgver="0.1.6"
pkgrel=2
pkgdesc="Markdown preview tool which can be used standalone or plug into an editor like (Neo)Vim"
arch=("x86_64")
url="https://github.com/jannis-baum/vivify"
license=("GPL-3.0-or-later")
depends=("jq" "gcc-libs" "sh")
source=("${pkgname}-${pkgver}.zip::https://github.com/jannis-baum/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux.zip")
md5sums=("1838d6aa501c218698b0db1b5ee23bbd")

package() {
	cd ./bin/linux
        install -Dm755 ./viv           "${pkgdir}/usr/bin/viv"
        install -Dm755 ./vivify-server "${pkgdir}/usr/bin/vivify-server"
}
