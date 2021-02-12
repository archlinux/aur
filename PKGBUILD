#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2021.2
pkgrel=2
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/mimeo"
depends=(file python-xdg python3)
optdepends=('shared-mime-info: for recognizing more MIME-types')
source=(
  https://xyne.archlinux.ca/projects/mimeo/src/mimeo-2021.2.tar.xz
  https://xyne.archlinux.ca/projects/mimeo/src/mimeo-2021.2.tar.xz.sig
)
sha512sums=(
  03675101349874d6c0dc05fa076a650bfe2b923b7c0ac37f7661b0913e595f26713522c0f6a070af21f33bdb6e88fea82fea29b97cabe2e3cb8b8ea3502e3458
  331143079847ca0c50ad3ced6628d9a4e2f70e791799c36694a299185e8928b0c8e1121d6ce6d5fde57228176e6d26d0b8fc5faeb2610e921103355cef8e4ec9
)
md5sums=(
  873fbc910018075b448659f0c9ab7420
  db59075328c10d476596bddea3a2fac9
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
