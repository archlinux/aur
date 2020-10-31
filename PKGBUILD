# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=locatec
pkgver=0.0.1
pkgrel=1
pkgdesc="Better locate/plocate, search inside local path"
#url="https://github.com/simona70/grub-custom-simona"
arch=('any')
license=('GPL3')

depends=('bash' 'mlocate' 'coreutils')
optdepends=('plocate' 'perl')

#t does not need to be included in the source array
#changelog=$pkgname.changelog

source=($pkgname-$pkgver.tar.gz) #file locale incapsulato localmente
#source=("$pkgname"::'git+https://github.com/maateen/battery-monitor.git#branch=devel')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/loh-tar/$pkgname/archive/v$pkgver.tar.gz")
#source=("http://foo.org/bar/foobar.tar.xz")
source=("locatec" "locatecc")

#backup=('etc/default/grub-custom')

#noextract=('foobar.tar.xz')
#prepare() {
#  lrzip -d source.tar.lrz
#prepare() {
#  tar -xf ${pkgname}-${pkgver}.tar.gz

#generate with 'makepkg -g'
#md5sums=('SKIP')
md5sums=('915f024abe9d12246891d55e56f49660'
         '56cbfe0855d86c16293b32e955ce164b')

# se trova il nuovo si chiama .pacnew (no / root path)
#backup=('dir/file')

# 4=r 2=w 1=x owner group others
package() {
  cd "$srcdir"

  install -Dm755 "$srcdir/locatecc" "$pkgdir/usr/bin/locatecc"
  install -Dm755 "$srcdir/locatec" "$pkgdir/usr/bin/locatec"
}












