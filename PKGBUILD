# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsjetpack
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.4.0
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
)
makedepends=('python-pip')
optdepends=(
    'ffms2'
    'vapoursynth-plugin-adaptivegrain'
    'vapoursynth-plugin-addnoise'
    'vapoursynth-plugin-awarpsharp2'
    'vapoursynth-plugin-bestsource'
    'vapoursynth-plugin-bilateralgpu'
    'vapoursynth-plugin-bm3d: Denoiser'
    'vapoursynth-plugin-bm3dcuda: Denoiser'
    'vapoursynth-plugin-bwdif'
    'vapoursynth-plugin-chickendream'
    'vapoursynth-plugin-d2vsource'
    'vapoursynth-plugin-dctfilter'
    'vapoursynth-plugin-descale-jet-git'
    'vapoursynth-plugin-dfttest2: Denoiser'
    'vapoursynth-plugin-dpid'
    'vapoursynth-plugin-eedi2'
    'vapoursynth-plugin-eedi3m'
    'vapoursynth-plugin-fft3dfilter: Denoiser'
    'vapoursynth-plugin-fmtconv'
    'vapoursynth-plugin-hysteresis'
    'vapoursynth-plugin-imwri'
    'vapoursynth-plugin-knlmeanscl: NLMeans Denoiser (OpenCL)'
    'vapoursynth-plugin-lsmashsource'
    'vapoursynth-plugin-mlrt'
    'vapoursynth-plugin-mvtools'
    'vapoursynth-plugin-neo_f3kdb: Debanding'
    'vapoursynth-plugin-nlm-cuda: NLMeans Denoiser (CUDA)'
    'vapoursynth-plugin-nlm: NLMeans Denoiser (CPU)'
    'vapoursynth-plugin-placebo'
    'vapoursynth-plugin-removegrain'
    'vapoursynth-plugin-retinex'
    'vapoursynth-plugin-sangnom'
    'vapoursynth-plugin-scxvid: Scene detection'
    'vapoursynth-plugin-tcanny'
    'vapoursynth-plugin-tedgemask'
    'vapoursynth-plugin-vivtc'
    'vapoursynth-plugin-vszip'
    'vapoursynth-plugin-wnnm'
    'vapoursynth-plugin-wwxd: Scene detection'
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
source=("https://files.pythonhosted.org/packages/77/93/e1063c6f2782e6ba64eed4d7181dc765ee4907886d0b78786853755525d5/vsjetpack-0.4.0-py3-none-any.whl")
sha256sums=('4d96ed0114998b341209a9aba0d9941f5374d9d30bd237038e412ffaf1c71a58')

package() {
    pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
