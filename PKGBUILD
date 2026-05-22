pkgname=lightbase
pkgver=1.0.0
pkgrel=1
pkgdesc="A sovereign, high-performance API development ecosystem."
arch=('x86_64')
url="https://github.com/Aarav90-cpu/LightBase"
license=('MIT')
depends=('python' 'python-pywebview' 'python-websocket-client' 'python-paho-mqtt' 'gtk3' 'webkit2gtk' 'sqlite' 'openssl')
makedepends=('make' 'cmake' 'gcc' 'git')
source=("git+https://github.com/Aarav90-cpu/LightBase.git")
md5sums=('SKIP')

build() {
    cd "LightBase"
    make build
}

package() {
    cd "LightBase"
    make DESTDIR="$pkgdir" install
}
