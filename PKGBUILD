# Maintainer: McModder <aur @ modder.pw>
# Contributor: SaMaLerO <smlr[at]ukr[dot]net>
# PLEASE do not mark it out-of date because "2.xx is released"
# *2.xx a separate project with same name from other dev team*
pkgname=tlauncher
pkgver=1.127.0
pkgrel=1
epoch=1
pkgdesc='TL (Legacy) is freeware launcher of Minecraft.'
url='https://tlaun.ch'
arch=('any')
license=('custom')
depends=('java-runtime>=8')
optdepends=('xorg-xrandr: Required for some old Minecraft versions')

_branch='aur'
# try to change repo if default sends 404
_repo='https://tlauncherrepo.com'
# _repo='https://cdn.turikhay.ru/tlauncher'
# _repo='https://u.tlauncher.ru' # temporary out of service
# _repo='https://tlaun.ch'

# _librepo='https://tlauncherrepo.com/repo/libraries'
# _librepo='https://tlaun.ch/repo/libraries'
_librepo='https://cdn.turikhay.ru/tlauncher/repo/libraries'
# _librepo='https://tlauncherrepo.com/repo/libraries' # temporay out of service

_maven='https://repo1.maven.org/maven2'
_mojang='https://libraries.minecraft.net'

_bootstrap_version='1.14.0'
_bootstrap_checksum='fb56dc76a1b4d1e44065cc297ea7fcfca805f554e4e22298cb828ddd13c514eb'
_launcher_checksum='15e1e4fdca2aef2203a5b9c3bc2291e60428c6b0c282591afd809d88caff29cc'

source=("tl-bootstrap-${_bootstrap_version}.jar::${_repo}/legacy_beta/bootstrap/${_bootstrap_checksum}.jar"
        "tl-launcher-${pkgver}.jar::${_repo}/${_branch}/launcher/${_launcher_checksum}.jar"

        ${_maven}/com/google/guava/guava/14.0/guava-14.0.jar
        ${_maven}/org/apache/logging/log4j/log4j-core/2.14.0/log4j-core-2.14.0.jar
        ${_maven}/org/apache/logging/log4j/log4j-1.2-api/2.14.0/log4j-1.2-api-2.14.0.jar
        ${_maven}/org/apache/logging/log4j/log4j-api/2.14.0/log4j-api-2.14.0.jar
        ${_maven}/io/sentry/sentry/1.7.30/sentry-1.7.30.jar
        ${_maven}/org/slf4j/slf4j-api/1.7.24/slf4j-api-1.7.24.jar
        ${_maven}/com/fasterxml/jackson/core/jackson-core/2.12.0/jackson-core-2.12.0.jar
        ${_maven}/com/github/zafarkhaja/java-semver/0.9.0/java-semver-0.9.0.jar
        ${_maven}/com/moandjiezana/toml/toml4j/0.7.2/toml4j-0.7.2.jar
        ${_maven}/com/google/code/gson/gson/2.8.7/gson-2.8.7.jar
        ${_maven}/commons-io/commons-io/2.5/commons-io-2.5.jar
        ${_maven}/net/sf/jopt-simple/jopt-simple/4.9/jopt-simple-4.9.jar
        ${_maven}/org/apache/commons/commons-compress/1.10/commons-compress-1.10.jar
        ${_maven}/org/tukaani/xz/1.5/xz-1.5.jar
        ${_maven}/org/jdom/jdom/2.0.2/jdom-2.0.2.jar
        ${_maven}/org/apache/commons/commons-lang3/3.4/commons-lang3-3.4.jar
        ${_maven}/com/timgroup/java-statsd-client/3.1.0/java-statsd-client-3.1.0.jar
        ${_maven}/org/apache/httpcomponents/fluent-hc/4.5.13/fluent-hc-4.5.13.jar
        ${_maven}/org/apache/httpcomponents/httpclient/4.5.13/httpclient-4.5.13.jar
        ${_maven}/org/nanohttpd/nanohttpd/2.3.1/nanohttpd-2.3.1.jar
        ${_librepo}/ru/turikhay/jvd/1.0/jvd-1.0.jar
        ${_maven}/org/apache/httpcomponents/httpcore/4.4.13/httpcore-4.4.13.jar
        ${_maven}/commons-logging/commons-logging/1.2/commons-logging-1.2.jar
        ${_maven}/commons-codec/commons-codec/1.11/commons-codec-1.11.jar
        ${_mojang}/com/mojang/authlib/1.5.24/authlib-1.5.24.jar
        ${_librepo}/ru/turikhay/app/nstweaker/1.0/nstweaker-1.0.jar

        'minecraft.256x256.png'
        'minecraft.192x192.png'
        'minecraft.128x128.png'
        'minecraft.96x96.png'
        'minecraft.64x64.png'
        'minecraft.48x48.png'

        'tlauncher.install'
        'tlauncher.desktop'
        'tlauncher.bash')
