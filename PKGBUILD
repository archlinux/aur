# Maintainer: urklang <nicolas at zrna dot org>
# Contributor: urklang <nicolas at zrna dot org>
pkgname=sitala-bin
pkgver=1.0.0beta
pkgrel=1
pkgdesc="Drum sampler plugin and standalone app."
arch=('x86_64')
url="https://decomposer.de/sitala/"
license=('unknown')
groups=('')
depends=('alsa-lib>=1.0.16' 'freetype2>=2.2.1' 'glibc>=2.27' 'libcurl-gnutls>=7.16.2' 'libx11' 'libxext')
options=('!strip' '!emptydirs')
source_x86_64=("https://decomposer.de/sitala/releases/sitala-1.0.0-beta-2_amd64.deb")
sha512sums_x86_64=('9c4cc29457b1b4829eac22d70b97a8fc03637f99c42ba2f1f52a03bd0df9203982bef1dc97159c7a62c595a0c8253335dd0b7b74863b5da0a4fe15430df0a65a')

package(){
	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"
}
