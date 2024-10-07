# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Carl George < arch at cgtx dot us >

_name=gnome-shell-impatience
_uuid=impatience@gfxmonk.net

pkgname=gnome-shell-extension-impatience
pkgver=0.5.2
_tag="version-$pkgver"
pkgrel=1
pkgdesc='Speed up the gnome-shell animation speed'
arch=('any')
url="https://github.com/timbertson/$_name"
license=('GPL-3.0-or-later')
depends=('gnome-shell>=1:47' 'gnome-shell<1:48')
source=($_name-$pkgver.tar.gz::$url/archive/$_tag.tar.gz)
sha256sums=('18637ab1ce1974f20506373dd0f4bb33c329139c6152c06b35d8b333e2921f0c')

package() {
    cd $_name-$_tag
    install -dm755 "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid
    cp -r impatience/* "$pkgdir"/usr/share/gnome-shell/extensions/$_uuid
}
