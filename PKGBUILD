# Maintainer: ZeroDegress <zerodegress@outlook.com>

pkgname=greetd-gtkgreet-i18n-zh-cn
pkgver=0.8
pkgrel=1
pkgdesc='Chinese(Simplified) language pack for greetd-gtkgreet.'
arch=('any')
license=('custom')
depends=('greetd-gtkgreet')
makedepends=('gettext')
source=('zh_CN.po')
sha256sums=('719c77cdf532c1c9db2bffb2babd1211db1f24b28bd75fc4a14a4401dcffe6d9')

options=(!strip)

package() {
    install -d "$pkgdir/usr/share/locale/zh_CN/LC_MESSAGES"
    msgfmt "$srcdir/zh_CN.po" -o "$pkgdir/usr/share/locale/zh_CN/LC_MESSAGES/gtkgreet.mo"
}
