# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=linphone-desktop-all
pkgver=4.1.1
pkgrel=2
pkgdesc="A free VoIP and video softphone based on the SIP protocol (Installed in /opt with all deps included)."
arch=("x86_64")
url="https://www.${pkgname%-desktop-all}.org/"
license=("GPL2")
depends=("alsa-utils" "desktop-file-utils" "glew" "gsm" "java-runtime" "libbsd" "pulseaudio" "qt5-graphicaleffects" "qt5-quickcontrols" "qt5-quickcontrols2" "qt5-speech" "qt5-svg" "qt5-tools" "v4l-utils")
makedepends=("cmake" "doxygen" "git" "graphviz" "ladspa" "nasm" "python-pystache" "python-setuptools" "yasm")
provides=("${pkgname%-all}")
conflicts=("${pkgname%-desktop-all}" "${pkgname%-all}")
source=(
  "${pkgname%-all}-${pkgver}.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/${pkgname%-all}/-/archive/${pkgver}/${pkgname%-all}-${pkgver}.tar.gz"
  "bcg729-1.0.4.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/bcg729/-/archive/1.0.4/bcg729-1.0.4.tar.gz"
  "bcmatroska2-0.23.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/bcmatroska2/-/archive/0.23/bcmatroska2-0.23.tar.gz"
  "bctoolbox-99472e6e08368ff843c7905f785c98f4f038a29d.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/bctoolbox/-/archive/99472e6e08368ff843c7905f785c98f4f038a29d/bctoolbox-99472e6e08368ff843c7905f785c98f4f038a29d.tar.gz"
  "bcunit-3.0.2.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/bcunit/-/archive/3.0.2/bcunit-3.0.2.tar.gz"
  "belcard-1.0.2.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/belcard/-/archive/1.0.2/belcard-1.0.2.tar.gz"
  "belle-msrp-31378b48daef19285241308e941bf8930fd01ec5.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/belle-msrp/-/archive/31378b48daef19285241308e941bf8930fd01ec5/belle-msrp-31378b48daef19285241308e941bf8930fd01ec5.tar.gz"
  "belle-sip-1.6.3.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/belle-sip/-/archive/1.6.3/belle-sip-1.6.3.tar.gz"
  "belr-a6380eccb56bb070712971189912f41eb7f047a3.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/belr/-/archive/a6380eccb56bb070712971189912f41eb7f047a3/belr-a6380eccb56bb070712971189912f41eb7f047a3.tar.gz"
  "bzrtp-1.0.6.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/bzrtp/-/archive/1.0.6/bzrtp-1.0.6.tar.gz"
  "${pkgname%-desktop-all}-cmake-builder-659a481fbad8ea37b1d43668e148f9c5b4e05ab3.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/${pkgname%-desktop-all}-cmake-builder/-/archive/659a481fbad8ea37b1d43668e148f9c5b4e05ab3/${pkgname%-desktop-all}-cmake-builder-659a481fbad8ea37b1d43668e148f9c5b4e05ab3.tar.gz"
  "antlr3-ac1069cf214b15b86272cbc6ded5916d7d2f85ec.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/antlr3/-/archive/ac1069cf214b15b86272cbc6ded5916d7d2f85ec/antlr3-ac1069cf214b15b86272cbc6ded5916d7d2f85ec.tar.gz"
  "bv16-floatingpoint-85b27910607b7e8edcf7c4a5dec1298b5877f4e2.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/bv16-floatingpoint/-/archive/85b27910607b7e8edcf7c4a5dec1298b5877f4e2/bv16-floatingpoint-85b27910607b7e8edcf7c4a5dec1298b5877f4e2.tar.gz"
  "ffmpeg-f7589590b37ab772f89d996f6b899d8a4daae684.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/ffmpeg/-/archive/f7589590b37ab772f89d996f6b899d8a4daae684/ffmpeg-f7589590b37ab772f89d996f6b899d8a4daae684.tar.gz"
  "gsm-0f8822b5326c76bb9dc4c6b552631f51792c3982.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/gsm/-/archive/0f8822b5326c76bb9dc4c6b552631f51792c3982/gsm-0f8822b5326c76bb9dc4c6b552631f51792c3982.tar.gz"
  "libjpeg-turbo-9f34b5eade75fd8e1548e6c7daf278d6ffb73526.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/libjpeg-turbo/-/archive/9f34b5eade75fd8e1548e6c7daf278d6ffb73526/libjpeg-turbo-9f34b5eade75fd8e1548e6c7daf278d6ffb73526.tar.gz"
  "libvpx-d2b4742a04da011adf05a4ea63d041f60e50195a.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/libvpx/-/archive/d2b4742a04da011adf05a4ea63d041f60e50195a/libvpx-d2b4742a04da011adf05a4ea63d041f60e50195a.tar.gz"
  "libxml2-v2.8.0.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/libxml2/-/archive/v2.8.0/libxml2-v2.8.0.tar.gz"
  "mbedtls-addacec784478244f66cd579fdc93b2e01e11c50.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/mbedtls/-/archive/addacec784478244f66cd579fdc93b2e01e11c50/mbedtls-addacec784478244f66cd579fdc93b2e01e11c50.tar.gz"
  "openh264-v1.5.0.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/openh264/-/archive/v1.5.0/openh264-v1.5.0.tar.gz"
  "opus-35b371a85bf2cf21ab4b12b5475c76a2775b25d1.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/opus/-/archive/35b371a85bf2cf21ab4b12b5475c76a2775b25d1/opus-35b371a85bf2cf21ab4b12b5475c76a2775b25d1.tar.gz"
  "speex-fc1dd43c3c9d244bca1c300e408ce0373dbd5ed8.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/speex/-/archive/fc1dd43c3c9d244bca1c300e408ce0373dbd5ed8/speex-fc1dd43c3c9d244bca1c300e408ce0373dbd5ed8.tar.gz"
  "srtp-d79ae95126baa3cec83097469e97525a1d9e2d50.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/srtp/-/archive/d79ae95126baa3cec83097469e97525a1d9e2d50/srtp-d79ae95126baa3cec83097469e97525a1d9e2d50.tar.gz"
  "v4l-utils-92995faa431fdd247d55b982898a70aa3a339874.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/v4l-utils/-/archive/92995faa431fdd247d55b982898a70aa3a339874/v4l-utils-92995faa431fdd247d55b982898a70aa3a339874.tar.gz"
  "zlib-cacf7f1d4e3d44d871b605da3b647f07d718623f.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/zlib/-/archive/cacf7f1d4e3d44d871b605da3b647f07d718623f/zlib-cacf7f1d4e3d44d871b605da3b647f07d718623f.tar.gz"
  "${pkgname%-desktop-all}-3.12.0.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/${pkgname%-desktop-all}/-/archive/3.12.0/${pkgname%-desktop-all}-3.12.0.tar.gz"
  "mediastreamer2-2.16.1.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/mediastreamer2/-/archive/2.16.1/mediastreamer2-2.16.1.tar.gz"
  "msamr-1.1.3.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/msamr/-/archive/1.1.3/msamr-1.1.3.tar.gz"
  "msopenh264-1.2.1.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/msopenh264/-/archive/1.2.1/msopenh264-1.2.1.tar.gz"
  "mssilk-1.1.1.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/mssilk/-/archive/1.1.1/mssilk-1.1.1.tar.gz"
  "mswasapi-0fd04f29dcc3eb2d60f4053cb75cca7d14691d5d.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/mswasapi/-/archive/0fd04f29dcc3eb2d60f4053cb75cca7d14691d5d/mswasapi-0fd04f29dcc3eb2d60f4053cb75cca7d14691d5d.tar.gz"
  "mswebrtc-1.1.1.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/mswebrtc/-/archive/1.1.1/mswebrtc-1.1.1.tar.gz"
  "msx264-1.5.4.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/msx264/-/archive/1.5.4/msx264-1.5.4.tar.gz"
  "ortp-1.0.2.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/ortp/-/archive/1.0.2/ortp-1.0.2.tar.gz"
  "webrtc-a7757e88b2ac2d1f11ac544c5822659b42db4cf3.tar.gz::https://gitlab.${pkgname%-desktop-all}.org/BC/public/external/webrtc/-/archive/a7757e88b2ac2d1f11ac544c5822659b42db4cf3/webrtc-a7757e88b2ac2d1f11ac544c5822659b42db4cf3.tar.gz"
  "${pkgname%-desktop-all}.desktop"
  "${pkgname%-all}.patch"
  "${pkgname%-desktop-all}.patch"
  "bctoolbox.patch"
  "belle-sip.patch"
  "bzrtp.patch"
  "mediastreamer2.patch"
  "ortp.patch"
  "v4l-utils.patch"
  "fix-qt5_1x.patch"
)
sha256sums=(
  "28840e5de42496e053332800a40f83ac2557b6bf50f08a6e1e9dc0509d610a49"
  "94b3542a06cbd96306efc19f959f9febae62806a22599063f82a8c33e989d48b"
  "ac55d765a383e2832ecbc0276effc6e0bda0d01b66d517294dcf33d3ba1419c2"
  "21e6c02e13afe4c4e35229df4650a309f5f6a516b8e3f61189126cf918149487"
  "eb7090aca5006aa0cea425722cb3fa1a7139185a7d9d1734d57844f69084713f"
  "26385b604318ff4e1455e08e915dadc01789ecc850b027e1b2f148e4cda3886c"
  "4f1e98848c74594557c397d726b3beffcc2a36a05d9684dfe5a43bd13035001d"
  "cbdf9f79786fe13f553964b84892e8d3a08b6eae18fc5bdea5fcb445d7f1ce17"
  "387a25a2ec274c7518bcbdc0fa75430a48fe4c09ecd93e065e6607153e01cfd5"
  "d551cf45372a180319fd93d7b59823ccff169dc41f67a777932c83def8019260"
  "9ac6de5df3096b4290f367b683111d56ce9256090be5651f0801b4efe899ab81"
  "8ec54da536d1b9c1ea3a06fee5fe61865c5904c9d53090a58bb8f0d6769b5faf"
  "57c3463ce52ac05a3ac626aef8421e378a3f9945068dcf8210045b4cc40fe773"
  "5fa3e7341723c9ab0188ff3d5905a848baae1b0722865d1c39185accdfbdd388"
  "8bb19b3a3c6850d56a3b0f7fdd41f0dbb6ad70af59845905f093bd386f8ab75a"
  "edce9ec9946153d83f5e3c66c127fc7724d3dc7c7ae65a00781e94affc38fd98"
  "1d9f622f91dfa8fceb1700291772f2e2a64dc7d2ccd3c17891d31fa615eb0902"
  "f254fb208e72d105b3cda3635c7a8a6f33a9a9e522d0e79dcaa88d913f792817"
  "3d1788df4a2671fa26cf1d67a9232a65f5303d8a4ae99bf7e6d68860328ea396"
  "7d8a1fd7353d574e1c2384e952335be2c1b3e709db0dae354b8961d8126a4221"
  "35465e5650e08e7b3bfe2d6c6c32d6b9787d3d0eacf6dcf024d1c2d60c6ceb16"
  "c498c18e9c4710da49e702a0fb3874e63f80f8f2640beb6f8cae56785b519010"
  "e43b594c291b68dad5e7c2e7b9f6c34326ecb6beb183e788cfe12f4505bbd639"
  "12011d6715e64e91f1c5bdc4066a16331d9fc6281467b4f23e8d6f89ab5ee59d"
  "6d4d6640ca3121620995ee255945161821218752b551a1a180f4215f7d124d45"
  "60fb1e5d25823fecc7ce1955ce7e886e013118a184df1965d1877ffe6cc171b7"
  "25e0557d5b992d256a6df07466ba3c10587bdf899850b46a31e79b91147e5910"
  "08e67986389a03246d0891715e354778986275c675012947526e8029e7454b32"
  "f509a7d01776dbfa69911297e95dcb8fb94d23c8139d6af90fe72aafa8948628"
  "c2cead3c4c83c82bb6881b83a662cd23049ffa51b9e98bb9f11245d522e99530"
  "4b824dbe4d1c6aee58ae4130f833af6e66861beccdb26fd1708dc1976c0e0588"
  "a6d05e48687483cae216c4ddb417acb54fdf39596cbe4f9030e8a3b169ce5120"
  "c99731bd99bd472562eee9a2ee8a7e4fcc386b5603c92aaa2bc83d80124f4420"
  "f8069cbb0c9679545e52d4080e07b4c2bea049f2571100332c90539490240d76"
  "2c6194d078e7bd884985ee2d9e069e289ffd19004ee08ea5671a29f4f5275dea"
  "346d983f503873811b3a4f72772e5afe4990275526c9e15c1b5cde2ad69a0544"
  "22093c10c6d2e2d646f25dc11b0b7d59e62f2a32e4bfe3b44bd75980c22fc104"
  "377d23a761c72085ff4efc13ec8dd59a6f6d6f7455c0b4eaebf1843198c1e146"
  "bbb6395bed0d59da821e1e2fa8747de46e686167054d8dd264f0e13135643b84"
  "26be7e17133b3298e6ebb653810cdf143ec37199adf80ebf54bcfac81816ccf2"
  "3f4f65e73d7247f8c5888e44a7abb236b1388153b5169975cb6164651bdad03e"
  "407eb61fa5a2c3b57c524e8b842a82e16c87269172e681227e3313c5728cf8e9"
  "a6ab60f1b34c74eb11e986dd62aa817d56d1a094b88e2569bd2e5f100a90a5d1"
  "26719ec8caa919b3bdb3e9a6462e034ab224b8319331e695c2deb26b4a1e4d42"
  "e2cb11fc8ffc44a4448bdb4410023325cb7a0d673d6670478294f55a54375689"
)

