#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=fehbg-mgr
pkgver=2013.7.10
pkgrel=1
pkgdesc='Save and restore named fehbg states.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/fehbg-mgr"
depends=(bash-statemgr)
source=(
  http://xyne.archlinux.ca/projects/fehbg-mgr/src/fehbg-mgr-2013.7.10.tar.xz
  http://xyne.archlinux.ca/projects/fehbg-mgr/src/fehbg-mgr-2013.7.10.tar.xz.sig
)
sha512sums=(
  3e3a298707c952ce0274b63b0e7551818d8ef4c1e1c624f03d9f78dbb41477c424aa8185ff2dcc3ff5f4253a5f426d533af586876a182bbdb799d315dc720c18
  8eaef0156a30e23e334db7d7fc26a6dc431d3a089820c2fbfca652459550529b2da339818f03b99cee6255d0fab4e5a010c4a39cbdce37723e86a283ad8faf9b
)
md5sums=(
  848902ea724c71468c51a43dd1523782
  a4b66ffb770cffc96ef26291ad86010e
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
