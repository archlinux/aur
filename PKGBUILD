# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Dale Mallion <dale.mallion@gmail.com>

pkgname=gnomish-beige-theme
pkgver=20140509
pkgrel=1
pkgdesc="This is a clean beige theme for GTK3, based on Adwaita (provided by gnome-themes-standard), plus a matching GNOME-Shell theme."
arch=('any')
url="http://tsujan.deviantart.com/art/GnomishBeige-300113500"
license=('CCPL')
depends=('gtk-engine-murrine' 'gnome-themes-standard')
makedepends=('p7zip')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options' 'gnome-shell-extension-user-theme: User Theme extension for GNOME Shell')
source=("${pkgname}-${pkgver}.7z::http://fc09.deviantart.net/fs71/f/2014/129/3/1/gnomishbeige_by_tsujan-d4yoh24.7z")
sha256sums=('2550915ae5539f53cbf689709c59cbbbb2490b9eb97e13ace56f2afd4021ae33')

package() {
 install -dm755 ${pkgdir}/usr/share/themes
 cp -r ${srcdir}/GnomishBeige ${pkgdir}/usr/share/themes
 find "${pkgdir}/usr/share/themes" -type d -exec chmod 755 '{}' \;
 find "${pkgdir}/usr/share/themes" -type f -exec chmod 644 '{}' \;
}
