#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=moz2fs
pkgver=2013.9.23.3
pkgrel=4
pkgdesc='Convert Mozilla (Firefox) bookmarks in JSON format to and from a filesystem hierarchy.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/moz2fs"
depends=(python3)
optdepends=('unison: required by moz2fs-sync and moz2fs-profile-sync scripts')
source=(
  https://xyne.dev/projects/moz2fs/src/moz2fs-2013.9.23.3.tar.xz
  https://xyne.dev/projects/moz2fs/src/moz2fs-2013.9.23.3.tar.xz.sig
)
sha512sums=(
  f37ceec837ea006579eadf3e1874594e3f045f01d6823337872322eca5d930f33e884081ad292d459337c04b78c80b14e6126c5bb70e2628b52ec6c7f1575b65
  412c00e3331bb605220ffd5fc7148a2ce4848436f74c28e56f8f3c48d1c1f5dddd1bc53f87bf0956189ae6ef1daa6d76be9637dea85aac0068357cf837cc7bc1
)
md5sums=(
  9a0cece7ad4ffebaf3d24251f3147555
  6fc0e3a5b380a5af34156e78721e2677
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  for exe in moz2fs{,-{,profile-}sync}
  do
    install -Dm755 "$srcdir/$pkgname-$pkgver/$exe" "$pkgdir/usr/bin/$exe"
  done
}


# vim: set ts=2 sw=2 et:
