#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=fipolate
pkgver=2013.3
pkgrel=2
pkgdesc='Interpolate text files with variables through a fifo via user prompts.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/fipolate"
depends=(python3 python-pyinotify)
source=(
  http://xyne.archlinux.ca/projects/fipolate/src/fipolate-2013.3.tar.xz
  http://xyne.archlinux.ca/projects/fipolate/src/fipolate-2013.3.tar.xz.sig
)
sha512sums=(
  168c579cc11ec0920e26908dfb1bc6d722d92adcb323ea7ea1f9afd787d9186b93f170035b25aaf8e8eee8e2280f68350ed8ef1c5f103e91ff9d65ac7540b164
  0a90a5dd438a675fd5bb1a974fe55b06266e6482abb003af1ab4631dcb8c1113e860a871923d480d8bb35fcb21a362705ee3686dd0f53ac57c3f65fad83ddf57
)
md5sums=(
  f7709c6bf2cc11291de4b98c256e9a46
  68a46399ca699b44fa0eb2dfa9e84924
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
