#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=xac
pkgver=2018
pkgrel=1
pkgdesc='A markdown- and Pandoc-based content management system (CMS).'
arch=(any)
license=(GPL)
url="https://xyne.archlinux.ca/projects/xac"
depends=(pandoc python3)
optdepends=('graphviz: plugin support' 'openbabel: plugin support' 'source-highlight: plugin support' 'tex2png: plugin support')
source=(
  https://xyne.archlinux.ca/projects/xac/src/xac-2018.tar.xz
  https://xyne.archlinux.ca/projects/xac/src/xac-2018.tar.xz.sig
)
sha512sums=(
  a066ac4426cf7e54d97dd32858e69d72740ac496c74683105961ae106883a490e676caa8138664e2099e3c811820f9c84722c9f22a0e66a9d5a1abfc62d60b34
  d0cb373f1e24c1e6f717b30b23700e255263cf39872fcb0fa1a3adb7fc918ff2b8ac06ad2c22d4f042fbcd6cc59565db4fbe6c12c7cac9921ca362dd6739d0d0
)
md5sums=(
  e5a14e8d2cfd451f848424a3f0eea0ad
  e6aa636375ea50e5655d9bab642b0582
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
