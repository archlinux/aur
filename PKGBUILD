# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="webtrees-theme-justlight"
pkgver=2.2.2.1
pkgrel=1
pkgdesc="JustLight theme for webtrees"
url="https://justcarmen.nl/modules-webtrees-2/justlight-theme/"
license=("GPL3")
arch=("any")
depends=("webtrees")
source=("$pkgname-$pkgver.zip::https://github.com/JustCarmen/$pkgname/releases/download/$pkgver/justlight-$pkgver.zip")
sha256sums=('19ff0296f6dcc8c17466fcd3eb5a3844cf6a085df0f332597b4d3eb0964d7fb9')
options=("!strip")

package(){
 # program files
 install -d "$pkgdir/usr/share/webapps/webtrees/modules_v4"
 cp -r "jc-theme-justlight" "$pkgdir/usr/share/webapps/webtrees/modules_v4"
}
