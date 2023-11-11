# Maintainer: hikaary <hikary.local@gmail.com>
pkgname=ymcli
_pkgname=ymcli
pkgver=0.1
pkgrel=1
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgdesc="CLI player for yandex music"
url="https://github.com/hikaary/ymcli"
arch=("any")
license=("MIT")
depends=("python" "vlc" "python-aiohttp")
source=("git+https://github.com/hikaary/$_pkgname.git")
md5sums=("SKIP")


package()
{
  cd "$_pkgname"
  python setup.py install --root="$pkgdir"
}
