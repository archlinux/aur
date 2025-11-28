# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname='flix-cli'
_pkgname="flix_cli"
pkgver=1.8.1
pkgrel=1
pkgdesc="Watch movies and series from your commandline"
arch=('any')
url="https://github.com/demonkingswarn/flix-cli"
license=('GPL3')
depends=('mpv' 'ffmpeg' 'fzf' 'yt-dlp' 'catt' 'python' 'python-httpx' 'python-regex' 'python-beautifulsoup4' 'python-krfzf' 'python-typer' 'python-platformdirs')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/07/4d/1ba45457d385b477e6484ea218c5de029ad0d2c62e68692f46e8e0c9b1c3/${_pkgname}-${pkgver}-py3-none-any.whl")
sha256sums=('7188c4eecbf5e382f6de1591318652beedafa0213aceb93525c11946293fd7f5')
noextract=("${_pkgname}-${pkgver}-py3-none-any.whl")

package(){
        python -m installer --destdir="$pkgdir" "${_pkgname}-${pkgver}-py3-none-any.whl"
}

