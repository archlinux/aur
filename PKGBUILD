#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2017.5.30
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pbget"
depends=(git pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2017.5.30.tar.xz
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2017.5.30.tar.xz.sig
)
sha512sums=(
  ccd8508e96a3a6c6af4730a12de435c3a5dec765fe5e907ce2dd771b93777c5549cf1e55a5620f4e6cc1943c0629885b337843afb55366fbbf4cd75213f37a45
  410b9778eeeb092a25ec4983e498ff3f0220502a2e3964f888ed88d7a4c4b6383dbda0a3ff4438322a3d157340888b41aa8cbd43bd0cec1debbce7b096ae702c
)
md5sums=(
  85d70bfc297e372ea880aba37fc9ba3a
  38132302c9f5293ebfd2b8972931157a
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim: set ts=2 sw=2 et:
