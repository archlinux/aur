# Maintainer: urklang <nicolas at zrna dot org>
# Contributor: urklang <nicolas at zrna dot org>
pkgname=sitala-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="Drum sampler plugin and standalone app."
arch=('x86_64')
url="https://decomposer.de/sitala/"
license=('unknown')
depends=('alsa-lib>=1.0.16' 'freetype2>=2.2.1' 'glibc>=2.27' 'libcurl-gnutls>=7.16.2' 'libx11' 'libxext')
options=('!strip' '!emptydirs')
source_x86_64=("https://decomposer.de/sitala/releases/sitala-1.0_amd64.deb")
sha512sums_x86_64=('294f313969c9ef9a2a2fca80b34d4ff537d60012ccf0112db365a4706d3e98a2a46a5c75fd37fbdeb7365c1ceca06dea77b3274317e8db0a5ece473f399b70c4')
package(){
	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"
}
