#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=idemptables
pkgver=2012
pkgrel=2
pkgdesc='Idempotent iptables wrapper for appending and deleting rules.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/idemptables"
depends=(iptables)
source=(
  http://xyne.archlinux.ca/projects/idemptables/src/idemptables-2012.tar.xz
  http://xyne.archlinux.ca/projects/idemptables/src/idemptables-2012.tar.xz.sig
)
sha512sums=(
  c8512b30ed528ac81d45ff4eabe6098371ee6f40f9a85ff0d716e9a051912d170a7d1b1fde04b1b1074fbe082a5380bff6d0071ea4b33d18d98063617ee37457
  376ab5a94657357499680e8ddaa91c983dac64a2afb97de02fdef3ce88dac8e3b0cd05fc6be53401b03a85ebb856d98b2ecc1d8850b3671f736307105573d02b
)
md5sums=(
  937834cc23b4afe9628fa7bc69ad39ba
  3f63fe8004ce7912f621728671ae9b42
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
