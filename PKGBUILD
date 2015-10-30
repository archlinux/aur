# Maintainer: Gomasy <nyan@gomasy.jp>

pkgname=lightdm-webkit-google-git
pkgver=20140429
pkgrel=1
pkgdesc="A Google/ChromeOS style LightDM Webkit greeter theme"
arch=('i686' 'x86_64')
url="https://github.com/omgmog/lightdm-webkit-google"
license=('WTFPL')
depends=('lightdm-webkit-greeter')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/omgmog/lightdm-webkit-google.git")
md5sums=('SKIP')

package() {
	install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/"
	cp -r "$srcdir/lightdm-webkit-google" "$pkgdir/usr/share/lightdm-webkit/themes/"
}
