pkgname=offlinenet
pkgver=1.0.2.3
pkgrel=1
pkgdesc="Browse the web without internet"
arch=('any')
url="https://pypi.org/project/offlinenet-base"
license=('MIT')
depends=('python' 'python-typer' 'python-rich' 'python-requests' 'python-beautifulsoup4' 'git' 'python-setuptools' 'python-certifi' 'python-charset-normalizer' 'python-click' 'python-idna' 'python-markdown-it-py' 'python-mdurl' 'python-pygments' 'python-shellingham' 'python-soupsieve' 'python-typing_extensions' 'python-urllib3')

source=("https://files.pythonhosted.org/packages/f7/5d/84d86b6e558dd9cc2dbafd70f30a71ec80c3466d03103636740762cebe91/offlinenet_base-1.0.2.3.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$srcdir/offlinenet_base-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/offlinenet_base-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
