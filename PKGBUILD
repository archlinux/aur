# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >
# Maintainer: Cimu Wang <cimu58@gmail.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Robert Cegliński <rob.ceglinski@gmail.com>

# Custom variables
_name=clearurls
_id="{74145f27-f039-47ce-a470-a662b129930a}"


pkgname=firefox-clearurls
pkgver=1.26.1
pkgrel=1
pkgdesc="Remove tracking elements from URL's to protect privacy while browsing."
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/$_name/"
license=('LGPL3')
groups=('firefox-addons')
source=("$_name-$pkgver.xpi::https://addons.mozilla.org/firefox/downloads/latest/$_name/latest.xpi")
md5sums=('58ff2220a7c9eee3e22bc3d0c50eef32')


package() {
  install -Dm644 ${_name}-${pkgver}.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/${_id}.xpi"
}