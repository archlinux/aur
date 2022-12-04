# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="python-ruff"
_pkgname="ruff"
pkgver=0.0.155
pkgrel=1
pkgdesc="An extremely fast Python linter, written in Rust."
url="https://github.com/charliermarsh/ruff"
arch=("any")
sha256sums=('52925aa07a9aa1cfdf61df4de84ab8db9b0b886482d2fbb4a52361b9b1f591c3')
filename="ruff-0.0.152-py3-none-manylinux_2_17_x86_64.manylinux2014_x86_64.whl"
source=("https://files.pythonhosted.org/packages/ae/e0/3fbf274133f4291bc50f607c30f7f616623285c5e8f6495e3cc54d1deb59/${filename}")
license=("MIT")
depends=("python")
makedepends=("python-pip")

package() {
  pip install "${filename}" --root="${pkgdir}/"
}

