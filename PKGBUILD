# Submitter: David Rosenstrauch <darose@darose.net>

pkgname=roundcubemail-plugin-keyboard-shortcuts-ng
pkgver=0.9.4
pkgrel=1
pkgdesc='Roundcube plugin that enables keyboard shortcuts, and makes associations configurable by Roundcube admin.'
arch=('any')
url='https://plugins.roundcube.net/packages/teon/keyboard_shortcuts_ng'
license=('AGPL3')
depends=('roundcubemail')
source=("https://github.com/teonsystems/roundcube-plugin-keyboard-shortcuts-ng/archive/v${pkgver}.tar.gz")
md5sums=('c83f2792485f599dea68536638959d60')

package() {
    mkdir -p "${pkgdir}/usr/share/webapps/roundcubemail/plugins"
    cp -r "${srcdir}/roundcube-plugin-keyboard-shortcuts-ng-${pkgver}" "${pkgdir}/usr/share/webapps/roundcubemail/plugins/keyboard_shortcuts_ng"
}
