# Maintainer: wallace < str(11) + my_id at gmail dot com>

pkgname='hawkeye-quicklook-git'
_gitname='hawkeye'
pkgver=20180921.cec717e
pkgrel=1
pkgdesc='A command line GTK Application that allow to quickly open PDFs, Markkown Files, Images and Websites in a "small" window'
arch=('any')
url='https://github.com/brpaz/hawkeye'
license=('MIT')
depends=('gtk3' 'evince' 'python-markdown' 'python-argparse')
optdepends=('python-markdown: Markdown support')
source=('git://github.com/brpaz/hawkeye.git')
md5sums=('SKIP')


package() {
    cd "${srcdir}/${_gitname}"
    python3 setup.py -q install --root="$pkgdir" --optimize=1
}
