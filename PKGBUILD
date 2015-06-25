# Maintainer: Acidhub <contact@acidhub.click>

pkgname=gvim-checkpath
pkgdesc='Gvim wrapper for autodetect permissions/root, open multi files in tabs, based on geany-checkpath'
url='http://acidhub.click/GVim'

pkgver=3.2
pkgrel=5
arch=(any)

license=('GPL')

depends=('sudo' 'gvim')

source=('http://acidhub.click/downloads/gvim-checkpath.sh')
md5sums=('bc4b206bc7e5c48ae62b7a69f7b9351b')

package() {
	install -Dm755 "$srcdir"/gvim-checkpath.sh "$pkgdir"/usr/bin/gvim_checkpath
}
