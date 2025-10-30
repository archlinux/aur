# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname='flix-cli'
_name="${pkgname#python-}"
pkgver=1.7.11.4
pkgrel=1
pkgdesc="Watch movies and series from your commandline"
arch=('any')
url="https://github.com/demonkingswarn/flix-cli"
license=('GPL3')
depends=('mpv' 'ffmpeg' 'fzf' 'yt-dlp' 'catt' 'python' 'python-httpx' 'python-regex' 'python-beautifulsoup4' 'python-krfzf')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/87/ec/a8d9cfd0424907848c58e9e5c3071b88bf60848b2976a80dde5f119b6d6b/flix_cli-${pkgver}-py3-none-any.whl")
sha256sums=('43523404c1689294d17376dbef6792fc208759ce012e52984631eae2c48866fc')
noextract=("flix_cli-${pkgver}-py3-none-any.whl")

package(){
        python -m installer --destdir="$pkgdir" "flix_cli-${pkgver}-py3-none-any.whl"
}

