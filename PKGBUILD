# Maintainer: McModder <aur @ modder.pw>
# Contributor: SaMaLerO <smlr[at]ukr[dot]net>
# PLEASE do not mark it out-of date because "2.xx is released"
# *2.xx a separate project with same name from other dev team*
pkgname='tlauncher'
pkgver='1.155.2'
pkgrel=1
epoch=1
pkgdesc='Freeware Minecraft launcher'
url='https://tlaun.ch'
arch=('any')
license=('custom')
depends=('java-runtime>=8')
optdepends=(
  'xorg-xrandr: Required for some old Minecraft versions'
  'switcheroo-control: GPU selector'
  'gamemode: Optimizing game performance'
)

#_bootstrap_version='1.31.0'
#_bootstrap_checksum='6ef79fe59f385874e099aa0ae07718d2e8d765f76c69b2f6d3dc44851103c373'
#_launcher_version='1.155.2'
#_launcher_checksum='9a5bb1ea2bdffe157b7c821238649aafb1cf6ee62f9907282cef1e3049c55049'

_repo='https://tlaun.ch/repo'
# Try one of these if the above one fails:
#_repo='https://cdn.turikhay.ru/tln4/repo'
#_repo='https://tlaun.ch/repo'
#_repo='https://eu01-www.tlaun.ch/repo'
#_repo='https://eu02-www.tlaun.ch/repo'
#_repo='https://eu03-www.tlaun.ch/repo'
#_repo='https://ru01-www.tlaun.ch/repo'
#_repo='https://ru02-www.tlaun.ch/repo'
#_repo='https://ru03-www.tlaun.ch/repo'
#_repo='https://tln4.ru/repo'
#_repo='https://eu01-www.tln4.ru/repo'
#_repo='https://eu02-www.tln4.ru/repo'
#_repo='https://eu03-www.tln4.ru/repo'
#_repo='https://ru01-www.tln4.ru/repo'
#_repo='https://ru02-www.tln4.ru/repo'
#_repo='https://ru03-www.tln4.ru/repo'
#_repo='https://4nlt.com/repo'
#_repo='https://eu01-www.4nlt.com/repo'
#_repo='https://eu02-www.4nlt.com/repo'
#_repo='https://eu03-www.4nlt.com/repo'
#_repo='https://ru01-www.4nlt.com/repo'
#_repo='https://ru02-www.4nlt.com/repo'
#_repo='https://ru03-www.4nlt.com/repo'

