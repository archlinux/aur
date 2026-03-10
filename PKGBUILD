# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsjetpack
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.3.0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-jetpack'
license=('MIT')
depends=(
	'vapoursynth'
	'python-rich'
	'python-jetpytools'
	'python-typing_extensions'
	'python-scipy'
	'vapoursynth-plugin-vsakarin'
	'vapoursynth-plugin-resize2'
	'vapoursynth-plugin-vszip'
	'vapoursynth-plugin-zsmooth'
)
makedepends=('python-installer')
optdepends=(
	'ffms2: Source filter'
	'vapoursynth-plugin-bestsource: Source filter'
	'vapoursynth-plugin-lsmashsource: Source filter'
	'vapoursynth-plugin-knlmeanscl: NLMeans Denoiser (OpenCL)'
	'vapoursynth-plugin-nlm-cuda: NLMeans Denoiser (CUDA)'
	'vapoursynth-plugin-nlm: NLMeans Denoiser (CPU)'
	'vapoursynth-plugin-bm3d: Denoiser'
	'vapoursynth-plugin-bm3dcuda: Denoiser (CUDA accelerated)'
	'vapoursynth-plugin-bm3dhip: Denoiser (AMD HIP accelerated)'
	'vapoursynth-plugin-dfttest2: Denoiser'
	'vapoursynth-plugin-fft3dfilter: Denoiser'
	'vapoursynth-plugin-scxvid: Scene detection'
	'vapoursynth-plugin-wwxd: Scene detection'
	'vapoursynth-plugin-adaptivegrain'
	'vapoursynth-plugin-addnoise'
	'vapoursynth-plugin-awarp'
	'vapoursynth-plugin-bilateralgpu'
	'vapoursynth-plugin-bwdif'
	'vapoursynth-plugin-chickendream'
	'vapoursynth-plugin-d2vsource'
	'vapoursynth-plugin-dctfilter'
	'vapoursynth-plugin-descale-jet-git'
	'vapoursynth-plugin-dpid'
	'vapoursynth-plugin-edgemasks'
	'vapoursynth-plugin-eedi2'
	'vapoursynth-plugin-eedi3m'
	'vapoursynth-plugin-fmtconv'
	'vapoursynth-plugin-hysteresis'
	'vapoursynth-plugin-imwri'
	'vapoursynth-plugin-mlrt'
	'vapoursynth-plugin-mvtools'
	'vapoursynth-plugin-placebo'
	'vapoursynth-plugin-removegrain'
	'vapoursynth-plugin-retinex'
	'vapoursynth-plugin-sangnom'
	'vapoursynth-plugin-subtext'
	'vapoursynth-plugin-tcanny'
	'vapoursynth-plugin-tedgemask'
	'vapoursynth-plugin-vivtc'
	'vapoursynth-plugin-wnnm'
	'vapoursynth-plugin-znedi3'
)
provides=(
	vapoursynth-plugin-vsaa
	vapoursynth-plugin-vsdeband
	vapoursynth-plugin-vsdehalo
	vapoursynth-plugin-vsdeinterlace
	vapoursynth-plugin-vsdenoise
	vapoursynth-plugin-vsexprtools
	vapoursynth-plugin-vskernels
	vapoursynth-plugin-vsmasktools
	vapoursynth-plugin-vsrgtools
	vapoursynth-plugin-vsscale
	vapoursynth-plugin-vssource
	vapoursynth-plugin-vstools
)
conflicts=(
	vapoursynth-plugin-vsaa
	vapoursynth-plugin-vsdeband
	vapoursynth-plugin-vsdehalo
	vapoursynth-plugin-vsdeinterlace
	vapoursynth-plugin-vsdenoise
	vapoursynth-plugin-vsexprtools
	vapoursynth-plugin-vskernels
	vapoursynth-plugin-vsmasktools
	vapoursynth-plugin-vsrgtools
	vapoursynth-plugin-vsscale
	vapoursynth-plugin-vssource
	vapoursynth-plugin-vstools
)
source=("https://files.pythonhosted.org/packages/11/a9/79ef6eb9a927a341ab68309d3f8458da57e8d42f2105ff84c98167f1cb9c/vsjetpack-1.3.0-py3-none-any.whl")
sha256sums=('0761a4013a5df06447bc464b7f75b2f0cfcc6c1e8ba94a882b8cb7551a047a23')

package() {
	python -m installer --destdir="$pkgdir" "${_plug}-${pkgver}-py3-none-any.whl"
}
