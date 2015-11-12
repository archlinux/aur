# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=r20
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='http://forum.doom9.org/showthread.php?t=166582'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
optdepends=('vapoursynth-plugin-genericfilters-git: for HQDering function'
            'vapoursynth-plugin-ctmf-git: for HQDeringmod function'
            'vapoursynth-plugin-mvtools: for QTGMC, GrainStabilizeMC and LSFmod function'
            'vapoursynth-plugin-nnedi3: for QTGMC function'
            'vapoursynth-plugin-fmtconv: for QTGMC function'
            'vapoursynth-plugin-scenechange: for QTGMC function'
            'vapoursynth-plugin-fft3dfilter-git: for QTGMC function (optional)'
            'vapoursynth-plugin-dfttest-git: for QTGMC function (optional)'
            'vapoursynth-plugin-knlmeanscl: for QTGMC function (optional)'
            'vapoursynth-plugin-addgrain-git: for QTGMC function (optional)'
            'vapoursynth-plugin-bilateral-git: for logoNR function'
            'vapoursynth-plugin-fluxsmooth: for logoNR function'
            'vapoursynth-plugin-flash3kyuu_deband-git: for SmoothLevels function'
            )
source=("https://dl.dropbox.com/u/6596386/vapoursynth-plugins/${_plug}-${pkgver}.7z")
sha1sums=('db82d7a159ba128219ab796193ca3c8c14daba76')

_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

package() {
  install -Dm644 "${_plug}.py" "${pkgdir}${_sites_packages}/${_plug}.py"
}
