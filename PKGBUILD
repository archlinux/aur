pkgname=nextchat-bin
pkgver=2.15.2
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
md5sums=('f2aad35dfa2de43a9b23252bf8956a55')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
