# Maintainer: Michael Egger <gcarq@archlinux.info>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=inox
pkgver=67.0.3396.87
pkgrel=1
_launcher_ver=6
pkgdesc="Chromium Spin-off to enhance privacy by disabling data transmission to Google"
arch=('x86_64')
url="https://www.chromium.org/Home"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-font' 'systemd' 'dbus' 'libpulse' 'pciutils' 'json-glib'
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python' 'python2' 'gperf' 'yasm' 'mesa' 'ninja' 'nodejs' 'git'
             'clang' 'lld' 'llvm' 'libva')
optdepends=('pepper-flash: support for Flash content'
            'kdialog: needed for file dialogs in KDE'
            'gnome-keyring: for storing passwords in GNOME keyring'
            'kwallet: for storing passwords in KWallet'
            'libva-intel-driver: for hardware video acceleration with Intel GPUs'
            'libva-mesa-driver: for hardware video acceleration with AMD/ATI GPUs'
            'libva-vdpau-driver: for hardware video acceleration with NVIDIA GPUs')
install=inox.install
source=(https://commondatastorage.googleapis.com/chromium-browser-official/chromium-$pkgver.tar.xz
        chromium-launcher-$_launcher_ver.tar.gz::https://github.com/foutrelis/chromium-launcher/archive/v$_launcher_ver.tar.gz
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/product_logo_{16,22,24,32,48,64,128,256}.png
        # Patches from Arch Linux
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/chromium-arflags.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/chromium-ffmpeg-r1.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/chromium-skia-harmony.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/chromium-widevine-r2.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/remove-dependency-on-ffmpeg-internals-for-start-time.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/x11-fix-mixup-between-DIP-pixel-coordinates.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/blink-disable-XML-catalogs-at-runtime.patch
        # Misc
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/chromium-vaapi-r18.patch
        # Inox patchset
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0001-fix-building-without-safebrowsing.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0002-fix-building-without-reporting.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0003-disable-autofill-download-manager.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0004-disable-google-url-tracker.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0005-disable-default-extensions.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0006-modify-default-prefs.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0007-disable-web-resource-service.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0008-restore-classic-ntp.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0009-disable-google-ipv6-probes.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0010-disable-gcm-status-check.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0011-add-duckduckgo-search-engine.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0012-branding.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0013-disable-missing-key-warning.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0014-disable-translation-lang-fetch.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0015-disable-update-pings.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0016-chromium-sandbox-pie.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0017-disable-new-avatar-menu.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0018-disable-first-run-behaviour.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0019-disable-battery-status-service.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0020-launcher-branding.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/0021-disable-rlz.patch
        https://raw.githubusercontent.com/gcarq/inox-patchset/$pkgver/9000-disable-metrics.patch)
sha256sums=('5d27a72f0cb8247343034f63fdd9747ff388c05b9fceb541668dd04fb372db1d'
            '04917e3cd4307d8e31bfb0027a5dce6d086edb10ff8a716024fbb8bb0c7dccf1'
            '71471fa4690894420f9e04a2e9a622af620d92ac2714a35f9a4c4e90fa3968dd'
            '4a533acefbbc1567b0d74a1c0903e9179b8c59c1beabe748850795815366e509'
            '7b88830c5e0e9819f514ad68aae885d427541a907e25607e47dee1b0f38975fd'
            '8c10e3b03b13555b461add586422472e0a96d3af49a078d6d952bc0719ba9d94'
            'cc08b771d83b7434c3173c27419bc7d1d4ee375256f3169ef2b9333ba1f2beeb'
            '53a1e8da18069eb4d6ab3af9c923c22a0f020241a4839c3140e3601052ddf6ff'
            '896993987d4ef9f0ac7db454f288117316c2c80ed0b6764019afd760db222dad'
            '3df9b3bbdc07fde63d9e400954dcc6ab6e0e5454f0ef6447570eef0549337354'
            'ebf0054a2f8ad4d7e4da438e143d8674c88a31385f409068c3729c5b222e3973'
            'aa885330bc4180b78d915f9dfdfc3210038a0acab7b16735ea9828ab6a633bde'
            'feca54ab09ac0fc9d0626770a6b899a6ac5a12173c7d0c1005bc3964ec83e7b3'
            '068e11a910779d39c5f223018c8f3503734cb3b303471858006cb81ed4886c1b'
            'd6af7a4afcdfce965d9ebcf177ab8189c7006c587c30e940255163db3da4b6c8'
            'e2c2754536243a60fa70541bbd4121715eccd83caa8f1fb1873bd994cd81f871'
            '98a5c41cf9687c52ee380d2b683c95387334c76254479c347bdb733646dab815'
            'a7dbcbfc5ec18606c260df67b98fb2440fe59a4c9ede0823fc43f3bcf439887b'
            '46036bdd0ce5be85e61c1f49cd3a13fbe4395e45ae05f46ce6fb15574b60df02'
            'b9fc0089687e67453dba9190a069414f4621143349371fd523eb816e2e46662c'
            'f639f11ced3432cb12a19528e4d9a7f1bbcb2f9fd46f2969d8d0b567e27ec407'
            '372a17710c9ae647ad597284491c5e91ea40cc9ea3750f35531b874dfed3f728'
            '7193573d2c4c5e9af35c5364ae6b92d714ebdd8224221cd7326a3afde5abc5a1'
            'e06d6fb900eadeb57bcbd921e456316e117cddb58c336ba07402c3aefe825dd0'
            '50c6e2d299bfce3648d8b58c3479f03b8734fb63e36a3bb59c948c04ea71e3ab'
            'f657866cbce253c6854cf30c9564ef59198509ed8274832d4d3e0bad303a89ca'
            '306b29cdfd2def2353b6c4a582fb6fcc7989a6fe009412d4abf2e2daf84ff9d1'
            '3a8979ca0cae33a836d27f825ac2e15028c2656efce2ee70c1f8ce7d094f5c1c'
            '6fdea7a737959b226165dc3b6dd347de1e09e6e237acc444116df007ba0a7c57'
            'a251a247e204e494bc88755a0cd793185aea3331d678c62432b2d57fb326e823'
            '60ecb418ff8728f67ac9617216f68dcc1ba0fa4d4e47e2da1fc4e63b5c91bfea'
            '9dfb678f76d3429f4fc3014a5de914535a7f7f64a3c185551b3f8bde9d647551'
            '44db6f3733332167518e947c72c9661b74c757aeed1b4912f94f3f34aeea067a'
            '7e12969dda184e24eccd6e5bf2b8244ba1336c2dc2dbf0494c153d09923723fd'
            '38583c9e1313e46e7444d990a00e64fb4a07fbb7f3d926737c97b0bfa2e44e33'
            'a6d29b8c041e0a367ad68e817c703e03bed63bff26c47d7d94ae280af45b9457'
            'e297609b4673e3b35c5843a9c3e49ab1b04bc9a02e9e178d5cee58b6ca8cda01'
            '7e8f34e146284aa63d34d50663e52a94f8cbeaaa431ba27bdc948592dd930662'
            '80e6512b928082a0b59465e1dcbab5e6284b545933f42d262194b1a86811a243'
            'd950ffdb1fd573f1e9049293a36025d71a1c08ad772ffe92fe4c7d1761469c4d')

# Possible replacements are listed in build/linux/unbundle/replace_gn_files.py
# Keys are the names in the above script; values are the dependencies in Arch
declare -gA _system_libs=(
  [ffmpeg]=ffmpeg
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  [icu]=icu
  [libdrm]=
  [libjpeg]=libjpeg
  #[libpng]=libpng            # https://crbug.com/752403#c10
  #[libvpx]=libvpx            # needs unreleased libvpx
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [re2]=re2
  [snappy]=snappy
  [yasm]=
  [zlib]=minizip
)
_unwanted_bundled_libs=(
  ${!_system_libs[@]}
  ${_system_libs[libjpeg]+libjpeg_turbo}
)
depends+=(${_system_libs[@]})

prepare() {
  cd "$srcdir/chromium-$pkgver"

  # Allow building against system libraries in official builds
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
    tools/generate_shim_headers/generate_shim_headers.py

  # https://crbug.com/731766
  patch -Np1 -i ../remove-dependency-on-ffmpeg-internals-for-start-time.patch

  # https://crbug.com/707721
  patch -Np1 -i ../x11-fix-mixup-between-DIP-pixel-coordinates.patch

  # https://crbug.com/736026
  patch -Np1 -i ../blink-disable-XML-catalogs-at-runtime.patch

  # https://crbug.com/skia/6663#c10
  patch -Np4 -i ../chromium-skia-harmony.patch

  # Fixes from Gentoo
  patch -Np1 -i ../chromium-ffmpeg-r1.patch
  patch -Np1 -i ../chromium-widevine-r2.patch

  # Remove compiler flags not supported by our system clang
  sed -i \
    -e '/"-Wno-ignored-pragma-optimize"/d' \
    build/config/compiler/BUILD.gn

  # Reformat arflags for compatibility with llvm
  patch -Np1 -i ../chromium-arflags.patch

  msg2 'Applying VA-API patches'
  patch -Np1 -i ../chromium-vaapi-r18.patch

  msg2 'Applying Inox patchset'
  # Apply patches to fix building
  patch -Np1 -i ../0001-fix-building-without-safebrowsing.patch
  patch -Np1 -i ../0002-fix-building-without-reporting.patch

  # Apply Inox patches
  patch -Np1 -i ../0003-disable-autofill-download-manager.patch
  patch -Np1 -i ../0004-disable-google-url-tracker.patch
  patch -Np1 -i ../0005-disable-default-extensions.patch
  patch -Np1 -i ../0006-modify-default-prefs.patch
  patch -Np1 -i ../0007-disable-web-resource-service.patch
  patch -Np1 -i ../0008-restore-classic-ntp.patch
  patch -Np1 -i ../0009-disable-google-ipv6-probes.patch
  patch -Np1 -i ../0010-disable-gcm-status-check.patch
  patch -Np1 -i ../0011-add-duckduckgo-search-engine.patch
  patch -Np1 -i ../0012-branding.patch
  patch -Np1 -i ../0013-disable-missing-key-warning.patch
  patch -Np1 -i ../0014-disable-translation-lang-fetch.patch
  patch -Np1 -i ../0015-disable-update-pings.patch
  patch -Np1 -i ../0016-chromium-sandbox-pie.patch
  patch -Np1 -i ../0017-disable-new-avatar-menu.patch
  patch -Np1 -i ../0018-disable-first-run-behaviour.patch
  patch -Np1 -i ../0019-disable-battery-status-service.patch
  patch -Np1 -i ../0021-disable-rlz.patch
  patch -Np1 -i ../9000-disable-metrics.patch

  # Force script incompatible with Python 3 to use /usr/bin/python2
  sed -i '1s|python$|&2|' third_party/dom_distiller_js/protoc_plugins/*.py

  mkdir -p third_party/node/linux/node-linux-x64/bin
  ln -s /usr/bin/node third_party/node/linux/node-linux-x64/bin/

  # Remove bundled libraries for which we will use the system copies; this
  # *should* do what the remove_bundled_libraries.py script does, with the
  # added benefit of not having to list all the remaining libraries
  local _lib
  for _lib in ${_unwanted_bundled_libs[@]}; do
    find "third_party/$_lib" -type f \
      \! -path "third_party/$_lib/chromium/*" \
      \! -path "third_party/$_lib/google/*" \
      \! -path 'third_party/yasm/run_yasm.py' \
      \! -regex '.*\.\(gn\|gni\|isolate\)' \
      -delete
  done

  python2 build/linux/unbundle/replace_gn_files.py \
    --system-libraries "${!_system_libs[@]}"

  msg2 'Applying Chromium launcher patches'
  cd "$srcdir/chromium-launcher-$_launcher_ver"
  patch -Np1 -i ../0020-launcher-branding.patch
}

build() {
  make -C chromium-launcher-$_launcher_ver

  cd "$srcdir/chromium-$pkgver"

  if check_buildoption ccache y; then
    # Avoid falling back to preprocessor mode when sources contain time macros
    export CCACHE_SLOPPINESS=time_macros
  fi

  export CC=clang
  export CXX=clang++
  export AR=llvm-ar
  export NM=llvm-nm

  local _flags=(
    'custom_toolchain="//build/toolchain/linux/unbundle:default"'
    'host_toolchain="//build/toolchain/linux/unbundle:default"'
    'clang_use_chrome_plugins=false'
    'is_official_build=true' # implies is_cfi=true on x86_64
    'is_debug=false'
    'treat_warnings_as_errors=false'
    'fieldtrial_testing_like_official_build=true'
    'remove_webcore_debug_symbols=true'
    'ffmpeg_branding="Chrome"'
    'proprietary_codecs=true'
    'link_pulseaudio=true'
    'use_gnome_keyring=false'
    'use_sysroot=false'
    'linux_use_bundled_binutils=false'
    'use_custom_libcxx=false'
    'use_vaapi=true'
    'enable_hangout_services_extension=false'
    'enable_widevine=true'
    'enable_nacl=false'
    'enable_swiftshader=false'
    'enable_nacl_nonsfi=false'
    'enable_remoting=false'
    'enable_google_now=false'
    'enable_reporting=false'
    'safe_browsing_mode=0'
  )

  # Facilitate deterministic builds (taken from build/config/compiler/BUILD.gn)
  CFLAGS+='   -Wno-builtin-macro-redefined'
  CXXFLAGS+=' -Wno-builtin-macro-redefined'
  CPPFLAGS+=' -D__DATE__=  -D__TIME__=  -D__TIMESTAMP__='

  if check_option strip y; then
    _flags+=('symbol_level=0')

    # Mimic exclude_unwind_tables=true
    CFLAGS+='   -fno-unwind-tables -fno-asynchronous-unwind-tables'
    CXXFLAGS+=' -fno-unwind-tables -fno-asynchronous-unwind-tables'
    CPPFLAGS+=' -DNO_UNWIND_TABLES'
  fi

  msg2 'Building GN'
  python2 tools/gn/bootstrap/bootstrap.py -s --no-clean
  msg2 'Configuring Chromium'
  out/Release/gn gen out/Release --args="${_flags[*]}" \
    --script-executable=/usr/bin/python2

  msg2 'Building Chromium'
  ninja -C out/Release chrome chrome_sandbox chromedriver
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.launcher"

  cd "$srcdir/chromium-$pkgver"

  install -D out/Release/chrome "$pkgdir/usr/lib/$pkgname/$pkgname"
  install -Dm4755 out/Release/chrome_sandbox "$pkgdir/usr/lib/$pkgname/chrome-sandbox"
  install -D out/Release/chromedriver "$pkgdir/usr/lib/$pkgname/inoxdriver"
  ln -s /usr/lib/$pkgname/inoxdriver "$pkgdir/usr/bin/inoxdriver"

  install -Dm644 chrome/installer/linux/common/desktop.template \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 chrome/app/resources/manpage.1.in \
    "$pkgdir/usr/share/man/man1/$pkgname.1"
  sed -i \
    -e "s/@@MENUNAME@@/${pkgname^}/g" \
    -e "s/@@PACKAGE@@/$pkgname/g" \
    -e "s/@@USR_BIN_SYMLINK_NAME@@/$pkgname/g" \
    "$pkgdir/usr/share/applications/$pkgname.desktop" \
    "$pkgdir/usr/share/man/man1/$pkgname.1"

  cp \
    out/Release/{chrome_{100,200}_percent,resources}.pak \
    out/Release/*.bin \
    "$pkgdir/usr/lib/$pkgname/"
  install -Dm644 -t "$pkgdir/usr/lib/$pkgname/locales" out/Release/locales/*.pak

  if [[ -z ${_system_libs[icu]+set} ]]; then
    cp out/Release/icudtl.dat "$pkgdir/usr/lib/$pkgname/"
  fi

  for size in 16 22 24 32 48 64 128 256; do
    install -Dm644 "$srcdir/product_logo_$size.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
