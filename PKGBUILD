# Maintainer: Benjamin Buske (info@buske-it.com)
# Contributor: Benjamin Buske (info@buske-it.com)
pkgname=blisk-browser-stable
pkgver=25.0.115.28
pkgrel=1
pkgdesc="The browser from blisk.io. Blisk is the first developer-oriented browser. It provides teams and freelancers with a workspace to develop and test modern web applications at least twice faster."
arch=('i686' 'x86_64')
url="https://blisk.io"
depends=('alsa-lib' 'at-spi2-core' 'bash-completion' 'ca-certificates' 'cairo>=1.6.0' 'curl' 'dbus>=1.9.14' 'desktop-file-utils' 'expat>=2.1beta3' 'gcc-libs' 'glib2>=2.39.4' 'glibc>=2.17' 'gtk3' 'gtk4' 'hicolor-icon-theme' 'libcups>=1.6.0' 'libcurl-gnutls' 'libdrm>=2.4.75' 'libx11>=1.4.99.1' 'libxcb>=1.9.2' 'libxcomposite>=0.4.4' 'libxdamage>=1.1' 'libxext' 'libxfixes' 'libxrandr' 'mesa>=17.1.0rc2' 'nspr>=4.9' 'nss>=3.35' 'pango' 'ttf-liberation' 'xdg-utils>=1.0.2')
provides=('blisk-browser-stable')
options=('!strip' '!emptydirs')
source_x86_64=("https://blisk.io/download/installer/?os=linux-rpm")

sha512sums_x86_64=('59288ef7390f59a134341a18c489d8912250bf5ae3aceaf0755e1e5b9fefaceae915cfdb136b176d74d8caea8b9779460437a2926201e1d33c5b3265be7cc653')

package(){

	# Extract package data
	find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"

}
