pkgname=i3title
pkgver=1.0
pkgrel=1
pkgdesc='Outputs window titles in i3 or sway'
license=('GPL2')
arch=(any)
depends=('python-i3ipc')
makedepends=('git')
url='https://github.com/jtsymon/i3title'
source=("git+$url.git")
md5sums=('SKIP')

package() {
        cd "${srcdir}/${pkgname}"
        install -D -m755 "./i3title.py" "${pkgdir}/usr/bin/i3title"
}
