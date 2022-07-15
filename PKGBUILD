#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=fehbg-mgr
pkgver=2013.7.10
pkgrel=4
pkgdesc='Save and restore named fehbg states.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/fehbg-mgr"
depends=(bash-statemgr)
source=(
  https://xyne.dev/projects/fehbg-mgr/src/fehbg-mgr-2013.7.10.tar.xz
  https://xyne.dev/projects/fehbg-mgr/src/fehbg-mgr-2013.7.10.tar.xz.sig
)
sha512sums=(
  3e3a298707c952ce0274b63b0e7551818d8ef4c1e1c624f03d9f78dbb41477c424aa8185ff2dcc3ff5f4253a5f426d533af586876a182bbdb799d315dc720c18
  cbf12f589aa820d25ec8eaa617d5a28e99df519cbcfcb8a636cfa90e2e0b0971f583d13cf45197ae29776e59e617088c72abb79212a33d77bf7b15c6dfe2a39b
)
md5sums=(
  848902ea724c71468c51a43dd1523782
  7542bb6f8b9bcd8eac68bf848bc3a097
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