noextract=("${source[@]##*/}" "tl-bootstrap-${_bootstrap_version}.jar" "tl-launcher-${pkgver}.jar")
sha256sums=("${_bootstrap_checksum}"
            "${_launcher_checksum}"

            "c0127b076e3056f58294e4ae6c01a96599b8f58200345eb6f859192a2d9b2962"
            "f04ee9c0ac417471d9127b5880b96c3147249f20674a8dbb88e9949d855382a8"
            "75cd0a16cf2da9c2689f49fef8f5adc917e019704049027b96fba53cc0ccbd06"
            "9791ac85aa3cdad633e512192766f84995eddf4db188cc42facec52a0dae15e8"
            "ede7def7507a24e74b501f80ba0cfb82eb5e5745cb493d3ee5720a385bfde1f1"
            "baf3c7fe15fefeaf9e5b000d94547379dc48370f22a8797e239c127e7d7756ec"
            "8acab5ef6e4f332bbb331b3fcd24d716598770d13a47e7215aa5ee625d1fd9c9"
            "2218c73b40f9af98b570d084420c1b4a81332297bd7fc27ddd552e903be8e93c"
            "f5475e63e7e89e5db62223489aec7a56bd303543772077a17c2cb54c19ca3a20"
            "67bd19c510ed227d8a9dc5f67f1b4b2f3426853f5eff02e1d9ea7e95f4923ba0"
            "a10418348d234968600ccb1d988efcbbd08716e1d96936ccc1880e7d22513474"
            "26c5856e954b5f864db76f13b86919b59c6eecf9fd930b96baa8884626baf2f5"
            "807c95293e41e8159477442077da6d0962a7f486d4b980be61f60a8db9cb290f"
            "86f30fa8775fa3a62cdb39d1ed78a6019164c1058864048d42cbee244e26e840"
            "2bdf7a48fddc9259f5aa420eee328e939d71302a6a1b79a176e4fd47ee988b97"
            "734c8356420cc8e30c795d64fd1fcd5d44ea9d90342a2cc3262c5158fbc6d98b"
            "bbb82aadb5e4209527c15fcc40e514b6f4c921a37bc66b68b3611bec70c538e8"
            "f883b6b027d5e05c53e48e4fe3548715c52dbd590ffa3f52d039574f1a4d0728"
            "6fe9026a566c6a5001608cf3fc32196641f6c1e5e1986d1037ccdbd5f31ef743"
            "de864c47818157141a24c9acb36df0c47d7bf15b7ff48c90610f3eb4e5df0e58"
            "3b91f9627f55f3e24974ddeeb039b08f634d1481c98f14016d0bd50d0f97bb56"
            "e06e89d40943245fcfa39ec537cdbfce3762aecde8f9c597780d2b00c2b43424"
            "daddea1ea0be0f56978ab3006b8ac92834afeefbd9b7e4e6316fca57df0fa636"
            "e599d5318e97aa48f42136a2927e6dfa4e8881dff0e6c8e3109ddbbff51d7b7d"
            "795f783dc6301d10e356d1f3db9952d71692ed8004ffdd843f0049f813a0d1a5"
            "6b4c15577b5256b64c7e3d69dcdbf8d18f17f68ac5928e36936bd6a40a91c218"

            '23909ccb5a61f607f355743cdf553799e033fcaac16538b27f1cb0a80aa7faa3'
            '1d5c9f54a06e6a803c6e69093e3cf429c8a9092b94f61ac693993f3f6c1261a7'
            '68226a8230f1187cf2fa81ad63590b195e5c58d918ada16f52b9bdca59e57fd9'
            '328e0bc94661b68fd74c414f4d37ec82d2a3b86a1991eed7132180b15c23fe10'
            'd6da12b649df178826399a31e8f0f72be7428f90b5a3a95b7538cec0a58a4755'
            'beba733d11b80113007683cf61b122c4e1524c424f963960b08b74bf77d378e4'

            'f3e8a4c48ac696475b8035e915170962bf2d1b9fbe09980665ec8170f3f26612'
            'bbb0eaa8d6714cc1e297d351f8e23acc25c08e4ddaf0bdcd0eb2c5a995c3561a'
            '0b31e2afee3a709c74daa0df9345d15c01ea361f8beee26e6cfac2a3b518aa23')
install='tlauncher.install'

