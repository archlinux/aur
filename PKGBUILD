# Maintainer: KUMAX <kumax2048@pm.me>

pkgname=python-itchat-uos
_name=${pkgname#python-}
pkgdesc="A complete and graceful API for Wechat."
url=https://pypi.org/project/itchat-uos
pkgrel=1
pkgver=1.5.0.dev0
arch=('any')
license=("MIT")
provides=("ddns")
conflicts=("python-itchat" "python-itchat-uos-git")
makedepends=('python-pip' 'python-installer')
source=(
"https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
)
sha256sums=('0293b77cab31fa8c9c2144ea8b5636d43836f47855beba0c603ad3fb1ff89625')
makedepends=(python-build python-installer python-wheel)

package() {
	cd ${srcdir}
	python -m installer --destdir="$pkgdir" *.whl
}
