# Maintainer: Florijan Hamzic <florijanh at gmail dot com>
_pypi_name='WeasyPrint'
pkgver=0.34
pkgrel=1
pkgdesc="Converts web documents (HTML, CSS, SVG, ...) to PDF."
license=('BSD')
arch=('any')
url="http://weasyprint.org/"
makedepends=('python' 'python-distribute')
depends=('python' 'pango>=1.29.3' 'gdk-pixbuf2>=2.25' 'python-gobject'
         'python-cairo' 'python-lxml' 'python-cairosvg>=0.4.1'
         'python-tinycss>=0.3' 'python-cssselect>=0.6' 'python-html5lib' 
         'python-cffi' 'python-cairocffi' 'python-pyphen')

pkgname="python-weasyprint"
_pypi_name_inital=$(echo ${_pypi_name}|cut -c1)
source=("https://github.com/Kozea/WeasyPrint/archive/v${pkgver}.tar.gz")
md5sums=('41bc61eca7516d8396028c6f8990c007')


package() {
  cd "$srcdir/WeasyPrint-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
