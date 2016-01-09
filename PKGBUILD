# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=havsfunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=r21
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='http://forum.doom9.org/showthread.php?t=166582'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
optdepends=('vapoursynth-plugin-addgrain-git: for QTGMC function (optional)'
            'vapoursynth-plugin-awarpsharp2-git: for YAHR function'
            'vapoursynth-plugin-bilateral-git: for logoNR function'
            'vapoursynth-plugin-ctmf-git: for HQDeringmod function'
            'vapoursynth-plugin-dctfilter-git: for Deblock_QED function'
            'vapoursynth-plugin-deblock-git: for Deblock_QED function'
            'vapoursynth-plugin-dfttest-git: for QTGMC function (optional)'
            'vapoursynth-plugin-eedi2-git: for santiag function'
            'vapoursynth-plugin-fft3dfilter-git: for QTGMC function (optional)'
            'vapoursynth-plugin-flash3kyuu_deband-git: for SmoothLevels function'
            'vapoursynth-plugin-fluxsmooth: for logoNR function'
            'vapoursynth-plugin-fmtconv: for QTGMC function'
            'vapoursynth-plugin-genericfilters-git: for HQDering function'
            'vapoursynth-plugin-knlmeanscl: for QTGMC function (optional)'
            'vapoursynth-plugin-mvtools: for QTGMC, GrainStabilizeMC and LSFmod function'
            'vapoursynth-plugin-nnedi3: for QTGMC function'
            'vapoursynth-plugin-sangnommod-git: for santiag function'
            'vapoursynth-plugin-scenechange: for QTGMC function'
            'vapoursynth-plugin-temporalsoften-git: for TemporalSoften function'
            )
source=("https://dl.dropbox.com/u/6596386/vapoursynth-plugins/${_plug}-${pkgver}.7z")
sha1sums=('d71683c92cfa0a1408c439af3452c2b4bb6a964e')

_sites_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

package() {
  install -Dm644 "${_plug}.py" "${pkgdir}${_sites_packages}/${_plug}.py"
}
