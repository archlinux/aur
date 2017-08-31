# Maintainer: bruceutut <zttt183525594@gmail.com>
pkgname=wechat-devtools
_pkg=wechat_devtools
pkgver=1.00.170830
pkgrel=1
epoch=1
pkgdesc="WeChat Devtools Linux version."
arch=('i686' 'x86_64')
_arch="$(uname -m)"
url="https://mp.weixin.qq.com/debug/wxadoc/dev/devtools/devtools.html"
license=('unknown')
depends=('nss')
optdepends=('wine')
provides=('wechat_web_devtools_git')
install=link.install
source=("https://github.com/BruceZhang1993/wechat_devtools/archive/${pkgver}_${_arch}.tar.gz")
md5sums=("SKIP")

package() {
	cd "${_pkg}-${pkgver}_${_arch}"
	find ./ -type f -exec install -Dm755 {} \
        "${pkgdir}/opt/tencent/${pkgname}/{}" \;
}
