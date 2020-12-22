# Maintainer: urklang <nicolas at zrna dot org>
# Contributor: urklang <nicolas at zrna dot org>
pkgname=sitala-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Drum sampler plugin and standalone app."
arch=('x86_64')
url="https://decomposer.de/sitala/"
license=('unknown')
groups=('')
depends=('alsa-lib>=1.0.16' 'freetype2>=2.2.1' 'glibc>=2.27' 'libcurl-gnutls>=7.16.2' 'libx11' 'libxext')
options=('!strip' '!emptydirs')
source_x86_64=("https://decomposer.de/sitala/releases/sitala-1.0_amd64.deb")
sha512sums_x86_64=('3d0976878eec22c2f3d13a08994be7b2b981637cb93ea2bfa1405c53b46635ae734602453950313cc41a0078ddebab2a68e49f6f26a49d6639b5cd9dcacbc204')
package(){
	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"
}