source=(
  # Bootstrap
  "tl-bootstrap-1.31.0-6ef79fe5.jar::${_repo}/update/aur/bootstrap/6ef79fe59f385874e099aa0ae07718d2e8d765f76c69b2f6d3dc44851103c373.jar"

  # Launcher
  "tl-launcher-1.155.2-9a5bb1ea.jar::${_repo}/update/aur/launcher/9a5bb1ea2bdffe157b7c821238649aafb1cf6ee62f9907282cef1e3049c55049.jar"

  # Libraries
  "${_repo}/libraries/com/mojang/authlib/1.5.24/authlib-1.5.24.jar"
  "${_repo}/libraries/org/apache/httpcomponents/fluent-hc/4.5.13/fluent-hc-4.5.13.jar"
  "${_repo}/libraries/org/apache/httpcomponents/httpclient/4.5.13/httpclient-4.5.13.jar"
  "${_repo}/libraries/org/apache/logging/log4j/log4j-core/2.19.0/log4j-core-2.19.0.jar"
  "${_repo}/libraries/org/apache/logging/log4j/log4j-1.2-api/2.19.0/log4j-1.2-api-2.19.0.jar"
  "${_repo}/libraries/org/apache/logging/log4j/log4j-slf4j2-impl/2.19.0/log4j-slf4j2-impl-2.19.0.jar"
  "${_repo}/libraries/org/apache/logging/log4j/log4j-api/2.19.0/log4j-api-2.19.0.jar"
  "${_repo}/libraries/org/apache/commons/commons-compress/1.21/commons-compress-1.21.jar"
  "${_repo}/libraries/commons-io/commons-io/2.11.0/commons-io-2.11.0.jar"
  "${_repo}/libraries/org/apache/commons/commons-lang3/3.12.0/commons-lang3-3.12.0.jar"
  "${_repo}/libraries/com/moandjiezana/toml/toml4j/0.7.2/toml4j-0.7.2.jar"
  "${_repo}/libraries/com/google/code/gson/gson/2.8.9/gson-2.8.9.jar"
  "${_repo}/libraries/com/google/guava/guava/31.0.1-jre/guava-31.0.1-jre.jar"
  "${_repo}/libraries/io/sentry/sentry/1.7.30/sentry-1.7.30.jar"
  "${_repo}/libraries/com/fasterxml/jackson/core/jackson-core/2.13.0/jackson-core-2.13.0.jar"
  "${_repo}/libraries/com/github/zafarkhaja/java-semver/0.9.0/java-semver-0.9.0.jar"
  "${_repo}/libraries/com/timgroup/java-statsd-client/3.1.0/java-statsd-client-3.1.0.jar"
  "${_repo}/libraries/org/jdom/jdom/2.0.2/jdom-2.0.2.jar"
  "${_repo}/libraries/net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar"
  "${_repo}/libraries/ru/turikhay/jvd/1.0/jvd-1.0.jar"
  "${_repo}/libraries/org/nanohttpd/nanohttpd/2.3.1/nanohttpd-2.3.1.jar"
  "${_repo}/libraries/ru/turikhay/app/nstweaker/1.0/nstweaker-1.0.jar"
  "${_repo}/libraries/org/slf4j/slf4j-api/2.0.1/slf4j-api-2.0.1.jar"
  "${_repo}/libraries/org/tukaani/xz/1.9/xz-1.9.jar"
  "${_repo}/libraries/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar"
  "${_repo}/libraries/commons-codec/commons-codec/1.11/commons-codec-1.11.jar"
  "${_repo}/libraries/org/apache/httpcomponents/httpcore/4.4.13/httpcore-4.4.13.jar"
  "${_repo}/libraries/commons-logging/commons-logging/1.2/commons-logging-1.2.jar"
  "${_repo}/libraries/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar"
  "${_repo}/libraries/com/google/guava/listenablefuture/9999.0-empty-to-avoid-conflict-with-guava/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar"
  "${_repo}/libraries/org/checkerframework/checker-qual/3.12.0/checker-qual-3.12.0.jar"
  "${_repo}/libraries/com/google/errorprone/error_prone_annotations/2.7.1/error_prone_annotations-2.7.1.jar"
  "${_repo}/libraries/com/google/j2objc/j2objc-annotations/1.3/j2objc-annotations-1.3.jar"

  # Other resources
  minecraft.128x128.png
  minecraft.192x192.png
  minecraft.256x256.png
  minecraft.48x48.png
  minecraft.64x64.png
  minecraft.96x96.png
  tlauncher.bash
  tlauncher.desktop
)

noextract=(
  "${source[@]##*/}"
  "tl-bootstrap-1.31.0-6ef79fe5.jar"
  "tl-launcher-1.155.2-9a5bb1ea.jar"
)

