# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname='flix-cli'
_name="${pkgname#python-}"
pkgver=1.7.11.6
pkgrel=1
pkgdesc="Watch movies and series from your commandline"
arch=('any')
url="https://github.com/demonkingswarn/flix-cli"
license=('GPL3')
depends=('mpv' 'ffmpeg' 'fzf' 'yt-dlp' 'catt' 'python' 'python-httpx' 'python-regex' 'python-beautifulsoup4' 'python-krfzf')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/81/fb/7ef1c7167b1b4d63ebcad1ef98017f38a008674f03f00f482cbef32ea89d/flix_cli-${pkgver}-py3-none-any.whl")
sha256sums=('0543f971b57d8d724e1c5d084acfe1a2f1b9905210fcbfe15e1165f54fbfe754')
noextract=("flix_cli-${pkgver}-py3-none-any.whl")

package(){
        python -m installer --destdir="$pkgdir" "flix_cli-${pkgver}-py3-none-any.whl"
}