package() {
  # install launch script and .desktop file
  install -Dm0644 "${srcdir}/tlauncher.desktop" "${pkgdir}/usr/share/applications/tlauncher.desktop"
  install -Dm0755 "${srcdir}/tlauncher.bash" "${pkgdir}/usr/bin/tlauncher"

  # install icons
  for size in 256x256 192x192 128x128 96x96 64x64 48x48; do
    install -Dm0644 "${srcdir}/minecraft.${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/minecraft.png"
  done

  # install launcher
  install -Dm0644 "${srcdir}/tl-bootstrap-${_bootstrap_version}.jar" "${pkgdir}/opt/tlauncher/bootstrap.jar"
  install -Dm0644 "${srcdir}/tl-launcher-${pkgver}.jar" "${pkgdir}/opt/tlauncher/launcher.jar"

  # install launcher libraries
  install -Dm0644 "${srcdir}/guava-14.0.jar" "${pkgdir}/opt/tlauncher/lib/com/google/guava/guava/14.0/guava-14.0.jar"
  install -Dm0644 "${srcdir}/log4j-core-2.14.0.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/logging/log4j/log4j-core/2.14.0/log4j-core-2.14.0.jar"
  install -Dm0644 "${srcdir}/log4j-1.2-api-2.14.0.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/logging/log4j/log4j-1.2-api/2.14.0/log4j-1.2-api-2.14.0.jar"
  install -Dm0644 "${srcdir}/log4j-api-2.14.0.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/logging/log4j/log4j-api/2.14.0/log4j-api-2.14.0.jar"
  install -Dm0644 "${srcdir}/sentry-1.7.30.jar" "${pkgdir}/opt/tlauncher/lib/io/sentry/sentry/1.7.30/sentry-1.7.30.jar"
  install -Dm0644 "${srcdir}/slf4j-api-1.7.24.jar" "${pkgdir}/opt/tlauncher/lib/org/slf4j/slf4j-api/1.7.24/slf4j-api-1.7.24.jar"
  install -Dm0644 "${srcdir}/jackson-core-2.12.0.jar" "${pkgdir}/opt/tlauncher/lib/com/fasterxml/jackson/core/jackson-core/2.12.0/jackson-core-2.12.0.jar"
  install -Dm0644 "${srcdir}/java-semver-0.9.0.jar" "${pkgdir}/opt/tlauncher/lib/com/github/zafarkhaja/java-semver/0.9.0/java-semver-0.9.0.jar"
  install -Dm0644 "${srcdir}/toml4j-0.7.2.jar" "${pkgdir}/opt/tlauncher/lib/com/moandjiezana/toml/toml4j/0.7.2/toml4j-0.7.2.jar"
  install -Dm0644 "${srcdir}/gson-2.8.7.jar" "${pkgdir}/opt/tlauncher/lib/com/google/code/gson/gson/2.8.7/gson-2.8.7.jar"
  install -Dm0644 "${srcdir}/commons-io-2.5.jar" "${pkgdir}/opt/tlauncher/lib/commons-io/commons-io/2.5/commons-io-2.5.jar"
  install -Dm0644 "${srcdir}/jopt-simple-4.9.jar" "${pkgdir}/opt/tlauncher/lib/net/sf/jopt-simple/jopt-simple/4.9/jopt-simple-4.9.jar"
  install -Dm0644 "${srcdir}/commons-compress-1.10.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/commons/commons-compress/1.10/commons-compress-1.10.jar"
  install -Dm0644 "${srcdir}/xz-1.5.jar" "${pkgdir}/opt/tlauncher/lib/org/tukaani/xz/1.5/xz-1.5.jar"
  install -Dm0644 "${srcdir}/jdom-2.0.2.jar" "${pkgdir}/opt/tlauncher/lib/org/jdom/jdom/2.0.2/jdom-2.0.2.jar"
  install -Dm0644 "${srcdir}/commons-lang3-3.4.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/commons/commons-lang3/3.4/commons-lang3-3.4.jar"
  install -Dm0644 "${srcdir}/java-statsd-client-3.1.0.jar" "${pkgdir}/opt/tlauncher/lib/com/timgroup/java-statsd-client/3.1.0/java-statsd-client-3.1.0.jar"
  install -Dm0644 "${srcdir}/fluent-hc-4.5.13.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/httpcomponents/fluent-hc/4.5.13/fluent-hc-4.5.13.jar"
  install -Dm0644 "${srcdir}/httpclient-4.5.13.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/httpcomponents/httpclient/4.5.13/httpclient-4.5.13.jar"
  install -Dm0644 "${srcdir}/nanohttpd-2.3.1.jar" "${pkgdir}/opt/tlauncher/lib/org/nanohttpd/nanohttpd/2.3.1/nanohttpd-2.3.1.jar"
  install -Dm0644 "${srcdir}/jvd-1.0.jar" "${pkgdir}/opt/tlauncher/lib/ru/turikhay/jvd/1.0/jvd-1.0.jar"
  install -Dm0644 "${srcdir}/httpcore-4.4.13.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/httpcomponents/httpcore/4.4.13/httpcore-4.4.13.jar"
  install -Dm0644 "${srcdir}/commons-logging-1.2.jar" "${pkgdir}/opt/tlauncher/lib/commons-logging/commons-logging/1.2/commons-logging-1.2.jar"
  install -Dm0644 "${srcdir}/commons-codec-1.11.jar" "${pkgdir}/opt/tlauncher/lib/commons-codec/commons-codec/1.11/commons-codec-1.11.jar"
  install -Dm0644 "${srcdir}/authlib-1.5.24.jar" "${pkgdir}/opt/tlauncher/lib/com/mojang/authlib/1.5.24/authlib-1.5.24.jar"
  install -Dm0644 "${srcdir}/nstweaker-1.0.jar" "${pkgdir}/opt/tlauncher/lib/ru/turikhay/app/nstweaker/1.0/nstweaker-1.0.jar"
}