sha256sums=(
  '6ef79fe59f385874e099aa0ae07718d2e8d765f76c69b2f6d3dc44851103c373' # tl-bootstrap-1.31.0-6ef79fe5.jar

  '9a5bb1ea2bdffe157b7c821238649aafb1cf6ee62f9907282cef1e3049c55049' # tl-launcher-1.155.2-9a5bb1ea.jar

  '795f783dc6301d10e356d1f3db9952d71692ed8004ffdd843f0049f813a0d1a5' # com.mojang:authlib:1.5.24
  'f883b6b027d5e05c53e48e4fe3548715c52dbd590ffa3f52d039574f1a4d0728' # org.apache.httpcomponents:fluent-hc:4.5.13
  '6fe9026a566c6a5001608cf3fc32196641f6c1e5e1986d1037ccdbd5f31ef743' # org.apache.httpcomponents:httpclient:4.5.13
  'b4a1796fab7bfc36df015c1b4052459147997e8d215a7199d71d05f9e747e4f4' # org.apache.logging.log4j:log4j-core:2.19.0
  '60480a6c81978a9871099e002997df84a05fc11789fb248e3e803a0dcb19e0cd' # org.apache.logging.log4j:log4j-1.2-api:2.19.0
  '825605eacb2d5605b105c53d4108c18125e0f82f62960d0be583278b9c524f3c' # org.apache.logging.log4j:log4j-slf4j2-impl:2.19.0
  '5ccb24ad9f92e768d0bc456d3061a737951262df803e004d2cad096b75a88d60' # org.apache.logging.log4j:log4j-api:2.19.0
  '6aecfd5459728a595601cfa07258d131972ffc39b492eb48bdd596577a2f244a' # org.apache.commons:commons-compress:1.21
  '961b2f6d87dbacc5d54abf45ab7a6e2495f89b75598962d8c723cea9bc210908' # commons-io:commons-io:2.11.0
  'd919d904486c037f8d193412da0c92e22a9fa24230b9d67a57855c5c31c7e94e' # org.apache.commons:commons-lang3:3.12.0
  'f5475e63e7e89e5db62223489aec7a56bd303543772077a17c2cb54c19ca3a20' # com.moandjiezana.toml:toml4j:0.7.2
  'd3999291855de495c94c743761b8ab5176cfeabe281a5ab0d8e8d45326fd703e' # com.google.code.gson:gson:2.8.9
  'd5be94d65e87bd219fb3193ad1517baa55a3b88fc91d21cf735826ab5af087b9' # com.google.guava:guava:31.0.1-jre
  'ede7def7507a24e74b501f80ba0cfb82eb5e5745cb493d3ee5720a385bfde1f1' # io.sentry:sentry:1.7.30
  '348bc59b348df2e807b356f1d62d2afb41a974073328abc773eb0932b855d2c8' # com.fasterxml.jackson.core:jackson-core:2.13.0
  '2218c73b40f9af98b570d084420c1b4a81332297bd7fc27ddd552e903be8e93c' # com.github.zafarkhaja:java-semver:0.9.0
  'bbb82aadb5e4209527c15fcc40e514b6f4c921a37bc66b68b3611bec70c538e8' # com.timgroup:java-statsd-client:3.1.0
  '2bdf7a48fddc9259f5aa420eee328e939d71302a6a1b79a176e4fd47ee988b97' # org.jdom:jdom:2.0.2
  'df26cc58f235f477db07f753ba5a3ab243ebe5789d9f89ecf68dd62ea9a66c28' # net.sf.jopt-simple:jopt-simple:5.0.4
  '3b91f9627f55f3e24974ddeeb039b08f634d1481c98f14016d0bd50d0f97bb56' # ru.turikhay:jvd:1.0
  'de864c47818157141a24c9acb36df0c47d7bf15b7ff48c90610f3eb4e5df0e58' # org.nanohttpd:nanohttpd:2.3.1
  '6b4c15577b5256b64c7e3d69dcdbf8d18f17f68ac5928e36936bd6a40a91c218' # ru.turikhay.app:nstweaker:1.0
  'b36b99b8d99ea7857554d9b25dfdbd1fb25378c926f7b9e0249983c99335b2c4' # org.slf4j:slf4j-api:2.0.1
  '211b306cfc44f8f96df3a0a3ddaf75ba8c5289eed77d60d72f889bb855f535e5' # org.tukaani:xz:1.9
  '766ad2a0783f2687962c8ad74ceecc38a28b9f72a2d085ee438b7813e928d0c7' # com.google.code.findbugs:jsr305:3.0.2
  'e599d5318e97aa48f42136a2927e6dfa4e8881dff0e6c8e3109ddbbff51d7b7d' # commons-codec:commons-codec:1.11
  'e06e89d40943245fcfa39ec537cdbfce3762aecde8f9c597780d2b00c2b43424' # org.apache.httpcomponents:httpcore:4.4.13
  'daddea1ea0be0f56978ab3006b8ac92834afeefbd9b7e4e6316fca57df0fa636' # commons-logging:commons-logging:1.2
  'a171ee4c734dd2da837e4b16be9df4661afab72a41adaf31eb84dfdaf936ca26' # com.google.guava:failureaccess:1.0.1
  'b372a037d4230aa57fbeffdef30fd6123f9c0c2db85d0aced00c91b974f33f99' # com.google.guava:listenablefuture:9999.0-empty-to-avoid-conflict-with-guava
  'ff10785ac2a357ec5de9c293cb982a2cbb605c0309ea4cc1cb9b9bc6dbe7f3cb' # org.checkerframework:checker-qual:3.12.0
  'cd5257c08a246cf8628817ae71cb822be192ef91f6881ca4a3fcff4f1de1cff3' # com.google.errorprone:error_prone_annotations:2.7.1
  '21af30c92267bd6122c0e0b4d20cccb6641a37eaf956c6540ec471d584e64a7b' # com.google.j2objc:j2objc-annotations:1.3
  '68226a8230f1187cf2fa81ad63590b195e5c58d918ada16f52b9bdca59e57fd9' # minecraft.128x128.png
  '1d5c9f54a06e6a803c6e69093e3cf429c8a9092b94f61ac693993f3f6c1261a7' # minecraft.192x192.png
  '23909ccb5a61f607f355743cdf553799e033fcaac16538b27f1cb0a80aa7faa3' # minecraft.256x256.png
  'beba733d11b80113007683cf61b122c4e1524c424f963960b08b74bf77d378e4' # minecraft.48x48.png
  'd6da12b649df178826399a31e8f0f72be7428f90b5a3a95b7538cec0a58a4755' # minecraft.64x64.png
  '328e0bc94661b68fd74c414f4d37ec82d2a3b86a1991eed7132180b15c23fe10' # minecraft.96x96.png
  '70965493603a055630906eab46d8f11df32760b2f3ed8a8eefc2dfa5a1912f00' # tlauncher.bash
  'd8c7b15306bbb620e22ae0ee59a350ab36e63c28b52bce012ab312522ef6dab6' # tlauncher.desktop
)

