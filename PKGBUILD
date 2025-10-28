# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=flix-cli
pkgver=1.7.0
pkgrel=1
pkgdesc="Watch movies and series from your commandline"
arch=('any')
url="https://github.com/demonkingswarn/flix-cli"
license=('GPL3')
depends=('mpv' 'ffmpeg' 'fzf' 'catt' 'python' 'python-httpx' 'python-regex' 'python-beautifulsoup4' 'python-krfzf')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/c8/7c/104cb34c7ed34e05ab6776ad679dedb1889a4d9e1c08666f5b85a428063d/flix_cli-${pkgver}-py3-none-any.whl")
sha256sums=('6bf5c466b6441a67f1ba4bf3d9e2183934a7c35984a861c6303552bffe98caa0')

package() {
    cd "$srcdir"
    python -m pip install --root="$pkgdir" --no-deps --ignore-installed flix_cli-${pkgver}-py3-none-any.whl
}

