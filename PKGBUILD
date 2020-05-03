# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
# Contributor: Nicola Squartini <tensor5@gmail.com>
# Contributor: Valentin Hăloiu <vially.ichb@gmail.com>

pkgname=electron-ozone
pkgver=8.2.5
provides=('electron')
conflicts=('electron')
_commit=6c42564337697f1907627ad96b7bd4801ef5be20
_chromiumver=80.0.3987.165
pkgrel=2
pkgdesc='Electron compiled with wayland support via Ozone'
arch=('x86_64')
options=(debug !strip)
url='https://electronjs.org/'
license=('MIT' 'custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libnghttp2'
         'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy')
makedepends=('git' 'gn' 'gperf' 'harfbuzz-icu' 'java-runtime-headless'
             'jsoncpp' 'libnotify' 'lld' 'llvm' 'ninja' 'npm' 'pciutils' 'yarn'
             'python2' 'wget' 'yasm' 'python2-setuptools' 'libpipewire02' 'nodejs')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'libappindicator-gtk3: StatusNotifierItem support'
            'trash-cli: file deletion support (trash-put)'
            "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)")
source=('git+https://github.com/electron/electron.git'
        'git+https://chromium.googlesource.com/chromium/tools/depot_tools.git'
        'electron.desktop'
        'default_app-icon.patch'
        'use-system-libraries-in-node.patch'
        'chromium-skia-harmony.patch'
        'fix-building-with-system-zlib.patch'
        'fix-building-with-unbundled-libxml.patch'
        'fix-shim-header-generation-when-unbundling-ICU.patch'
        '0001-Add-missing-algorithm-header-in-bitmap_cursor_factor.patch'
        'cros-search-service-Include-cmath-for-std-pow.patch'
        'move-RemoteTreeNode-declaration.patch'
        'sync-enable-USSPasswords-by-default.patch'
        'remove-verbose-logging-in-local-unique-font-matching.patch'
        'rename-Relayout-in-DesktopWindowTreeHostPlatform.patch'
        'rebuild-Linux-frame-button-cache-when-activation.patch'
        'icu67.patch'
        '0001-fix-use-ozone-version-of-global_shortcut_listener-wh.patch'
        '0002-fix-don-t-include-global_menu_bar_x11-sources-in-ozo.patch'
        '0003-fix-fix-ifdefs-and-add-NOTIMPLEMENTEDs-to-make-nativ.patch'
        '0004-fix-remove-various-x11-sources-from-filenames.gni-in.patch'
        '0005-fix-atom_browser_main_parts-move-non-X11-specific-th.patch'
        '0006-fix-scripts-account-for-sys.platform-being-linux-as-.patch'
        '0007-fix-add-ifdefs-around-some-X11-specific-code-to-focu.patch'
       )
sha256sums=('SKIP'
            'SKIP'
            '5270db01f3f8aaa5137dec275a02caa832b7f2e37942e068cba8d28b3a29df39'
            '00b21418b9468064f6f275566d3cf64c6b014e596acc650100a5a46da31efbfa'
            'c7eadac877179e586d0cce7f898aa1462b4c207733e68ecc17de9754b691713a'
            '771292942c0901092a402cc60ee883877a99fb804cb54d568c8c6c94565a48e1'
            '18276e65c68a0c328601b12fefb7e8bfc632346f34b87e64944c9de8c95c5cfa'
            'e530d1b39504c2ab247e16f1602359c484e9e8be4ef6d4824d68b14d29a7f60b'
            'e477aa48a11ca4d53927f66a9593567fcd053325fb38af30ac3508465f1dd1f6'
            '716c28bed9f6e9c32e3617e125c1b04806700aef691763923cd4ed14b8d23279'
            '0a8d1af2a3734b5f99ea8462940e332db4acee7130fe436ad3e4b7ad133e5ae5'
            '21f631851cdcb347f40793485b168cb5d0da65ae26ae39ba58d624c66197d0a5'
            '08ef82476780e0864b5bf7f20eb19db320e73b9a5d4f595351e12e97dda8746f'
            '5bc775c0ece84d67855f51b30eadcf96fa8163b416d2036e9f9ba19072f54dfe'
            'ae3bf107834bd8eda9a3ec7899fe35fde62e6111062e5def7d24bf49b53db3db'
            '46f7fc9768730c460b27681ccf3dc2685c7e1fd22d70d3a82d9e57e3389bb014'
            '5315977307e69d20b3e856d3f8724835b08e02085a4444a5c5cefea83fd7d006'
            '11c6a9d7526df9624d5d66afa9b8a0fae3f7193822a6673a043211d467d0c617'
            'd7cb9ad2421b71715c77a9b37f881442cb8e6942e1b8ec1c809325bb5ec4e15f'
            '54a92af10ca2f11e7326354a2f634bd7e800f89deadef4009a75bda6c8edd898'
            '5d273ec671efe79665ad032d8f7c5cc6486fa4b5ecd281fe84235abaca0a67d5'
            'd7a2187930dcf2046e3a7a03c913616dfd77a693e8e8a48f929d3fa03c4899e8'
            'd07f70f24df69a44383eac5b5d868fcb5a17c6940b420c93c3a4129567123f0a'
            'ce70a1dfa6234245e4e6a55ac513d1cb32b5428beb05e5a019d67a076cf784e9')

