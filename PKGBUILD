# Maintainer: SaMaLerO <smlr[at]ukr[dot]net>
# Co-Maintainer: McModder <aur @ modder.pw>
# PLEASE do not mark it out-of date because "2.xx is released", *2.xx a separate project with same name from other dev team*
pkgname=tlauncher
pkgver=1.116.0
pkgrel=1
epoch=1
pkgdesc='TLauncher Legacy is freeware launcher of Minecraft.'
url='https://tlaun.ch'
arch=('any')
license=('GPLv3')
depends=('java-runtime>=8' 'xorg-xrandr')

# try to change repo if default sends 404
_repo="https://tlauncherrepo.com"
# _repo="https://turikhay.ru/tlauncher"
# _repo="https://u.tlauncher.ru"
_librepo='http://u.tlauncher.ru/repo'
# _librepo='http://repo.tlauncher.ru/repo'
# _librepo='http://turikhay.ru/tlauncher/repo'

_bootstrap_checksum='972758e1c5cad62861844a94f2830a14c7e795975108cd3d31de729285c53eb6'
_launcher_checksum='441e0159beb3d45486389bc61eb88838ca440ca5fe37d1b44314cf459facfb21'

source=(#"${_repo}/legacy_beta/bootstrap/${_bootstrap_checksum}.jar"
        # Patched bootstrap to allow launching without RW rights (RO only)
        # Pached by TL dev; if you're having questions you can ask it
        # using support email support[at]tlauncher.ru
        "https://files.modder.pw/mc/tl_bootstrap_1.8.2_patched.jar"
        "${_repo}/legacy_beta/launcher/${_launcher_checksum}.jar"

        "${_librepo}/libraries/org/jdom/jdom/2.0.2/jdom-2.0.2.jar"
        "${_librepo}/libraries/org/tukaani/xz/1.5/xz-1.5.jar"
        "${_librepo}/libraries/org/apache/commons/commons-lang3/3.4/commons-lang3-3.4.jar"
        "${_librepo}/libraries/org/apache/commons/commons-compress/1.10/commons-compress-1.10.jar"
        "${_librepo}/libraries/net/sf/jopt-simple/jopt-simple/4.9/jopt-simple-4.9.jar"
        "${_librepo}/libraries/commons-io/commons-io/2.5/commons-io-2.5.jar"
        "${_librepo}/libraries/com/google/code/gson/gson/2.6.2/gson-2.6.2.jar"
        "${_librepo}/libraries/com/github/zafarkhaja/java-semver/0.9.0/java-semver-0.9.0.jar"
        "${_librepo}/libraries/com/fasterxml/jackson/core/jackson-core/2.7.3/jackson-core-2.7.3.jar"
        "${_librepo}/libraries/org/slf4j/slf4j-api/1.7.21/slf4j-api-1.7.21.jar"
        "${_librepo}/libraries/com/getsentry/raven/raven/7.8.1/raven-7.8.1.jar"
        "${_librepo}/libraries/com/mojang/authlib/1.5.24/authlib-1.5.24.jar"
        "${_librepo}/libraries/com/google/guava/guava/14.0/guava-14.0.jar"
        "${_librepo}/libraries/org/apache/logging/log4j/log4j-api/2.8.1/log4j-api-2.8.1.jar"
        "${_librepo}/libraries/org/apache/logging/log4j/log4j-core/2.8.1/log4j-core-2.8.1.jar"
        "${_librepo}/libraries/ru/turikhay/app/nstweaker/1.0/nstweaker-1.0.jar"
        "${_librepo}/libraries/com/timgroup/java-statsd-client/3.1.0/java-statsd-client-3.1.0.jar"

        'tlauncher.desktop'
        'tlauncher.bash')
noextract=("${source[@]##*/}")
sha256sums=(#"${_bootstrap_checksum}"
            'b713eb25937d7f0a70a5c8dbd29c511c53f710a63cba6d5f824cc9f4cb9d8a93'
            "${_launcher_checksum}"

            '2bdf7a48fddc9259f5aa420eee328e939d71302a6a1b79a176e4fd47ee988b97'
            '86f30fa8775fa3a62cdb39d1ed78a6019164c1058864048d42cbee244e26e840'
            '734c8356420cc8e30c795d64fd1fcd5d44ea9d90342a2cc3262c5158fbc6d98b'
            '807c95293e41e8159477442077da6d0962a7f486d4b980be61f60a8db9cb290f'
            '26c5856e954b5f864db76f13b86919b59c6eecf9fd930b96baa8884626baf2f5'
            'a10418348d234968600ccb1d988efcbbd08716e1d96936ccc1880e7d22513474'
            'b8545ba775f641f8bba86027f06307152279fee89a46a4006df1bf2f874d4d9d'
            '2218c73b40f9af98b570d084420c1b4a81332297bd7fc27ddd552e903be8e93c'
            'f6d5ef0f62dcd9788ec9f7538c352eda7372eeaa3efc3a3f38c9c223d2cced48'
            '1d5aeb6bd98b0fdd151269eae941c05f6468a791ea0f1e68d8e7fe518af3e7df'
            '9f061ad2a82e2018d7b14a62ac3307e294afd7cda9b90714f129c423073735d7'
            '795f783dc6301d10e356d1f3db9952d71692ed8004ffdd843f0049f813a0d1a5'
            'c0127b076e3056f58294e4ae6c01a96599b8f58200345eb6f859192a2d9b2962'
            '1205ab764b1326f7d96d99baa4a4e12614599bf3d735790947748ee116511fa2'
            '815a73e20e90a413662eefe8594414684df3d5723edcd76070e1a5aee864616e'
            '6b4c15577b5256b64c7e3d69dcdbf8d18f17f68ac5928e36936bd6a40a91c218'
            'bbb82aadb5e4209527c15fcc40e514b6f4c921a37bc66b68b3611bec70c538e8'

            'bbb0eaa8d6714cc1e297d351f8e23acc25c08e4ddaf0bdcd0eb2c5a995c3561a'
            '724cd1866b16127d93f34d815a581c6fd30086a1313b7ed303e6cdbc78ea7a51')

package() {
  install -Dm0644 "${srcdir}/tlauncher.desktop" "${pkgdir}/usr/share/applications/tlauncher.desktop"
  install -Dm0755 "${srcdir}/tlauncher.bash" "${pkgdir}/usr/bin/tlauncher"

#  install -Dm0644 "${srcdir}/${_bootstrap_checksum}.jar" "${pkgdir}/opt/tlauncher/bootstrap.jar"
  install -Dm0644 "${srcdir}/tl_bootstrap_1.8.2_patched.jar" "${pkgdir}/opt/tlauncher/bootstrap.jar"
  install -Dm0644 "${srcdir}/${_launcher_checksum}.jar" "${pkgdir}/opt/tlauncher/launcher.jar"

  install -Dm0644 "${srcdir}/jdom-2.0.2.jar" "${pkgdir}/opt/tlauncher/lib/org/jdom/jdom/2.0.2/jdom-2.0.2.jar"
  install -Dm0644 "${srcdir}/xz-1.5.jar" "${pkgdir}/opt/tlauncher/lib/org/tukaani/xz/1.5/xz-1.5.jar"
  install -Dm0644 "${srcdir}/commons-lang3-3.4.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/commons/commons-lang3/3.4/commons-lang3-3.4.jar"
  install -Dm0644 "${srcdir}/commons-compress-1.10.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/commons/commons-compress/1.10/commons-compress-1.10.jar"
  install -Dm0644 "${srcdir}/jopt-simple-4.9.jar" "${pkgdir}/opt/tlauncher/lib/net/sf/jopt-simple/jopt-simple/4.9/jopt-simple-4.9.jar"
  install -Dm0644 "${srcdir}/commons-io-2.5.jar" "${pkgdir}/opt/tlauncher/lib/commons-io/commons-io/2.5/commons-io-2.5.jar"
  install -Dm0644 "${srcdir}/gson-2.6.2.jar" "${pkgdir}/opt/tlauncher/lib/com/google/code/gson/gson/2.6.2/gson-2.6.2.jar"
  install -Dm0644 "${srcdir}/java-semver-0.9.0.jar" "${pkgdir}/opt/tlauncher/lib/com/github/zafarkhaja/java-semver/0.9.0/java-semver-0.9.0.jar"
  install -Dm0644 "${srcdir}/jackson-core-2.7.3.jar" "${pkgdir}/opt/tlauncher/lib/com/fasterxml/jackson/core/jackson-core/2.7.3/jackson-core-2.7.3.jar"
  install -Dm0644 "${srcdir}/slf4j-api-1.7.21.jar" "${pkgdir}/opt/tlauncher/lib/org/slf4j/slf4j-api/1.7.21/slf4j-api-1.7.21.jar"
  install -Dm0644 "${srcdir}/raven-7.8.1.jar" "${pkgdir}/opt/tlauncher/lib/com/getsentry/raven/raven/7.8.1/raven-7.8.1.jar"
  install -Dm0644 "${srcdir}/authlib-1.5.24.jar" "${pkgdir}/opt/tlauncher/lib/com/mojang/authlib/1.5.24/authlib-1.5.24.jar"
  install -Dm0644 "${srcdir}/guava-14.0.jar" "${pkgdir}/opt/tlauncher/lib/com/google/guava/guava/14.0/guava-14.0.jar"
  install -Dm0644 "${srcdir}/log4j-api-2.8.1.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/logging/log4j/log4j-api/2.8.1/log4j-api-2.8.1.jar"
  install -Dm0644 "${srcdir}/log4j-core-2.8.1.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/logging/log4j/log4j-core/2.8.1/log4j-core-2.8.1.jar"
  install -Dm0644 "${srcdir}/nstweaker-1.0.jar" "${pkgdir}/opt/tlauncher/lib/ru/turikhay/app/nstweaker/1.0/nstweaker-1.0.jar"
  install -Dm0644 "${srcdir}/java-statsd-client-3.1.0.jar" "${pkgdir}/opt/tlauncher/lib/com/timgroup/java-statsd-client/3.1.0/java-statsd-client-3.1.0.jar"
}
