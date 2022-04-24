# Maintainer: Harshith Mohan <gharshitmohan@ymail.com>
pkgname=bixby-studio
pkgver=8.15.1_r22d.23879
pkgrel=1
pkgdesc="Bixby Developer Studio"
arch=('x86_64')
url="https://bixbydevelopers.com/"
license=('commercial')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3: For tray-icon support')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://bixby-studio.s3.amazonaws.com/stable-c4f5c975-1d91-4065-b661-633de7275e11/BixbyStudio-${pkgver//_/-}-linux.deb")
md5sums_x86_64=('81cffcb9dfe3af3f8423d2810b64115f')

package(){
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "${pkgdir}/opt/Bixby Studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