_system_libs=('ffmpeg'
              'flac'
              'fontconfig'
              'freetype'
              'harfbuzz-ng'
              'icu'
              'libdrm'
              'libevent'
              'libjpeg'
#              'libpng'
#              'libvpx'
              'libwebp'
              'libxml'
              'libxslt'
#              'openh264'
              'opus'
              're2'
              'snappy'
              'yasm'
              'zlib'
             )

prepare() {
  export PATH="${PATH}:${srcdir}/depot_tools"

  echo "Fetching chromium..."
  git clone --branch=${_chromiumver} --depth=1 \
      https://chromium.googlesource.com/chromium/src.git

  echo "solutions = [
  {
    \"name\": \"src/electron\",
    \"url\": \"file://${srcdir}/electron@${_commit}\",
    \"deps_file\": \"DEPS\",
    \"managed\": False,
    \"custom_deps\": {
      \"src\": None,
    },
    \"custom_vars\": {},
  },
]" > .gclient

  python2 "${srcdir}/depot_tools/gclient.py" sync \
      --with_branch_heads \
      --with_tags \
      --nohooks

  cd src/electron
  echo "Applying local electron patches"
  patch -Np1 -i ../../0001-fix-use-ozone-version-of-global_shortcut_listener-wh.patch
  patch -Np1 -i ../../0002-fix-don-t-include-global_menu_bar_x11-sources-in-ozo.patch
  patch -Np1 -i ../../0003-fix-fix-ifdefs-and-add-NOTIMPLEMENTEDs-to-make-nativ.patch
  patch -Np1 -i ../../0004-fix-remove-various-x11-sources-from-filenames.gni-in.patch
  patch -Np1 -i ../../0005-fix-atom_browser_main_parts-move-non-X11-specific-th.patch
  patch -Np1 -i ../../0006-fix-scripts-account-for-sys.platform-being-linux-as-.patch
  patch -Np1 -i ../../0007-fix-add-ifdefs-around-some-X11-specific-code-to-focu.patch
  cd ../../

  sed -e "s/'am'/'apply'/" -i src/electron/script/lib/git.py

  echo "Running hooks..."
  # python2 "${srcdir}/depot_tools/gclient.py" runhooks
  python2 src/tools/clang/scripts/update.py
  python2 src/build/landmines.py
  python2 src/build/util/lastchange.py -o src/build/util/LASTCHANGE
  python2 src/build/util/lastchange.py -m GPU_LISTS_VERSION \
    --revision-id-only --header src/gpu/config/gpu_lists_version.h
  python2 src/build/util/lastchange.py -m SKIA_COMMIT_HASH \
    -s src/third_party/skia --header src/skia/ext/skia_commit_hash.h
  # Create sysmlink to system Node.js
  mkdir -p src/third_party/node/linux/node-linux-x64/bin
  ln -sf /usr/bin/node src/third_party/node/linux/node-linux-x64/bin
  python2 src/third_party/depot_tools/download_from_google_storage.py \
    --no_resume --extract --no_auth --bucket chromium-nodejs \
    -s src/third_party/node/node_modules.tar.gz.sha1
  vpython src/tools/download_cros_provided_profile.py \
    --newest_state=src/chrome/android/profiles/newest.txt \
    --local_state=src/chrome/android/profiles/local.txt \
    --output_name=src/chrome/android/profiles/afdo.prof \
    --gs_url_base=chromeos-prebuilt/afdo-job/llvm
  python2 src/electron/script/apply_all_patches.py \
      src/electron/patches/config.json
  cd src/electron
  yarn install --frozen-lockfile
  cd ..

  echo "Applying local Chromium patches..."
  patch -Np0 -i ../chromium-skia-harmony.patch
  patch -Np2 -i ../icu67.patch
  patch -Np1 -i ../fix-building-with-system-zlib.patch
  patch -Np1 -i ../fix-building-with-unbundled-libxml.patch
  patch -Np1 -i ../fix-shim-header-generation-when-unbundling-ICU.patch
  patch -Np1 -i ../use-system-libraries-in-node.patch
  patch -Np1 -i ../default_app-icon.patch  # Icon from .desktop file
  patch -Np1 -i ../0001-Add-missing-algorithm-header-in-bitmap_cursor_factor.patch
  patch -Np1 -i ../cros-search-service-Include-cmath-for-std-pow.patch
  patch -Np1 -i ../move-RemoteTreeNode-declaration.patch
  patch -Np1 -i ../sync-enable-USSPasswords-by-default.patch
  patch -Np1 -i ../remove-verbose-logging-in-local-unique-font-matching.patch
  patch -Np1 -i ../rename-Relayout-in-DesktopWindowTreeHostPlatform.patch
  patch -Np1 -i ../rebuild-Linux-frame-button-cache-when-activation.patch

  # Force script incompatible with Python 3 to use /usr/bin/python2
  sed -i '1s|python$|&2|' third_party/dom_distiller_js/protoc_plugins/*.py

  echo "Patching Chromium for using system libraries..."
  sed -i 's/OFFICIAL_BUILD/GOOGLE_CHROME_BUILD/' \
      tools/generate_shim_headers/generate_shim_headers.py
  for lib in "${_system_libs[@]}" libjpeg_turbo; do
      third_party_dir="third_party/${lib}"
      if [ ! -d ${third_party_dir} ]; then
        third_party_dir="base/${third_party_dir}"
      fi
      find ${third_party_dir} -type f \
          \! -path "${third_party_dir}/chromium/*" \
          \! -path "${third_party_dir}/google/*" \
          \! -path 'third_party/yasm/run_yasm.py' \
          \! -regex '.*\.\(gn\|gni\|isolate\)' \
          -delete
  done
  python2 build/linux/unbundle/replace_gn_files.py \
      --system-libraries \
      "${_system_libs[@]}"
}

build() {
  cd src
  export CHROMIUM_BUILDTOOLS_PATH="${PWD}/buildtools"
  local _flags=(
    'blink_symbol_level = 0'
    'icu_use_data_file = false'
    'is_component_ffmpeg = false'
    'link_pulseaudio = true'
    'linux_use_bundled_binutils = false'
    'treat_warnings_as_errors = false'
    'use_custom_libcxx = false'
    'use_gnome_keyring = false'
    'use_sysroot = false'
    'use_ozone = true'
    'ozone_auto_platforms = false'
    'ozone_platform_wayland = true'
    'ozone_platform_x11 = true'
    'use_xkbcommon = true'
    'use_system_libwayland = true'
    'use_system_minigbm = true'
    'use_system_libdrm = true'
    'use_glib = true'
    'rtc_use_pipewire=true'
  )

  if check_buildoption ccache y; then
    # Avoid falling back to preprocessor mode when sources contain time macros
    export CCACHE_SLOPPINESS=time_macros
    _flags+=('cc_wrapper="ccache"')
  fi

  if check_option strip y; then
    _flags+=('symbol_level=0')
  else
    _flags+=('symbol_level=1')
  fi

  gn gen out/Release \
      --args="import(\"//electron/build/args/release.gn\") ${_flags[*]}" \
      --script-executable=/usr/bin/python2
  ninja -C out/Release electron
  # Strip before zip to avoid
  # zipfile.LargeZipFile: Filesize would require ZIP64 extensions
  if check_option strip y; then
    strip -s out/Release/electron
  fi
  ninja -C out/Release electron_dist_zip
  # ninja -C out/Release third_party/electron_node:headers
}

package() {
  install -dm755 "${pkgdir}/usr/lib/electron"
  bsdtar -xf src/out/Release/dist.zip -C "${pkgdir}/usr/lib/electron"

  chmod u+s "${pkgdir}/usr/lib/electron/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  for l in "${pkgdir}/usr/lib/electron"/{LICENSE,LICENSES.chromium.html}; do
    ln -s  \
      $(realpath --relative-to="${pkgdir}/usr/share/licenses/${pkgname}" ${l}) \
      "${pkgdir}/usr/share/licenses/${pkgname}"
  done

  install -dm755 "${pkgdir}"/usr/bin
  ln -s ../lib/electron/electron "${pkgdir}"/usr/bin

  # Install .desktop and icon file (see default_app-icon.patch)
  install -Dm644 -t "${pkgdir}/usr/share/applications" electron.desktop
  install -Dm644 src/electron/default_app/icon.png \
          "${pkgdir}/usr/share/pixmaps/electron.png"  # hicolor has no 1024x1024
}
