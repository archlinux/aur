# Maintainer: liolok <aur@liolok.com>

# https://extensions.gnome.org/extension-info/?pk=1379&shell_version=3.36
_gnome_site='https://extensions.gnome.org'
_gnome_shell_version=3.36
_name='mpris-indicator-button'
_uuid='mprisindicatorbutton@JasonLG1979.github.io'
_pk=1379
_version_tag=16687

pkgname="gnome-shell-extension-$_name"
pkgver=15
pkgrel=1
pkgdesc="A full featured MPRIS indicator button extension for GNOME Shell 3.36+"
arch=('any')
url="$_gnome_site/extension/$_pk/$_name/"
license=('GPL3')
depends=("gnome-shell>=$_gnome_shell_version")
source=("$pkgname.zip::$_gnome_site/download-extension/$_uuid.shell-extension.zip?version_tag=$_version_tag")
sha256sums=('13c0dde83910e38cb2f5cd18331bc20d8996f9c6d7885c44304b57c31cc50a5e')

package() {
    local _destdir="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
    install --directory "$_destdir"
    install *.js *.css metadata.json --target-directory="$_destdir"
}
