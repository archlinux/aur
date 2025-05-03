# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsjetpack
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.3.5
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
)
makedepends=('python-pip')
optdepends=(
  'vapoursynth-plugin-eedi2'
  'vapoursynth-plugin-eedi3m'
  'vapoursynth-plugin-znedi3'
  'vapoursynth-plugin-sangnom'
  'vapoursynth-plugin-neo_f3kdb: Debanding'
  'vapoursynth-plugin-chickendream'
  'vapoursynth-plugin-addnoise'
  'vapoursynth-plugin-vivtc'
  'vapoursynth-plugin-wnnm'
  'vapoursynth-plugin-bm3d: Denoiser'
  'vapoursynth-plugin-bm3dcuda: Denoiser'
  'vapoursynth-plugin-dctfilter'
  'vapoursynth-plugin-mlrt'
  'vapoursynth-plugin-dfttest2: Denoiser'
  'vapoursynth-plugin-mvtools'
  'vapoursynth-plugin-bwdif'
  'vapoursynth-plugin-fft3dfilter: Denoiser'
  'vapoursynth-plugin-nlm: NLMeans Denoiser (CPU)'
  'vapoursynth-plugin-nlm-cuda: NLMeans Denoiser (CUDA)'
  'vapoursynth-plugin-knlmeanscl: NLMeans Denoiser (OpenCL)'
  'vapoursynth-plugin-vsakarin'
  'vapoursynth-plugin-resize2'
  'vapoursynth-plugin-fmtconv'
  'vapoursynth-plugin-descale-jet-git'
  'vapoursynth-plugin-placebo'
  'vapoursynth-plugin-awarpsharp2'
  'vapoursynth-plugin-tcanny'
  'vapoursynth-plugin-tedgemask'
  'vapoursynth-plugin-retinex'
  'vapoursynth-plugin-adaptivegrain'
  'vapoursynth-plugin-removegrain'
  'vapoursynth-plugin-vszip'
  'vapoursynth-plugin-bilateralgpu'
  'vapoursynth-plugin-dpid'
  'vapoursynth-plugin-bestsource'
  'vapoursynth-plugin-dgdecodenv-bin'
  'vapoursynth-plugin-d2vsource'
  'vapoursynth-plugin-hysteresis'
  'ffms2'
  'vapoursynth-plugin-lsmashsource'
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
source=("https://files.pythonhosted.org/packages/2b/6f/606c1e7461001d24fd70b39a7fd2ddd620ee25143722f5dacbf9c8097041/vsjetpack-0.3.5-py3-none-any.whl")
sha256sums=('0e0747a37a63d6327b6b3445a80ff3fa909b00a57d8891b463cbb9f186a910dd')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
