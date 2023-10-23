# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="webtrees-theme-justlight"
pkgver=2.2.6
pkgrel=1
pkgdesc="JustLight theme for webtrees"
url="https://justcarmen.nl/modules-webtrees-2/justlight-theme/"
license=("GPL3")
arch=("any")
depends=("webtrees")
source=("$pkgname-$pkgver.zip::https://github.com/JustCarmen/$pkgname/releases/download/$pkgver/justlight-$pkgver.zip")
sha256sums=('14f545fe61968f320d08f3e42eb59c39b00f90a87da492e2618944b52e405356')
options=("!strip")

package(){
 # program files
 install -d "$pkgdir/usr/share/webapps/webtrees/modules_v4"
 cp -r "jc-theme-justlight" "$pkgdir/usr/share/webapps/webtrees/modules_v4"
}
