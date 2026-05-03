pkgname=pycalc-git
pkgver=1.5
pkgrel=1
pkgdesc="Python console calculator"
arch=('any')
url="https://github.com" # Ссылка на ваш код
license=('MIT')
depends=('python')
source=("pycalc.py") # Имя вашего файла

package() {
    # Создаем папку в "виртуальной" системе и копируем туда файл
    install -Dm755 "${srcdir}/pycalc.py" "${pkgdir}/usr/bin/pycalc"
}

sha256sums=('dd5e2495c154cb3029739824799caad8aff44377316f82350f89c7f1efb416ec')
