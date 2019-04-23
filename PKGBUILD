# Maintainer: Valentijn V. <deepnavy at waifu dot club>
pkgname=gb-studio
pkgver=1.0.0
pkgrel=1
pkgdesc="Visual retro game maker"
arch=('x86_64')
url="https://gbstudio.dev"
license=('MIT')
groups=('')
depends=('alsa-lib' 'atk' 'at-spi2-atk' 'cairo' 'dbus' 'desktop-file-utils' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'kde-cli-tools' 'kio-extras' 'libcups' 'libglvnd' 'libnotify' 'libutil-linux' 'libx11' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxrandr' 'libxrender' 'libxss' 'libxtst' 'nspr' 'nss' 'opera' 'pango' 'trash-cli' 'xdg-utils' 'xpra')
optdepends=('gnome-keyring'
            'libgnome-keyring'
            'lsb-release'
            'pulseaudio')
options=('!strip' '!emptydirs')
source=("https://github.com/chrismaltby/gb-studio/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('016a03226cb2a170f6791e2b578f436033ff35572dd9341dc3a27f56fdebf8dd001f7ce611fb8007c7416433261c26e4688ee1138cb91c68cae945fcc894dccb')

package(){
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/usr/lib/gb-studio/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/gb-studio/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
