pkgname=ptodo
pkgver=5.1
pkgrel=17
pkgdesc="a TUI todolist-app written in python"
arch=('any')
depends=('python')
makedepends=('git')
url='https://github.com/NVitschDEV/ptodo'
source=("ptodo.py")
sha256sums=('15329a6e8f907a236b1e235ff676fc854f64ac53cbba11dc20bacb059a93d2d2')

package() {
  # Installs the script to /usr/bin/ and makes it executable
  install -Dm755 "$srcdir/ptodo.py" "$pkgdir/usr/bin/ptodo"
}
