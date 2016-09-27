# Maintainer: surefire@cryptomile.net
pkgname=zsh-completions-udisksctl
pkgver=0.1
pkgrel=1
pkgdesc="Zsh completions for udisksctl"
url='https://lists.freedesktop.org/archives/devkit-devel/2014-February/001554.html'
arch=(any)
license=('unknown')
depends=('zsh' 'udisks2')
source=('_udisksctl')
md5sums=('4e970a7b7f8706c2a9dab7d74cf68cd8')

package() {
	install -Dm0644 -t "${pkgdir}/usr/share/zsh/site-functions" _udisksctl
}
