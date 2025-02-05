pkgname=nextchat-bin
pkgver=2.15.8
pkgrel=1
pkgdesc="A cross-platform ChatGPT client"
arch=('x86_64')
url="https://github.com/ChatGPTNextWeb/ChatGPT-Next-Web"
license=('MIT')
depends=('glib2' 'gtk3' 'cairo' 'libsoup' 'openssl' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
provides=(nextchat)
conflicts=(nextchat)
source=("$url/releases/download/v$pkgver/next-chat_${pkgver}_amd64.deb")
md5sums=('81f255104e7b2aad22d4783f6bffbd2b')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
