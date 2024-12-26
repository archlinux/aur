# Maintainer: Kimiblock Moe

pkgname=wechat-bwrap
pkgver=1
pkgrel=1
epoch=1
pkgdesc="Sandboxing for WeChat. 沙盒微信."
arch=('any')
url="https://github.com/Kraftland/portable"
license=('GPL3')
groups=()
options=(!debug !strip)

makedepends+=()

provides+=(wechat-uos-bwrap wechat-uos-qt wechat-universal-bwrap wechat-bwrap wechat-portable wechat-beta-bwrap)

depends=("wechat" "portable")

optdepends=()

makedepends+=()

checkdepends=()

source=(
	portable-config
)


md5sums=('SKIP')

function package() {
	install -Dm644 portable-config \
		"${pkgdir}/usr/lib/wechat/portable-config"
}