prepare() {
  for _file in ${source[*]}; do
    if [[ "${_file}" == *.tar.gz ]] ; then
      _filename=${_file%%.tar.gz*}
      _pkg=${_filename%-*}
      _ver=${_filename##*-}
      
      echo "Configuring ${_pkg}-${_ver}"
      
      cd "${srcdir}/${_pkg}-${_ver}"
      
      if [[ -f "${srcdir}/${_pkg}.patch" ]] ; then
        echo "Patching module ${_pkg}"
        patch -Np1 -i "${srcdir}/${_pkg}.patch"
      fi
      
      if [[ "${_pkg}" == "${pkgname%-all}" ]] ; then
        patch -Np1 -i "${srcdir}/fix-qt5_1x.patch"
        echo "submodules/" >> .gitignore
      elif [[ ${_pkg} == "${pkgname%-desktop-all}-cmake-builder" ]] ; then
        rm -r "${srcdir}/${pkgname%-all}-${pkgver}/submodules/cmake-builder"
        ln -s "${srcdir}/${_pkg}-${_ver}" "${srcdir}/${pkgname%-all}-${pkgver}/submodules/cmake-builder"
      elif [[ ${_pkg} == "webrtc" ]] ; then
        rm -r "${srcdir}/${pkgname%-all}-${pkgver}/submodules/mswebrtc/${_pkg}"
        ln -s "${srcdir}/${_pkg}-${_ver}" "${srcdir}/${pkgname%-all}-${pkgver}/submodules/mswebrtc/${_pkg}"
      elif [[ ${_file} == */external/* ]] ; then
        rm -r "${srcdir}/${pkgname%-all}-${pkgver}/submodules/externals/${_pkg}"
        ln -s "${srcdir}/${_pkg}-${_ver}" "${srcdir}/${pkgname%-all}-${pkgver}/submodules/externals/${_pkg}"
      else
        rm -r "${srcdir}/${pkgname%-all}-${pkgver}/submodules/${_pkg}"
        ln -s "${srcdir}/${_pkg}-${_ver}" "${srcdir}/${pkgname%-all}-${pkgver}/submodules/${_pkg}"
      fi
      
      # Creates a git environment needed to retrieve version in building
      git init >> /dev/null
      git config user.email "dummy@archlinux.org"
      git config user.name "Dummy"
      git add --all
      git commit -m "${_ver}" > /dev/null
      git tag -m "${_ver}" "${_ver}"
      echo ""
    fi
  done
}

build() {
  cd "${srcdir}/${pkgname%-all}-${pkgver}"
  ./prepare.py -c
  ./prepare.py --all-codecs
  make
}

package() {
  cd "${srcdir}/${pkgname%-all}-${pkgver}"

  install -D -m 0644 "${srcdir}/${pkgname%-desktop-all}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-desktop-all}.desktop"
  install -d "${pkgdir}/opt"
  cp -r "OUTPUT/desktop" "${pkgdir}/opt/${pkgname%-all}"
  
  chmod a-x "${pkgdir}/opt/${pkgname%-all}/lib"{,64}/*.a
  rm -r "${pkgdir}/opt/linphone-desktop/share/man"

  install -d "${pkgdir}/usr/share"
  mv "${pkgdir}/opt/${pkgname%-all}/share/icons" "${pkgdir}/usr/share"
}
