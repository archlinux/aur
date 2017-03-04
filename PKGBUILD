#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=rmdupes
pkgver=2017.3.4.1
pkgrel=1
pkgdesc='Command-line tool to find and remove duplicate files.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/rmdupes"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.3.4.1.tar.xz
  http://xyne.archlinux.ca/projects/rmdupes/src/rmdupes-2017.3.4.1.tar.xz.sig
)
sha512sums=(
  a480ff64ad020860969b0d3062dfea19462ebe7302e480c5e64fcbb60c40f0d573ae4b4e36de3b6ede721e415ba5203a66475f98a01a70556f08a00663119b33
  13d53ebce9beb4757458a9db7bf1eb836b76a852f0feedfe78f604b4fc0d23e4c4a5de4d76c65e083c1897b5930be4f411600bb060cdd8a0a4cc47871130c515
)
md5sums=(
  297064f16df32f97e9e452998a5e3f04
  8b20a5d235c1638b39c6ba9ff58b83d5
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
