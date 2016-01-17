pkgname="visibletesla"
_pkgname="VisibleTesla"
pkgver=0.50.08
pkgrel=1
url="http://www.visibletesla.com/"
pkgdesc="Monitor and Control the Tesla Model S"
arch=("any")
license=("Unkown")
depends=("jdk7")
source=(
  "https://dl.dropboxusercontent.com/u/7045813/VT2/RawApp/${_pkgname}.zip"
  "visibletesla"
  "visibletesla.desktop"
  )
sha256sums=('5d683c261aa816609b58332e994edf9928c7c4a96a63fda8295c6373a7679650'
            '22c3c7769943c6bc37596f6643c1bffa8c0489109f7c659ca08ebaccc596b688'
            'b4b362c760e99b6a9855dee3550534e3fd560ae559453c87c9b9c1d9720bf30b')

package() {
	cd "$srcdir/$_pkgname $pkgver"
  mkdir -p "$pkgdir/opt/visibletesla"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/bin"

  cp -r * "$pkgdir/opt/visibletesla"
  cp ../visibletesla.desktop "$pkgdir/usr/share/applications"
  cp ../visibletesla "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et fdm=marker:
