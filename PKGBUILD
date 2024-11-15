# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=zpy
pkgver=0.3.10
pkgrel=1
pkgdesc='Manage Python environments in Zsh, with uv or pip-tools'
arch=('any')
url='https://andydecleyre.github.io/zpy/'
license=('Unlicense')
depends=('zsh')
optdepends=('fzf: fuzzy finding'
			'skim: fuzzy finding'
			'uv: faster operation')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AndydeCleyre/zpy/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('3a32cf9d5bafb76d168369d55332c3a8adebd15a745d92b8213e321284fc2ae4b2c1597c4a01799b1ffce648ed8d35b748289f1d13b65c24db7ca647211717aa')

package(){
	cd "$pkgname-$pkgver"
	install -Dvm644 zpy.plugin.zsh -t "$pkgdir/usr/share/zsh/plugins/$pkgname/"
}
