# Maintainer: Thomas Weißschuh <thomas_weissschuh lavabit com>

pkgname=ipython-mathjax
pkgver=2
pkgrel=1
pkgdesc="mathjax files for usage in the ipython notebook"
url='http://ipython.org/ipython-doc/stable/install/install.html#mathjax'
arch=(any)
license=('WTFPL')
depends=('mathjax')
optdepends=('ipython: for use with ipython'
            'ipython2: for use with ipython2')

package() {
  install -d "${pkgdir}/usr/lib/python3.3/site-packages/IPython/html/static"
  install -d "${pkgdir}/usr/lib/python2.7/site-packages/IPython/html/static"

  ln -s "/usr/share/mathjax" "${pkgdir}/usr/lib/python3.3/site-packages/IPython/html/static/mathjax"
  ln -s "/usr/share/mathjax" "${pkgdir}/usr/lib/python2.7/site-packages/IPython/html/static/mathjax"
}
