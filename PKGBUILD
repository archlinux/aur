# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="webtrees-theme-justlight"
pkgver=2.1.1
pkgrel=1
pkgdesc="JustLight theme for webtrees"
url="https://justcarmen.nl/modules-webtrees-2/justlight-theme/"
license=("GPL3")
arch=("any")
depends=("webtrees")
source=("$pkgname-$pkgver.zip::https://github.com/JustCarmen/$pkgname/releases/download/$pkgver/justlight-$pkgver.zip")
sha256sums=('7b8f2289713038a626b9035b411da2bbd9f79c4ba00c5860cc5c96493fa0d316')
options=("!strip")

package(){
 # program files
 install -d "$pkgdir/usr/share/webapps/webtrees/modules_v4"
 cp -r "jc-theme-justlight" "$pkgdir/usr/share/webapps/webtrees/modules_v4"
}
