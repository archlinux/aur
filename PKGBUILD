pkgname=purple-url-handler
pkgver=0.0.1
pkgrel=2
pkgdesc="Open xmpp:// and irc:// URLs in Pidgin"
url='https://github.com/jhass/PKGBUILDs/tree/main/purple-url-handler'
arch=('any')
license=('MIT')
depends=('desktop-file-utils' 'libpurple')
install=$pkgname.install
source=($pkgname.desktop)

package() {
  RPM_BUILD_ROOT=$pkgdir desktop-file-install $pkgname.desktop
}

# vim:set ts=2 sw=2 et:
sha256sums=('72b5262adf53bde1dad09923498de59ac8a4e35e1a6fbcf789ab4df15b0ef1b2')