package() {
  # install launch script and .desktop file
  install -Dm0644 "${srcdir}/tlauncher.desktop" "${pkgdir}/usr/share/applications/tlauncher.desktop"
  install -Dm0755 "${srcdir}/tlauncher.bash" "${pkgdir}/usr/bin/tlauncher"

  # install icons
  for size in 256x256 192x192 128x128 96x96 64x64 48x48; do
    install -Dm0644 "${srcdir}/minecraft.${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/minecraft.png"
  done

  # install launcher
  install -Dm0644 "${srcdir}/tl-bootstrap-1.31.0-6ef79fe5.jar" "${pkgdir}/opt/tlauncher/bootstrap.jar"
  install -Dm0644 "${srcdir}/tl-launcher-1.155.2-9a5bb1ea.jar" "${pkgdir}/opt/tlauncher/launcher.jar"

  # install libraries
  install -Dm0644 "${srcdir}/authlib-1.5.24.jar" "${pkgdir}/opt/tlauncher/lib/com/mojang/authlib/1.5.24/authlib-1.5.24.jar"
  install -Dm0644 "${srcdir}/fluent-hc-4.5.13.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/httpcomponents/fluent-hc/4.5.13/fluent-hc-4.5.13.jar"
  install -Dm0644 "${srcdir}/httpclient-4.5.13.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/httpcomponents/httpclient/4.5.13/httpclient-4.5.13.jar"
  install -Dm0644 "${srcdir}/log4j-core-2.19.0.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/logging/log4j/log4j-core/2.19.0/log4j-core-2.19.0.jar"
  install -Dm0644 "${srcdir}/log4j-1.2-api-2.19.0.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/logging/log4j/log4j-1.2-api/2.19.0/log4j-1.2-api-2.19.0.jar"
  install -Dm0644 "${srcdir}/log4j-slf4j2-impl-2.19.0.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/logging/log4j/log4j-slf4j2-impl/2.19.0/log4j-slf4j2-impl-2.19.0.jar"
  install -Dm0644 "${srcdir}/log4j-api-2.19.0.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/logging/log4j/log4j-api/2.19.0/log4j-api-2.19.0.jar"
  install -Dm0644 "${srcdir}/commons-compress-1.21.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/commons/commons-compress/1.21/commons-compress-1.21.jar"
  install -Dm0644 "${srcdir}/commons-io-2.11.0.jar" "${pkgdir}/opt/tlauncher/lib/commons-io/commons-io/2.11.0/commons-io-2.11.0.jar"
  install -Dm0644 "${srcdir}/commons-lang3-3.12.0.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/commons/commons-lang3/3.12.0/commons-lang3-3.12.0.jar"
  install -Dm0644 "${srcdir}/toml4j-0.7.2.jar" "${pkgdir}/opt/tlauncher/lib/com/moandjiezana/toml/toml4j/0.7.2/toml4j-0.7.2.jar"
  install -Dm0644 "${srcdir}/gson-2.8.9.jar" "${pkgdir}/opt/tlauncher/lib/com/google/code/gson/gson/2.8.9/gson-2.8.9.jar"
  install -Dm0644 "${srcdir}/guava-31.0.1-jre.jar" "${pkgdir}/opt/tlauncher/lib/com/google/guava/guava/31.0.1-jre/guava-31.0.1-jre.jar"
  install -Dm0644 "${srcdir}/sentry-1.7.30.jar" "${pkgdir}/opt/tlauncher/lib/io/sentry/sentry/1.7.30/sentry-1.7.30.jar"
  install -Dm0644 "${srcdir}/jackson-core-2.13.0.jar" "${pkgdir}/opt/tlauncher/lib/com/fasterxml/jackson/core/jackson-core/2.13.0/jackson-core-2.13.0.jar"
  install -Dm0644 "${srcdir}/java-semver-0.9.0.jar" "${pkgdir}/opt/tlauncher/lib/com/github/zafarkhaja/java-semver/0.9.0/java-semver-0.9.0.jar"
  install -Dm0644 "${srcdir}/java-statsd-client-3.1.0.jar" "${pkgdir}/opt/tlauncher/lib/com/timgroup/java-statsd-client/3.1.0/java-statsd-client-3.1.0.jar"
  install -Dm0644 "${srcdir}/jdom-2.0.2.jar" "${pkgdir}/opt/tlauncher/lib/org/jdom/jdom/2.0.2/jdom-2.0.2.jar"
  install -Dm0644 "${srcdir}/jopt-simple-5.0.4.jar" "${pkgdir}/opt/tlauncher/lib/net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar"
  install -Dm0644 "${srcdir}/jvd-1.0.jar" "${pkgdir}/opt/tlauncher/lib/ru/turikhay/jvd/1.0/jvd-1.0.jar"
  install -Dm0644 "${srcdir}/nanohttpd-2.3.1.jar" "${pkgdir}/opt/tlauncher/lib/org/nanohttpd/nanohttpd/2.3.1/nanohttpd-2.3.1.jar"
  install -Dm0644 "${srcdir}/nstweaker-1.0.jar" "${pkgdir}/opt/tlauncher/lib/ru/turikhay/app/nstweaker/1.0/nstweaker-1.0.jar"
  install -Dm0644 "${srcdir}/slf4j-api-2.0.1.jar" "${pkgdir}/opt/tlauncher/lib/org/slf4j/slf4j-api/2.0.1/slf4j-api-2.0.1.jar"
  install -Dm0644 "${srcdir}/xz-1.9.jar" "${pkgdir}/opt/tlauncher/lib/org/tukaani/xz/1.9/xz-1.9.jar"
  install -Dm0644 "${srcdir}/jsr305-3.0.2.jar" "${pkgdir}/opt/tlauncher/lib/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar"
  install -Dm0644 "${srcdir}/commons-codec-1.11.jar" "${pkgdir}/opt/tlauncher/lib/commons-codec/commons-codec/1.11/commons-codec-1.11.jar"
  install -Dm0644 "${srcdir}/httpcore-4.4.13.jar" "${pkgdir}/opt/tlauncher/lib/org/apache/httpcomponents/httpcore/4.4.13/httpcore-4.4.13.jar"
  install -Dm0644 "${srcdir}/commons-logging-1.2.jar" "${pkgdir}/opt/tlauncher/lib/commons-logging/commons-logging/1.2/commons-logging-1.2.jar"
  install -Dm0644 "${srcdir}/failureaccess-1.0.1.jar" "${pkgdir}/opt/tlauncher/lib/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar"
  install -Dm0644 "${srcdir}/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar" "${pkgdir}/opt/tlauncher/lib/com/google/guava/listenablefuture/9999.0-empty-to-avoid-conflict-with-guava/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar"
  install -Dm0644 "${srcdir}/checker-qual-3.12.0.jar" "${pkgdir}/opt/tlauncher/lib/org/checkerframework/checker-qual/3.12.0/checker-qual-3.12.0.jar"
  install -Dm0644 "${srcdir}/error_prone_annotations-2.7.1.jar" "${pkgdir}/opt/tlauncher/lib/com/google/errorprone/error_prone_annotations/2.7.1/error_prone_annotations-2.7.1.jar"
  install -Dm0644 "${srcdir}/j2objc-annotations-1.3.jar" "${pkgdir}/opt/tlauncher/lib/com/google/j2objc/j2objc-annotations/1.3/j2objc-annotations-1.3.jar"
}
