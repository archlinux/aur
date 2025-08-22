# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgname=codeblocks-i18n-zh_cn
pkgver=25.03.20250822
pkgrel=1
pkgdesc="Code::Blocks and many plug-ins translation"
arch=('any')
url="https://translations.launchpad.net/codeblocks-gd/trunk/+pots/all-codeblocks/zh_CN/+translate"
license=('GPL-3.0-only')
source=("https://gitee.com/rongbow/codeblocks-i18n-zh_-cn/repository/archive/master.zip")
sha256sums=('d46c7f414f2879e1dd40e897733e64a715e8b220f694112eb88e3ef199a734b8')

package() {
	cd codeblocks-i18n-zh_-cn-master
	install -Dm755 codeblocks.mo ${pkgdir}/usr/share/codeblocks/locale/zh_CN/codeblocks.mo
}
