#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=rmdupes
pkgver=2017.3.6
pkgrel=1
pkgdesc='Command-line tool to find and remove duplicate files.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/rmdupes"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.3.6.tar.xz
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.3.6.tar.xz.sig
)
sha512sums=(
  5ca35f5af6a012cce7a2825fdd0f11ccfc1e23f28eda71e746bbd5bf9434fd5b74b89877fc48e33ee18a1c927cde5fee32660a80c7be02cbb2e1b617fcd73f6c
  9d73ec6ecd4740aa6020ae210ca550d556eeb4ad14a310657796bf32d6eec610ee4c8e38431428f955768962b3a7de9790ba47c422e75a618c656ed7bd46197a
)
md5sums=(
  be33dbefe953338b9004566227bb9b93
  b59ff82b4c3cab708b3d53e401150d23
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
