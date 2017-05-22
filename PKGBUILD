# Maintainer: Philipp A. <flying-sheep@web.de>
_name=jupyter_core
pkgname=jupyter-completion
pkgver=4.3.0
pkgrel=1
pkgdesc='ZSH completion for several jupyter commands'
arch=('any')
url="https://github.com/jupyter/$_name/tree/master/examples"
license=('BSD')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('18819511a809afdeed9a995a9c27bcfb')

package() {
	cd "$srcdir/$_name-$pkgver/examples"
	
	install -Dm0644 completions-zsh "$pkgdir/usr/share/zsh/site-functions/_jupyter"
	install -Dm0644 jupyter-completion.bash "$pkgdir/usr/share/bash-completion/completions/jupyter"
}
