#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=repoman
pkgver=2015
pkgrel=1
pkgdesc='The pacman of repository managers.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/repoman"
depends=(python3)
backup=(etc/repoman/json/urls.json)
source=(
  http://xyne.archlinux.ca/projects/repoman/src/repoman-2015.tar.xz
  http://xyne.archlinux.ca/projects/repoman/src/repoman-2015.tar.xz.sig
)
sha512sums=(
  9e1654d0556f41e80061bdd2d12a9ab7c7f0b56524e4f02f41212ed3f5e651f40b9b53917a805e3676cef9db88a8e20b8c6dc06af9b101604b1f80c75fb38f30
  3c7cc57298bd2599258e94325366672b325e54a0d7d6da7f3d0f56f6c14d78cf08554ec4d27b932e6f7f480c3bbb17dac5e3d9c3945ca44db26e3719fd763528
)
md5sums=(
  3ee2a159276cbe6a0020d659e487ddbc
  dbac960ad0cd2886efaeb448ec98f269
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/urls.json" "$pkgdir/etc/repoman/json/urls.json"
}

# vim: set ts=2 sw=2 et:
