# Maintainer: WithTheBraid <the-one@with-the-braid.cf>

pkgname=android-sdk-debian
pkgver=28.0.2+1
pkgrel=0
pkgdesc="Software development kit for Android platform - built out of Debian's repository"
arch=("x86_64" "aarch64")
url="https://salsa.debian.org/android-tools-team/android-sdk-meta"
license=("Apache" "BSD" "SSLeay" "ISC" "GPL3" "MIT" "OpenSSL" "Khronos" "Expat" "PD" "LGPL")
depends=("android-tools" "android-udev" "java-environment" "proguard")
optdepends=("gradle" "maven")
provides=("android-sdk" "anroid-build-tools" "aapt" "apksign" "zipalign" "aidl" "split-select" "devlink")
conflicts=("adroid-sdk" "android-sdk-build-tools")
makedepends=("binutils" "tar")
backup=("opt/${pkgname}/packages/${pkgname}_test/pubspec.yaml" "opt/${pkgname}/packages/${pkgname}/pubspec.yaml")
source_x86_64=(
  "http://ftp.de.debian.org/debian/pool/main/a/android-sdk-meta/android-sdk_28.0.2+7_amd64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-sdk-meta/android-sdk-build-tools_29.0.3+7_amd64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-frameworks-base/aapt_10.0.0+r36-9_amd64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-frameworks-base/android-libaapt_10.0.0+r36-9_amd64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-frameworks-base/android-libandroidfw_10.0.0+r36-9_amd64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools/android-libbase_29.0.6-21_amd64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools/android-liblog_29.0.6-21_amd64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools/android-libutils_29.0.6-21_amd64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools/android-libbacktrace_29.0.6-21_amd64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools/android-libcutils_29.0.6-21_amd64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools/android-libziparchive_29.0.6-21_amd64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-system-tools-aidl/aidl_10.0.0+r36-4+b1_amd64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools-apksig/libapksig-java_31.0.2-1_all.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-frameworks-base/split-select_10.0.0+r36-9_amd64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-build/zipalign_10.0.0+r36-1_amd64.deb"
)
source_aarch64=(
  "http://ftp.de.debian.org/debian/pool/main/a/android-sdk-meta/android-sdk_28.0.2+7_arm64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-sdk-meta/android-sdk-build-tools_29.0.3+7_arm64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-frameworks-base/aapt_10.0.0+r36-9_arm64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-frameworks-base/android-libaapt_10.0.0+r36-9_arm64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-frameworks-base/android-libandroidfw_10.0.0+r36-9_arm64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools/android-libbase_29.0.6-21_arm64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools/android-liblog_29.0.6-21_arm64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools/android-libutils_29.0.6-21_arm64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools/android-libbacktrace_29.0.6-21_arm64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools/android-libcutils_29.0.6-21_arm64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools/android-libziparchive_29.0.6-21_arm64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-system-tools-aidl/aidl_10.0.0+r36-4_arm64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools-apksig/apksigner_31.0.2-1_all.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-frameworks-base/split-select_10.0.0+r36-9_arm64.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-build/zipalign_10.0.0+r36-1_arm64.deb"
)
source=(
  "http://ftp.de.debian.org/debian/pool/main/a/android-sdk-meta/android-sdk-build-tools-common_29.0.3+7_all.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-tools-apksig/libapksig-java_31.0.2-1_all.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-platform-dalvik/dalvik-exchange_10.0.0+r36-4_all.deb"
  "http://ftp.de.debian.org/debian/pool/main/a/android-sdk-meta/android-sdk-common_28.0.2+7_all.deb"
)

sha256sums=('d35e7778a378e3789fab66c258be78282617643254eb906d819c2107a054fb98'
            'cfb1babb843de0c7490c4554dca31187ceb326ea7f53c9cd77e9ce46342cba59'
            '2c07f5c646fd89841a7a28ff38a2e214395cc3aa1499617f4f27eb59059d5555'
            'd0d0818dfa4f470de76443895b064d4fb7813dbc46b9de6a1a3b32f3bf36c48e')
sha256sums_x86_64=('c11a2fe636fc98a90c1899fc4a5492f37156658ce681d2f3f7b2ede9bfe65e9d'
                   '685ea9f7af652fd1277e1a1ce30286cf8e3f13921a213dfbff46a96ea193df87'
                   '001c22ddcd691b8f7df8e6babbf0196fa116ad9d9875b566bfcb973728cdd05d'
                   '4cf0abb89e496d72651ced8a1da4484e4890183a82ceeb07c8e8b571417c7b80'
                   '3aac0848e7a3d6a9b54464cb745db26b1afe1d3e1649e032c6de6c47a05feed8'
                   '854a7d37309d1673f166034e821e6fba6830bfa81656566d181132c6477c1d16'
                   'ec7d2160ae3a1f404183b044c39f147d1949ab72da5914977c9a21df105b6a4f'
                   '669e2e4de76b56628ef2e10196a4c2801fe283feb7aa3036ad45bea26cb6b382'
                   'ef8addb5c187e2a24f33005d0b5b68944389466454f4f8b4d5a22f9aa391c3ae'
                   '535a1b9a1dbb26bb60e5b9fc035a8b470963ae4036e04cddc15885d23574f56f'
                   '23e1e8f41ab3f1629df38bc04e1f37f009ab60c912489e8ed03a3714aaf2aa14'
                   '9b465434f6b67f1359f44a74f57bc91633a125a60ae16fdab7943ee3bd5c7948'
                   'cfb1babb843de0c7490c4554dca31187ceb326ea7f53c9cd77e9ce46342cba59'
                   'cf18eb7f54dcd864818ffbcb68ac5c3de02bd9ab2a7d38375df3030c61d40ce2'
                   '522d9efffbd2602a508530e58c8e2f21b1fb2598c7986350e41906d439e4758c')
sha256sums_aarch64=('167c3078cdc7636fd092c180816547193ef1e2a5adc08849092a985d2ab9ff0f'
                    '0d097f2157799abcacab3f44046d67482c87d4577f7cfcfb1971d3cbf31fa18f'
                    '90b8413f5cd86456dbe089ade4e6845a9ecbae9f24f940e6f18ec4c9f2054ff1'
                    '64c357221635be5c61d4d7c22e05a95f602b75d6d6c736d2bf8c02bbc30cb8ba'
                    'a064f3201d2c78070a3a06fa4f459ac58cfa7c2ed96f13e81c27e0eade4f7244'
                    'ff4b833a1c8237117025f340414181b982397abbd8b60fa3e0970a870d7ef6c0'
                    'ca62e568fa3eec8e42535d92fe17a83b021263a54e2452cc37123555bca72bbc'
                    '42e78cf6884bbdd13ec6a6299f63ee0a0567663f94e021586e9e6541729496b3'
                    '789ecabab43d58c6a2cc55bb629b88ff3384144d98eb275f9512774e983fba6d'
                    '51220acf4caed4915d768556c110fef60f1f2c4b71209b48cb0b1bc8e117d38b'
                    '4fb2cbbac9544ab944b1a14f5c6bb2676aefd52479c7f7756b17b90f1d56bda1'
                    '89be4e6bd466bd8ece2003566165c7ccf2043f01fa61dadcd60535c89e6816cf'
                    '6ded96d6156f8b0bc1355e87b5fad8e6ebfcf8a694dedd9987768b37a41878d4'
                    '71e789faa537630b0d10dc8114dc967cdb1101fcbf3a87e47fb3ef7a0347c451'
                    '51a72c132ce2d61839112a7edb1f20cefedff186b427edad6f4cd535cc497ea6')

package() {
  for file in *.deb; do
    echo "Extracting $file"
    ar x "$file"
    tar -xf data.tar.* -C $pkgdir
    rm data.tar.* control.tar.*
  done
  rm "$srcdir/debian-binary"

  install -Dm644 "../android-home.sh" "${pkgdir}/etc/profile.d/android-home.sh"
  install -Dm644 "../android-home.csh" "${pkgdir}/etc/profile.d/android-home.csh"
}

