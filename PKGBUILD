# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=finduncommonshares
_upstream=FindUncommonShares
pkgver=3.2
pkgrel=1
pkgdesc="Python script allowing to quickly find uncommon shares in vast Windows Domains..."
arch=('any')
url="https://github.com/p0dalirius/finduncommonshares"
license=(custom)
depends=('python'
         'impacket'
         'python-xlsxwriter'
         'python-sectools'
         'python-pycryptodome')
provides=("$pkgname")
conflicts=("$pkgname-git" "$pkgname-bin")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('d43e92c2c11b85d0d064794069a5270af25fde20f1b94959e16a4d5454816e7a585b71b374c12d3c4fd446212c1c7a8fd1b6d43d461bdae1c4d78eb6be052900')

package() {
  install -Dm0755 $srcdir/$_upstream-$pkgver/FindUncommonShares.py "$pkgdir/usr/bin/$pkgname"
}

