# Maintainer: Amiad <arch@hatul.info>
pkgname=nautilus-periscope-git
pkgver=r152
pkgrel=2
pkgdesc="Integration of Periscope in Nautilus menus."
arch=(any)
url="https://github.com/patrickdessalle/periscope/"
license=(LGPL)
depends=('periscope-git' 'python-nautilus' 'pyxdg')
provides=('nautilus-periscope' ${pkgname})
conflicts=('nautilus-periscope' ${pkgname})
source=("https://raw.githubusercontent.com/patrickdessalle/periscope/master/bin/periscope-nautilus/periscope-nautilus.py")
sha256sums=('a48b85c07e2ea60079589d87f8c48a2f8b8994cddc7fbc89242362ecdc7b7dba')

package() {
  install -Dm755 "${srcdir}/periscope-nautilus.py" "${pkgdir}/usr/share/nautilus-python/extensions/periscope-nautilus.py"
}
