# Maintainer: Simona <simona.pisano[at]gmail[dot]com>
pkgname=locate2
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
source=("locate2.sh")

#backup=('etc/default/grub-custom')

#noextract=('foobar.tar.xz')
#prepare() {
#  lrzip -d source.tar.lrz
#prepare() {
#  tar -xf ${pkgname}-${pkgver}.tar.gz

#generate with 'makepkg -g'
#md5sums=('SKIP')
md5sums=('4a1dd8d6a8ba2db0d750ad84509a8dc9')

# se trova il nuovo si chiama .pacnew (no / root path)
#backup=('dir/file')

# 4=r 2=w 1=x owner group others
package() {
  cd "$srcdir"

  install -Dm755 "$srcdir/locate2.sh" "$pkgdir/usr/bin/locate2.sh"
}












