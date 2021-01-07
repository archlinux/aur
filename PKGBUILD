# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname='python-outproc'
pkgver='0.20'
pkgrel='2'
pkgdesc="Pluggable Output Processor is an engine to wrap any executabe and capture its output through a pluggable module to colorize it and/or (re)format"
arch=('any')
url='http://zaufi.github.io/pluggable-output-processor.html'
license=('GPLv3')
depends=('python'
         'python-termcolor')
source=("https://github.com/zaufi/pluggable-output-processor/archive/version-${pkgver}.tar.gz")
md5sums=('28cd9de9cad100a5b360442306f81129')

package(){
  install=python-outproc.install

  cd "${srcdir}/pluggable-output-processor-version-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  mkdir -p "${pkgdir}/usr/lib/outproc/bin"
}

# vim: ts=2 sw=2 et
