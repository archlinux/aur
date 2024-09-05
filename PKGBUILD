pkgname=nextchat-bin
pkgver=2.14.2
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
md5sums=('c11a8edcc6022519064a862403c7bb79')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
