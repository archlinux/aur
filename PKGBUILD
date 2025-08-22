# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgname=codeblocks-i18n-zh_cn
pkgver=20.03.20230209
pkgrel=1
pkgdesc="Code::Blocks and many plug-ins translation"
arch=('any')
url="https://translations.launchpad.net/codeblocks-gd/trunk/+pots/all-codeblocks/zh_CN/+translate"
license=('GPL-3.0-only')
source=("https://gitee.com/rongbow/codeblocks-i18n-zh_-cn/repository/archive/master.zip")
sha256sums=('c5fffc4f5b8eba2568810bbb6dcf087dba11bbaff9a776ca36a91941a595ca26')


package() {
	cd codeblocks-i18n-zh_-cn-master
	install -Dm755 codeblocks.mo ${pkgdir}/usr/share/codeblocks/locale/zh_CN/codeblocks.mo
}
