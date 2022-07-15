#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=repoman
pkgver=2015
pkgrel=4
pkgdesc='The pacman of repository managers.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/repoman"
depends=(python3)
backup=(etc/repoman/json/urls.json)
source=(
  https://xyne.dev/projects/repoman/src/repoman-2015.tar.xz
  https://xyne.dev/projects/repoman/src/repoman-2015.tar.xz.sig
)
sha512sums=(
  9e1654d0556f41e80061bdd2d12a9ab7c7f0b56524e4f02f41212ed3f5e651f40b9b53917a805e3676cef9db88a8e20b8c6dc06af9b101604b1f80c75fb38f30
  37f345b0526d2b45e2941a2c89b93bd0c795eb0d6d2a32363b728283648d419af3d3329eaaef35ba26c87a4b8763a91f53ecc483e94fb39dd219465015de27ff
)
md5sums=(
  3ee2a159276cbe6a0020d659e487ddbc
  e1b44b926531eb91fd7abf0bea62da6b
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/urls.json" "$pkgdir/etc/repoman/json/urls.json"
}

# vim: set ts=2 sw=2 et:
