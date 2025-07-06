# Maintainer: asahiner <sfahmetsahiner@gmail.com>
pkgname=slack-bin
pkgver=4.43.51
pkgrel=1
pkgdesc="Slack Desktop (official client)"
arch=('x86_64')
url="https://slack.com/"
license=('custom')
depends=('glibc' 'gtk3' 'libxss' 'libappindicator-gtk3')
options=('!strip')

_filename="slack-${pkgver}-0.1.el8.x86_64.rpm"
source=("https://downloads.slack-edge.com/desktop-releases/linux/x64/4.43.51/slack-4.43.51-0.1.el8.x86_64.rpm")
sha256sums=('SKIP')

package() {
  cd "$srcdir"

  bsdtar -xf "$_filename"

  mkdir -p "$pkgdir/usr"
  cp -r usr/* "$pkgdir/usr/"
}