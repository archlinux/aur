pkgname=nextchat-bin
pkgver=2.12.4
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
md5sums=('d9822b78cf2c07de6a24d89b682ca421')

package(){

	# Extract package data
	tar -xz -f data.tar.gz -C "${pkgdir}"

}
