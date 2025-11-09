# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname='flix-cli'
_name="${pkgname#python-}"
pkgver=1.7.11.7
pkgrel=1
pkgdesc="Watch movies and series from your commandline"
arch=('any')
url="https://github.com/demonkingswarn/flix-cli"
license=('GPL3')
depends=('mpv' 'ffmpeg' 'fzf' 'yt-dlp' 'catt' 'python' 'python-httpx' 'python-regex' 'python-beautifulsoup4' 'python-krfzf')
makedepends=('python-installer')
source=(""https://files.pythonhosted.org/packages/7c/a2/172c49ae269fb94862814a50dd8f2aacbbd74b6f5e316bf29b596073515b/flix_cli-${pkgver}-py3-none-any.whl)
sha256sums=('b86f95c9b747b657f4c1894af5536c7ebbf902246bd6f66fbeae05e58c5bab4b')
noextract=("flix_cli-${pkgver}-py3-none-any.whl")

package(){
        python -m installer --destdir="$pkgdir" "flix_cli-${pkgver}-py3-none-any.whl"
}

