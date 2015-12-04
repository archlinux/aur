#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-xcpf
pkgver=2015.12.4.2
pkgrel=1
pkgdesc='Xyne'"'"'s common Pacman functions, for internal use.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-xcpf"
depends=(python3 pyalpm)
optdepends=('rsync: Retrieve ABS files via rsync.')
source=(
  http://xyne.archlinux.ca/projects/python3-xcpf/src/python3-xcpf-2015.12.4.2.tar.xz
  http://xyne.archlinux.ca/projects/python3-xcpf/src/python3-xcpf-2015.12.4.2.tar.xz.sig
)
sha512sums=(
  971cd6a57a3b0b772ea78db65be13554bd9bac338a7c3ebab6dc723aaeb08d397437a0715ede2525772315f2eb21c668975013204d54f93b705c0fe2f378aa1a
  9b865a49791cf2432d3efb6896b9332765ebb2bb0feb97363262cf8fbb560106d3b7ad123c4121238d8eff578c233802afdcccb1b0473a27eafee3b6a78eb8ce
)
md5sums=(
  67175897b8cee8113eb5b6f66404787f
  330d91d6cfeb91d62573059350f6e664
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim: set ts=2 sw=2 et:
