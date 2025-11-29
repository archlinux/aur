# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname='flix-cli'
_pkgname="flix_cli"
pkgver=1.8.1.9
pkgrel=1
pkgdesc="Watch movies and series from your commandline"
arch=('any')
url="https://github.com/demonkingswarn/flix-cli"
license=('GPL3')
depends=('mpv' 'ffmpeg' 'fzf' 'yt-dlp' 'catt' 'python' 'python-httpx' 'python-regex' 'python-beautifulsoup4' 'python-krfzf' 'python-typer' 'python-platformdirs')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/20/22/c897e80badec1d15ce6e32defd5659ffaece04171799993d10c55475aece/${_pkgname}-${pkgver}-py3-none-any.whl")
sha256sums=('7e12562483f7451c310838b6c31c357e8649cf88bc96bd2095e5be76b8cf61f2')
noextract=("${_pkgname}-${pkgver}-py3-none-any.whl")

package(){
        python -m installer --destdir="$pkgdir" "${_pkgname}-${pkgver}-py3-none-any.whl"
}

