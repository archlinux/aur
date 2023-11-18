pkgname=ymcli-git
_pkgname=ymcli
pkgver=0.2
pkgrel=1
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgdesc="CLI player for yandex music"
url="https://github.com/hikaary/ymcli"
arch=("any")
license=("MIT")
depends=("python" "vlc" "python-aiohttp" "python-vlc" "python-textual" "python-yandex-music-api")
source=("git+https://github.com/hikaary/$_pkgname.git")
md5sums=("SKIP")


package()
{
  cd "$_pkgname"
  python setup.py install --root="$pkgdir"
}
