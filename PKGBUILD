# Maintainer: Daniel Poellmann <aur@<lastname><firstname>.de>
# Contributor: David P. <megver83@parabola.nu>

pkgname=linphone-desktop
pkgver=5.2.6
pkgrel=2
pkgdesc='A free VoIP and video softphone based on the SIP protocol'
arch=(x86_64)
url='http://linphone.org'
license=('GPL-3.0-only')
depends=('qt5-base' 'qt5-multimedia' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-speech' 'libxcrypt-compat' 'v4l-utils' 'glew')
makedepends=('meson' 'coreutils' 'git' 'gendesk' 'cmake' 'yasm' 'nasm' 'doxygen' 'perl' 'python-pystache' 'python-six' 'libpulse' 'qt5-base' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-tools')
source=("git+https://github.com/BelledonneCommunications/linphone-desktop.git#commit=ea583b001a87dd18384ec7bb524ffbdadacd96c8"
"linphone.png::https://gitlab.linphone.org/BC/public/linphone-desktop/-/raw/8dfd384e3df08b200c8eb382b740da6839961bf0/linphone-app/assets/icons/hicolor/128x128/apps/icon.png"
"git+https://gitlab.linphone.org/BC/public/linphone-sdk.git#commit=865f9ecb1edeae93730c7d7a415812c4b1b7df51"
"git+https://gitlab.linphone.org/BC/public/belle-sip.git#commit=73bbda596f9a5795b9e97627ec0dbcc7cddaea80"
"git+https://gitlab.linphone.org/BC/public/liblinphone.git#commit=7dc8804d6c98d1d1fc956efa16538b5b6fa07b5c"
"git+https://gitlab.linphone.org/BC/public/bcg729.git#commit=8bec1e5fc072f3669e435edd137eb3da6da2eef7"
"git+https://gitlab.linphone.org/BC/public/bzrtp.git#commit=352cd640edad006c5c6ed8e6afb8e22de5a9b9b6"
"git+https://gitlab.linphone.org/BC/public/msamr.git#commit=129fc98c04a5cd412d5393427d43b0b445263ead"
"git+https://gitlab.linphone.org/BC/public/msopenh264.git#commit=041b07a81f88f1dde2ebb7a1ea0b0e2ec281ab20"
"git+https://gitlab.linphone.org/BC/public/mssilk.git#commit=0c6893fb74ecca34cb2707f7fffd0d7487b24925"
"git+https://gitlab.linphone.org/BC/public/mswebrtc.git#commit=9615e3eb8e3b2717b71a082b4e751f98c34d3f07"
"git+https://gitlab.linphone.org/BC/public/external/webrtc.git#commit=583acd27665cfadef8ab03eb85a768d308bd29dd"
"git+https://gitlab.linphone.org/BC/public/belcard.git#commit=135e55d092cae59e7c8c1dc93227a175cde4b44b"
"git+https://gitlab.linphone.org/BC/public/belr.git#commit=9cbc933472b93a795e9fb0424e365823363bb72b"
"git+https://gitlab.linphone.org/BC/public/bctoolbox.git#commit=1e96e288ca0aca082e1aef3d6798ddf4a3bdc8c0"
"git+https://gitlab.linphone.org/BC/public/bcunit.git#commit=8c33f788e9b13c379d3a6ae66c7971bb952f773b"
"git+https://gitlab.linphone.org/BC/public/ortp.git#commit=71f18a1753b4fae0d02c37a1ecb68f812d94c769"
"git+https://gitlab.linphone.org/BC/public/mediastreamer2.git#commit=08ab6ddbb85d66079b4b81cd61def78a58e90f3e"
"git+https://gitlab.linphone.org/BC/public/mswasapi.git#commit=f584ef3ecf5b837de6db04f7eb4e50eb47d475d6"
"git+https://gitlab.linphone.org/BC/public/bcmatroska2.git#commit=40b2b14993b92980af1339145de3203432f036e5"
"git+https://gitlab.linphone.org/BC/public/external/mbedtls.git#commit=2acc0f26e6e97c82ff9981c1ec32b497d4ea9426"
"git+https://gitlab.linphone.org/BC/public/external/bv16-floatingpoint.git#commit=714c280aa8b068278c965e1d7ef69080048f09fb"
"git+https://gitlab.linphone.org/BC/public/external/speex.git#commit=f775510ed05a7b480ef8bb4b060c21af9f6c9006"
"git+https://gitlab.linphone.org/BC/public/external/ffmpeg.git#commit=2a73517a5b83b92355b5d4d0e27a7da847adeb57"
"git+https://gitlab.linphone.org/BC/public/external/libvpx.git#commit=4f496f8d966088e712a79237cfe44197c771ae1a"
"git+https://gitlab.linphone.org/BC/public/external/opus.git#commit=eba0313c23a34f4c35d76b1bcdc3ccb10fb0c0b5"
"git+https://gitlab.linphone.org/BC/public/external/gsm.git#commit=f3426b54a14cb2d42cfa78cb84b0147859ad58fb"
"git+https://gitlab.linphone.org/BC/public/external/srtp.git#commit=c136e9462551add57ad29844822e1f5dece4e4d7"
"git+https://gitlab.linphone.org/BC/public/external/libxml2.git#commit=8d7a049c8495354c361468d2cf82b90e219bb443"
"git+https://gitlab.linphone.org/BC/public/external/zlib.git#commit=3c0830d48463436e431de2b64647de1ed3fc98d9"
"git+https://gitlab.linphone.org/BC/public/external/openh264.git#commit=b20e25e99f85a58c13ab6204afe103bf1040d416"
"git+https://gitlab.linphone.org/BC/public/external/libjpeg-turbo.git#commit=91f8025a3071d6cec2c41265a038f47fcd28f092"
"git+https://gitlab.linphone.org/BC/public/external/xerces-c.git#commit=f40b8e10dddcf6fc70fc1a200d0806312ece4fd1"
"git+https://gitlab.linphone.org/BC/public/external/soci.git#commit=d26d42eae02051ccbc53e8684cbc8b5aeb6cea13"
"git+https://gitlab.linphone.org/BC/public/external/sqlite3.git#commit=a7e599dffa9b7b4696296055a92def3444e2fca0"
"git+https://gitlab.linphone.org/BC/public/external/codec2.git#commit=86e2af3a9317d371462aa6c19cc64b877e40ba2e"
"git+https://gitlab.linphone.org/BC/public/mscodec2.git#commit=4a0298386c50d59b86c64277e7d5bf53dc9f0bd3"
"git+https://gitlab.linphone.org/BC/public/external/decaf.git#commit=63ad363f92eb50bc09ed3be8574f84650ed377a9"
"git+https://gitlab.linphone.org/BC/public/external/zxing-cpp.git#commit=8ac6bcdc6c0b4122c457408bdba9514aa116c905"
"git+https://gitlab.linphone.org/BC/public/external/vo-amrwbenc.git#commit=986a52ced2a02511a3c250f101df18e7f7d36dde"
"git+https://gitlab.linphone.org/BC/public/external/opencore-amr.git#commit=084d2a08e2bce13a27cb33f4b371030dab8c2460"
"git+https://gitlab.linphone.org/BC/public/lime.git#commit=c1a310c8776183a853b9a0eb8f2bd08535447694"
"git+https://gitlab.linphone.org/BC/public/msaaudio.git#commit=b11b661b4138aecb06585bb276acf59fbed73458"
"git+https://gitlab.linphone.org/BC/public/msandroidcamera2.git#commit=465e15fd814dc16111fe5c603b56460a5426acbc"
"git+https://gitlab.linphone.org/BC/public/external/openldap.git#commit=72cc60cf3f7d8fbb363077cd480779b1f45ecb74"
"git+https://gitlab.linphone.org/BC/public/external/jsoncpp.git#commit=b1bd848241880ccea2d940f67343a899b9f65d5d"
"git+https://gitlab.linphone.org/BC/public/msoboe.git#commit=4d5b66202a8a7a734e75446d0ce44bf342835736"
"git+https://github.com/google/oboe#commit=5975ab04b02861dc126f3c8fd687321520cd8ae4"
"git+https://gitlab.linphone.org/BC/public/external/libyuv.git#commit=918f69d14dba48437334b938584928c0f301e1e6"
"git+https://gitlab.linphone.org/BC/public/external/liboqs.git#commit=864261998c940283b369b7105437b18632d8734d"
"git+https://gitlab.linphone.org/BC/public/postquantumcryptoengine.git#commit=e441d9ac0290b35f2ba816d9e85bf176cbcf96a8"
"git+https://gitlab.linphone.org/BC/public/external/dav1d.git#commit=48035599cdd4e4415732e408c407e0c1cd1c7444"
"git+https://gitlab.linphone.org/BC/public/external/aom.git#commit=01db72d94094637cbd001cc1d7f7dd3eeeb21c2b"
"git+https://gitlab.linphone.org/BC/public/external/qtkeychain.git#commit=72e39ee293f4598955b92f9fb21b97cf21a8d1a6"
"git+https://gitlab.linphone.org/BC/public/external/ispell.git#commit=05574fe160222c3d0b6283c1433c9b087271fad1"
)
sha512sums=('SKIP'
'd6495cdc022b1e4c92b3641cb70347e7e6b6ef47599004de729e908b4876a12540713ab54b588611c99c8025fb9b33e3392573c85c13f72cdaee8bcf7a73d65d'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP'
'SKIP')
options=()
provides=(linphone=${pkgver})

prepare() {
    echo "#include <unistd.h>" | cat - "$srcdir/linphone-desktop/linphone-sdk/external/openldap/libraries/libldap/thr_posix.c" > temp && mv temp "$srcdir/linphone-desktop/linphone-sdk/external/openldap/libraries/libldap/thr_posix.c"
    cd "$srcdir"
    mkdir -p linphone-desktop && rm -r linphone-desktop/linphone-sdk && mv linphone-sdk linphone-desktop/linphone-sdk
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/belle-sip && mv belle-sip linphone-desktop/linphone-sdk/belle-sip
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/liblinphone && mv liblinphone linphone-desktop/linphone-sdk/liblinphone
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/bcg729 && mv bcg729 linphone-desktop/linphone-sdk/bcg729
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/bzrtp && mv bzrtp linphone-desktop/linphone-sdk/bzrtp
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/msamr && mv msamr linphone-desktop/linphone-sdk/msamr
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/msopenh264 && mv msopenh264 linphone-desktop/linphone-sdk/msopenh264
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/mssilk && mv mssilk linphone-desktop/linphone-sdk/mssilk
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/mswebrtc && mv mswebrtc linphone-desktop/linphone-sdk/mswebrtc
    mkdir -p linphone-desktop/linphone-sdk/mswebrtc && rm -r linphone-desktop/linphone-sdk/mswebrtc/webrtc && mv webrtc linphone-desktop/linphone-sdk/mswebrtc/webrtc
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/belcard && mv belcard linphone-desktop/linphone-sdk/belcard
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/belr && mv belr linphone-desktop/linphone-sdk/belr
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/bctoolbox && mv bctoolbox linphone-desktop/linphone-sdk/bctoolbox
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/bcunit && mv bcunit linphone-desktop/linphone-sdk/bcunit
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/ortp && mv ortp linphone-desktop/linphone-sdk/ortp
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/mediastreamer2 && mv mediastreamer2 linphone-desktop/linphone-sdk/mediastreamer2
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/mswasapi && mv mswasapi linphone-desktop/linphone-sdk/mswasapi
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/bcmatroska2 && mv bcmatroska2 linphone-desktop/linphone-sdk/bcmatroska2
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/mbedtls && mv mbedtls linphone-desktop/linphone-sdk/external/mbedtls
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/bv16-floatingpoint && mv bv16-floatingpoint linphone-desktop/linphone-sdk/external/bv16-floatingpoint
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/speex && mv speex linphone-desktop/linphone-sdk/external/speex
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/ffmpeg && mv ffmpeg linphone-desktop/linphone-sdk/external/ffmpeg
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/libvpx && mv libvpx linphone-desktop/linphone-sdk/external/libvpx
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/opus && mv opus linphone-desktop/linphone-sdk/external/opus
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/gsm && mv gsm linphone-desktop/linphone-sdk/external/gsm
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/srtp && mv srtp linphone-desktop/linphone-sdk/external/srtp
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/libxml2 && mv libxml2 linphone-desktop/linphone-sdk/external/libxml2
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/zlib && mv zlib linphone-desktop/linphone-sdk/external/zlib
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/openh264 && mv openh264 linphone-desktop/linphone-sdk/external/openh264
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/libjpeg-turbo && mv libjpeg-turbo linphone-desktop/linphone-sdk/external/libjpeg-turbo
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/xerces-c && mv xerces-c linphone-desktop/linphone-sdk/external/xerces-c
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/soci && mv soci linphone-desktop/linphone-sdk/external/soci
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/sqlite3 && mv sqlite3 linphone-desktop/linphone-sdk/external/sqlite3
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/codec2 && mv codec2 linphone-desktop/linphone-sdk/external/codec2
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/mscodec2 && mv mscodec2 linphone-desktop/linphone-sdk/mscodec2
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/decaf && mv decaf linphone-desktop/linphone-sdk/external/decaf
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/zxing-cpp && mv zxing-cpp linphone-desktop/linphone-sdk/external/zxing-cpp
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/vo-amrwbenc && mv vo-amrwbenc linphone-desktop/linphone-sdk/external/vo-amrwbenc
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/opencore-amr && mv opencore-amr linphone-desktop/linphone-sdk/external/opencore-amr
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/lime && mv lime linphone-desktop/linphone-sdk/lime
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/msaaudio && mv msaaudio linphone-desktop/linphone-sdk/msaaudio
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/msandroidcamera2 && mv msandroidcamera2 linphone-desktop/linphone-sdk/msandroidcamera2
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/openldap && mv openldap linphone-desktop/linphone-sdk/external/openldap
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/jsoncpp && mv jsoncpp linphone-desktop/linphone-sdk/external/jsoncpp
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/msoboe && mv msoboe linphone-desktop/linphone-sdk/msoboe
    mkdir -p linphone-desktop/linphone-sdk/msoboe && rm -r linphone-desktop/linphone-sdk/msoboe/oboe && mv oboe linphone-desktop/linphone-sdk/msoboe/oboe
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/libyuv && mv libyuv linphone-desktop/linphone-sdk/external/libyuv
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/liboqs && mv liboqs linphone-desktop/linphone-sdk/external/liboqs
    mkdir -p linphone-desktop/linphone-sdk && rm -r linphone-desktop/linphone-sdk/postquantumcryptoengine && mv postquantumcryptoengine linphone-desktop/linphone-sdk/postquantumcryptoengine
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/dav1d && mv dav1d linphone-desktop/linphone-sdk/external/dav1d
    mkdir -p linphone-desktop/linphone-sdk/external && rm -r linphone-desktop/linphone-sdk/external/aom && mv aom linphone-desktop/linphone-sdk/external/aom
    mkdir -p linphone-desktop/external && rm -r linphone-desktop/external/qtkeychain && mv qtkeychain linphone-desktop/external/qtkeychain
    mkdir -p linphone-desktop/external && rm -r linphone-desktop/external/ispell && mv ispell linphone-desktop/external/ispell

}

build() {
  cd "$srcdir/linphone-desktop"

  # Fix cmake file from linphone
  sed -i '15i include_directories(external/qtkeychain build/external/qtkeychain)' CMakeLists.txt

  mkdir -p build/OUTPUT && cd build

  cmake .. -DCMAKE_BUILD_PARALLEL_LEVEL=$(nproc) -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build . --target install --parallel $(nproc) --config RelWithDebInfo

  #  # Generate desktop file
  cd "$srcdir"
  gendesk -f -n \
     --pkgname="$pkgname" \
     --pkgdesc="$pkgdesc" \
     --name=Linphone \
     --genericname="VoIP Client" \
     --categories=Network \
     --icon=linphone.png \
     --exec=/opt/linphone/linphone-launcher \
     --terminal=false \
     --startupnotify=true \
     --comment "Linphone"
}

package() {
    mkdir -p "$pkgdir/opt/linphone/"
    cp -r "$srcdir/linphone-desktop/build/OUTPUT/." "$pkgdir/opt/linphone/"

    mkdir -p "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/linphone-desktop.desktop" "$pkgdir/usr/share/applications/"

    mkdir -p "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "$srcdir/linphone.png" "$pkgdir/usr/share/pixmaps/"

    # Add linphone's own lib folder to LD_LIBRARY_PATH
    echo "#!/bin/bash" > "$pkgdir/opt/linphone/linphone-launcher"
    echo 'LD_LIBRARY_PATH="/opt/linphone/lib:$LD_LIBRARY_PATH" /opt/linphone/bin/linphone "$@"' >> "$pkgdir/opt/linphone/linphone-launcher"
    chmod +x "$pkgdir/opt/linphone/linphone-launcher"

    mkdir -p "$pkgdir/usr/bin/"
    ln -s /opt/linphone/linphone-launcher "$pkgdir/usr/bin/linphone"
}
