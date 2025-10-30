# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname='flix-cli'
_name="${pkgname#python-}"
pkgver=1.7.10.9
pkgrel=1
pkgdesc="Watch movies and series from your commandline"
arch=('any')
url="https://github.com/demonkingswarn/flix-cli"
license=('GPL3')
depends=('mpv' 'ffmpeg' 'fzf' 'yt-dlp' 'catt' 'python' 'python-httpx' 'python-regex' 'python-beautifulsoup4' 'python-krfzf')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/1d/00/2f994e756120dcc98d982a6253ace447a94f987fd67fd017ef3c63606154/flix_cli-${pkgver}-py3-none-any.whl")
sha256sums=('52cfe9e87f2f0d0d7a6dd4b7d619ac2887a46e67ff13c5f80e20419c983e678e')
noextract=("flix_cli-${pkgver}-py3-none-any.whl")

package(){
        python -m installer --destdir="$pkgdir" "flix_cli-${pkgver}-py3-none-any.whl"
}

