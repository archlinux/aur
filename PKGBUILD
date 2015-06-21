#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=moz2fs
pkgver=2013.9.23.3
pkgrel=1
pkgdesc='Convert Mozilla (Firefox) bookmarks in JSON format to and from a filesystem hierarchy.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/moz2fs"
depends=(python3)
optdepends=('unison: required by moz2fs-sync and moz2fs-profile-sync scripts')
source=(
  http://xyne.archlinux.ca/projects/moz2fs/src/moz2fs-2013.9.23.3.tar.xz
  http://xyne.archlinux.ca/projects/moz2fs/src/moz2fs-2013.9.23.3.tar.xz.sig
)
sha512sums=(
  f37ceec837ea006579eadf3e1874594e3f045f01d6823337872322eca5d930f33e884081ad292d459337c04b78c80b14e6126c5bb70e2628b52ec6c7f1575b65
  89c4a2ea9be7f3c84b2d24900bc04f0fd1ffd907d2c6408678e3b0cd801f4cde9c0dadd5dcb715093135e6a58d078e4374b071ae68210155be79de030abb06b3
)
md5sums=(
  9a0cece7ad4ffebaf3d24251f3147555
  4b2f2e80b69ad070bd8c08ec29770f9a
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  for exe in moz2fs{,-{,profile-}sync}
  do
    install -Dm755 "$srcdir/$pkgname-$pkgver/$exe" "$pkgdir/usr/bin/$exe"
  done
}


# vim: set ts=2 sw=2 et:
