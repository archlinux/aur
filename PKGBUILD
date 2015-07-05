# Contributors:
# henning mueller <henning@orgizm.net>

pkgname=anarchism
pkgver=14.0
pkgrel=1
_debpkgrel=2
pkgdesc='Source of information regarding Anarchist (libertarian socialist) theory and practice.'
arch=(any)
license=(FDL)
url=http://www.infoshop.org/AnAnarchistFAQ
options=(docs)
depends=(xdg-utils)
source=(
  http://mirrors.kernel.org/debian/pool/main/a/$pkgname/$pkgname\_$pkgver-$_debpkgrel\_all.deb
  anarchism.desktop
  anarchism.png
  anarchism.svg
)

build() {
  cd $srcdir
  ar x $(basename $source)
  tar xzf data.tar.gz
}

package() {
  cd $srcdir
  cp -r usr $pkgdir
  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  cp $pkgname.png $pkgdir/usr/share/pixmaps
  cp $pkgname.desktop $pkgdir/usr/share/applications
}

sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
            'fc5cc0c2918037bdbebb16b27de5e847e5041c6e50fe37ef073b501446221521'
            '81f90b8985679d1a9741cf21a4908cbb12d3fe3d67dabb7af0b77e73c1c16744'
            '66fbad2b8a849e1a643f98dac50095b8ab5ddf0256f407c2c629aa5ef5e17e62')
sha256sums=('dcd7a7c0e1f20e17222852dbf679e4775533858ef9b3d96beb5bf32f01548644'
            'fc5cc0c2918037bdbebb16b27de5e847e5041c6e50fe37ef073b501446221521'
            '81f90b8985679d1a9741cf21a4908cbb12d3fe3d67dabb7af0b77e73c1c16744'
            '66fbad2b8a849e1a643f98dac50095b8ab5ddf0256f407c2c629aa5ef5e17e62')
