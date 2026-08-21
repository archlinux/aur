pkgbase='python-mail-html-open'
pkgname=('python-mail-html-open')
_module='mail-html-open'
pkgver='0.1'
pkgrel=1
pkgdesc="Open HTML emails from terminal mail clients in your browser."
url="https://github.com/To999999999/mail-html-open"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("git+https://github.com/To999999999/mail-html-open.git")
sha256sums=(SKIP)

build() {
    cd "${srcdir}/${_module}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
sha256sums=('SKIP')
