# Maintainer: con-f-use <con-f-use@gmx.net>
pkgname=slack-messenger
pkgver=2.7.0
_build=0.1.fc21
pkgrel=1
epoch=
pkgdesc="Team communication client for the 21st century"
arch=('x86_64')
url="https://www.slack.com)/"
license=('unknown')
depends=('curl' 'gtk2' 'nss' 'libxtst' 'gconf' 'libsecret' 'alsa-lib' 'libxkbfile' 'libxss')
#makedepends=('rpmextract')
options=('emptydirs')
source=("https://downloads.slack-edge.com/linux_releases/slack-$pkgver-$_build.$arch.rpm")
md5sums=('78e2f87ef1e863b40ad80752e245ed4b')

package() {
  rsync -ruDq "$srcdir/" "$pkgdir"
}
