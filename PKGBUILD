#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2021.12
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/pbget"
depends=(git pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  https://xyne.dev/projects/pbget/src/pbget-2021.12.tar.xz
  https://xyne.dev/projects/pbget/src/pbget-2021.12.tar.xz.sig
)
sha512sums=(
  286cf77c13caabefd24d583bb5b5b04ce2467a299507e0c64cb21f53004ab4eac8db878f48dde31e15f9ac50b761262e87c8dc7cfb9acb4b74a315f25e31cda0
  3077f55d8db1a548a20d132cc3875ebfbc18043054691410451e1224f988aba1fd5e51ef2a25c4c327a37b42ff795110380a63bf07a1762f0b6fd9fb925097ab
)
md5sums=(
  0d5bd5b5f676c34226571275a07cbad7
  e15c63013ffa3324982611ccac027e7e
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
