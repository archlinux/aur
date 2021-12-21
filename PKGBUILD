
pkgname="python-argostranslate-pip"
pkgver=1
pkgrel=1
pkgdesc="Open source neural machine translation in Python. Designed to be used either as a Python library or desktop application. Uses OpenNMT for translations and PyQt for GUI."
arch=(x86_64 i686)
license=('MIT')
depends=(python python-pytorch python-tqdm)
makedepends=(python-pip)
provides=("python-argostranslate")

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps argostranslate
}
