# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname='flix-cli'
_name="${pkgname#python-}"
pkgver=1.8.0
pkgrel=1
pkgdesc="Watch movies and series from your commandline"
arch=('any')
url="https://github.com/demonkingswarn/flix-cli"
license=('GPL3')
depends=('mpv' 'ffmpeg' 'fzf' 'yt-dlp' 'catt' 'python' 'python-httpx' 'python-regex' 'python-beautifulsoup4' 'python-krfzf')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/1b/8e/bd0116b54a217d4279cb6b5dd234af8a8aead18eb0f7ee0be2e076980737/flix_cli-${pkgver}-py3-none-any.whl")
sha256sums=('31ff53676ea533f41e639ff2e96a6cf922c0e80a9f8c202d26c03d1e4886fb78')
noextract=("flix_cli-${pkgver}-py3-none-any.whl")

package(){
        python -m installer --destdir="$pkgdir" "flix_cli-${pkgver}-py3-none-any.whl"
}

