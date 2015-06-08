# Maintainer: BlackICE <blackice@craft.net.br>

pkgname=gvim-checkpath
pkgdesc='Gvim wrapper for autodetect permissions/root, open multi files in tabs, based on geany-checkpath'
url='http://www.craft.net.br/'

pkgver=3.2
pkgrel=4
arch=(any)

license=('GPL')

depends=('sudo' 'gvim')

source=('http://web.craft.net.br/downloads/gvim-checkpath.sh')
md5sums=('bc4b206bc7e5c48ae62b7a69f7b9351b')

package() {
	install -Dm755 "$srcdir"/gvim-checkpath.sh "$pkgdir"/usr/bin/gvim_checkpath
}
