# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=soifunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.14.2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://gitlab.com/shssoichiro/soifunc'
license=('MIT')
depends=(
	'vapoursynth'
	'vapoursynth-plugin-neo_f3kdb-git'
	'vapoursynth-plugin-vsjetpack'
	'vapoursynth-plugin-vszip'
	'vapoursynth-plugin-znedi3'
)
optdepends=(
	'vapoursynth-plugin-bm3dcuda: BM3D support, GPU version'
	'vapoursynth-plugin-bm3dcuda-cpu: BM3D support, CPU version'
	'vapoursynth-plugin-dfttest2: dfttest support, GPU version'
	'vapoursynth-plugin-dfttest2-cpu: dfttest support, CPU version'
	'vapoursynth-plugin-mlrt: frame interpolation functions'
	'vapoursynth-plugin-mlrt-ext-models-rife: frame interpolation functions'
)
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/0a/c9/4621356b863ec06b87c457d5cacdbd0a43a9ba04b956ecc007356f31f459/soifunc-0.14.2-py3-none-any.whl")
sha256sums=('5ea10f4241aaca7a5c1189c00142e49576f8f5893c579cb866665ca10cdd9963')

package() {
	python -m installer --destdir="$pkgdir" "${_plug}-${pkgver}-py3-none-any.whl"
}
