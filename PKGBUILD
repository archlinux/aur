# Maintener : m242 m242@protonmail.com
# All the font works is made by Jens Kutilek (https://github.com/jenskutilek)
pkgname=sudo-font-git
pkgver=0.40
pkgrel=1
pkgdesc="Monospaced font by jenskulitek"
url="https://www.kutilek.de/sudo-font/"
arch=('any')
license=('OFL')
depends=('git' 'fontconfig')

_fontdir=~/.local/share/fonts/sudo-font

package() {
	git clone https://github.com/jenskutilek/sudo-font /tmp/sudo-font
	
	mkdir -p $_fontdir
	install -m644 /tmp/sudo-font/sudo/*.ttf $_fontdir
}
