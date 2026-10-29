# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="webtrees-theme-justlight"
pkgver=2.4.0
pkgrel=1
pkgdesc="JustLight theme for webtrees"
url="https://justcarmen.nl/modules-webtrees-2/justlight-theme/"
license=("GPL3")
arch=("any")
depends=("webtrees")
source=("$pkgname-$pkgver.zip::https://github.com/JustCarmen/$pkgname/releases/download/$pkgver/justlight-$pkgver.zip")
sha256sums=('95147fac1b2c984fcbdb89175fa1aa4e8e7250473bf67e2c11510b437aea23c0')
options=("!strip")

package(){
 # program files
 install -d "$pkgdir/usr/share/webapps/webtrees/modules_v4"
 cp -r "jc-theme-justlight" "$pkgdir/usr/share/webapps/webtrees/modules_v4"
}
