#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=pbget
pkgver=2016.2
pkgrel=1
pkgdesc='Retrieve PKGBUILDs and local source files from Git, ABS and the AUR for makepkg.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/pbget"
depends=(pm2ml python3 python3-aur python3-xcgf python3-xcpf)
source=(
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2016.2.tar.xz
  http://xyne.archlinux.ca/projects/pbget/src/pbget-2016.2.tar.xz.sig
)
sha512sums=(
  a5f0a9057f0cb69c96ac8170f05cd251cf0df4e76f43b706666712ad161d0fd5e550ccfec8e65d067d58b0d17579d5768c1b131bf9526c8857040233e2059654
  f9e4f7bce267e2130631cc27639273a888d28539584ebe2d673066cdbb055a47d9ce0bacf36b85820fac12a368435d4e3da47667b1577ac2622abfbd920f13e5
)
md5sums=(
  badc88369b8dabd312ae6791662bc919
  19fe056d72b40f77a1909b96df9f4798
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
