# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=planify-bin
pkgver=4.19.5
pkgrel=1
pkgdesc="Task manager with Todoist and Nextcloud support (prebuilt, bundles gxml)"
arch=('x86_64')
url="https://useplanify.com"
license=('GPL-3.0-or-later')
depends=('evolution-data-server' 'gtk4' 'gtksourceview5' 'icu' 'json-glib'
         'libadwaita' 'libgee' 'libical' 'libportal' 'libportal-gtk4'
         'libsecret' 'libsoup3' 'libspelling' 'sqlite' 'hicolor-icon-theme')
provides=('planify')
conflicts=('planify' 'elementary-planner')
source=("https://github.com/Felitendo/PKGBUILDS/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.zst")
sha256sums=('563a80c7660b207f6c139e0f78bcb49631e8369be29369a7a984b022816b8c0f')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
