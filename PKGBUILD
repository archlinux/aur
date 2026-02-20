# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="matlab-runtime-meta"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-all"
)
pkgver=R2025b
pkgrel=3
pkgdesc="A high-level language for numerical computation and visualization"
arch=(
  'any'
)
url="https://github.com/mathworks-ref-arch/container-images/tree/main/matlab-runtime-deps"
license=(
  '0BSD'
)

_releases=(
  'R2023b'
  'R2024a'
  'R2024b'
  'R2025a'
)

declare -Ag _depends=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['gst-plugins-base-libs']=1 # gstreamer1.0-plugins-base
  ['gst-plugins-good']=1      # gstreamer1.0-plugins-good
  ['gstreamer']=1             # gstreamer1.0-tools
  ['alsa-lib']=1              # libasound2t64
  ['libatomic']=1             # libatomic1
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libcups']=0               # libcups2t64
  ['libdrm']=1                # libdrm2
  ['fontconfig']=1            # libfontconfig1
  ['fribidi']=0               # libfribidi0
  ['mesa']=1                  # libgbm1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['glib2']=1                 # libglib2.0-0t64
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk2']=0                  # libgtk2.0-0t64
  ['gtk3']=0                  # libgtk-3-0t64
  ['libice']=1                # libice6
  ['libltdl']=0               # libltdl7
  ['nettle']=1                # libnettle8t64
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['pixman']=1                # libpixman-1-0
  ['libsndfile']=1            # libsndfile1
  ['libtirpc']=0              # libtirpc3t64
  ['util-linux-libs']=1       # libuuid1
  ['wayland']=1               # libwayland-client0
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=0            # libxdamage1
  ['libxfixes']=1             # libxfixes3
  ['libxfont2']=0             # libxfont2
  ['libxft']=1                # libxft2
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxt']=1                 # libxt6t64
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['unzip']=1                 # unzip
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['zlib']=1                  # zlib1g
)

declare -Ag _depends_r2025a=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['gst-plugins-base-libs']=1 # gstreamer1.0-plugins-base
  ['gst-plugins-good']=1      # gstreamer1.0-plugins-good
  ['gstreamer']=1             # gstreamer1.0-tools
  ['alsa-lib']=1              # libasound2t64
  ['libatomic']=1             # libatomic1
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libcups']=0               # libcups2t64
  ['libdrm']=1                # libdrm2
  ['fontconfig']=1            # libfontconfig1
  ['fribidi']=0               # libfribidi0
  ['mesa']=1                  # libgbm1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['glib2']=1                 # libglib2.0-0t64
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk2']=0                  # libgtk2.0-0t64
  ['gtk3']=0                  # libgtk-3-0t64
  ['libice']=1                # libice6
  ['libltdl']=0               # libltdl7
  ['nettle']=1                # libnettle8t64
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['pixman']=1                # libpixman-1-0
  ['libsndfile']=1            # libsndfile1
  ['libtirpc']=0              # libtirpc3t64
  ['util-linux-libs']=1       # libuuid1
  ['wayland']=1               # libwayland-client0
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=0            # libxdamage1
  ['libxfixes']=1             # libxfixes3
  ['libxfont2']=0             # libxfont2
  ['libxft']=1                # libxft2
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxt']=1                 # libxt6t64
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['unzip']=1                 # unzip
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['zlib']=1                  # zlib1g
)

declare -Ag _depends_r2024b=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['gst-plugins-base-libs']=1 # gstreamer1.0-plugins-base
  ['gst-plugins-good']=1      # gstreamer1.0-plugins-good
  ['gstreamer']=1             # gstreamer1.0-tools
  ['alsa-lib']=1              # libasound2t64
  ['libatomic']=1             # libatomic1
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libcups']=0               # libcups2t64
  ['libdrm']=1                # libdrm2
  ['fontconfig']=1            # libfontconfig1
  ['fribidi']=0               # libfribidi0
  ['mesa']=1                  # libgbm1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['glib2']=1                 # libglib2.0-0t64
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk2']=0                  # libgtk2.0-0t64
  ['gtk3']=0                  # libgtk-3-0t64
  ['libice']=1                # libice6
  ['libltdl']=0               # libltdl7
  ['nettle']=1                # libnettle8t64
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['pixman']=1                # libpixman-1-0
  ['libsndfile']=1            # libsndfile1
  ['libtirpc']=0              # libtirpc3t64
  ['util-linux-libs']=1       # libuuid1
  ['wayland']=1               # libwayland-client0
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=0            # libxdamage1
  ['libxfixes']=1             # libxfixes3
  ['libxfont2']=0             # libxfont2
  ['libxft']=1                # libxft2
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxt']=1                 # libxt6t64
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['unzip']=1                 # unzip
  ['zlib']=1                  # zlib1g
)

declare -Ag _depends_r2024a=(
  # archlinux                 # ubuntu22.04
  ['ca-certificates']=1       # ca-certificates
  ['gst-libav']=1             # gstreamer1.0-libav
  ['gst-plugins-base-libs']=1 # gstreamer1.0-plugins-base
  ['gst-plugins-good']=1      # gstreamer1.0-plugins-good
  ['gstreamer']=1             # gstreamer1.0-tools
  ['alsa-lib']=1              # libasound2
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libxcrypt-compat']=1      # libcrypt1 TODO: untested
  ['libcups']=0               # libcups2
  ['libdrm']=1                # libdrm2
  ['libelf']=1                # libdw1 TODO: untested
  ['mesa']=1                  # libgbm1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['glib2']=1                 # libglib2.0-0
  ['libgomp']=1               # libgomp1 TODO: untested
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk3']=0                  # libgtk-3-0
  ['libice']=1                # libice6
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['unixodbc']=1              # libodbc2 TODO: untested
  ['unixodbc']=1              # libodbcinst2 TODO: untested
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['libsndfile']=1            # libsndfile1
  ['systemd-libs']=1          # libsystemd0 TODO: untested
  ['util-linux-libs']=1       # libuuid1
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=0            # libxdamage1
  ['libxfixes']=1             # libxfixes3
  ['libxft']=1                # libxft2
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxt']=1                 # libxt6
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['unzip']=1                 # unzip
  ['zlib']=1                  # zlib1g
)

declare -Ag _depends_r2023b=(
  # archlinux                 # ubuntu22.04
  ['ca-certificates']=1       # ca-certificates
  ['gst-libav']=1             # gstreamer1.0-libav
  ['gst-plugins-base-libs']=1 # gstreamer1.0-plugins-base
  ['gst-plugins-good']=1      # gstreamer1.0-plugins-good
  ['gstreamer']=1             # gstreamer1.0-tools
  ['alsa-lib']=1              # libasound2
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libxcrypt-compat']=1      # libcrypt1 TODO: untested
  ['libcups']=0               # libcups2
  ['libdrm']=1                # libdrm2
  ['libelf']=1                # libdw1 TODO: untested
  ['mesa']=1                  # libgbm1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['glib2']=1                 # libglib2.0-0
  ['libgomp']=1               # libgomp1 TODO: untested
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk3']=0                  # libgtk-3-0
  ['libice']=1                # libice6
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['unixodbc']=1              # libodbc2 TODO: untested
  ['unixodbc']=1              # libodbcinst2 TODO: untested
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['libsndfile']=1            # libsndfile1
  ['systemd-libs']=1          # libsystemd0 TODO: untested
  ['util-linux-libs']=1       # libuuid1
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=0            # libxdamage1
  ['libxfixes']=1             # libxfixes3
  ['libxft']=1                # libxft2
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxt']=1                 # libxt6
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['unzip']=1                 # unzip
  ['zlib']=1                  # zlib1g
)

_depends_resolved=()
_optdepends_resolved=()
for _depend in "${!_depends[@]}"; do
  if (( _depends["$_depend"] )); then
    _depends_resolved+=("$_depend")
  else
    _optdepends_resolved+=("$_depend")
  fi
done

package_matlab-runtime-meta() {
  pkgdesc+=" (runtime, meta)"
  depends=(
    "${_depends_resolved[@]}"
  )
  optdepends=(
    "${_optdepends_resolved[@]}"
    "matlab-${pkgver,,}-jre: supported system-wide JRE"
    "matlab-${pkgver,,}-gcc: supported GCC"
    "matlab-${pkgver,,}-gcc-fortran: supported GFortran"
  )
  provides=(
    "${pkgname/matlab/"matlab-${pkgver,,}"}=${pkgver}"
  )
  conflicts=(
    "${pkgname/matlab/"matlab-${pkgver,,}"}"
  )
}

package_matlab-runtime-meta-all() {
  pkgdesc+=" (runtime, meta, all)"
  depends=(
    "${pkgname%-all}>=${pkgver}-${pkgrel}"
    "${_optdepends_resolved[@]}"
  )
  provides=(
    "${pkgname/matlab/"matlab-${pkgver,,}"}=${pkgver}"
  )
  conflicts=(
    "${pkgname/matlab/"matlab-${pkgver,,}"}"
  )
}

for _release in "${_releases[@]}"; do
  pkgname+=(
    "${pkgbase/matlab/"matlab-${_release,,}"}"
    "${pkgbase/matlab/"matlab-${_release,,}"}-all"
  )

  declare -n _map="_depends_${_release,,}"
  local _depends_resolved=()
  local _optdepends_resolved=()

  for _depend in "${!_map[@]}"; do
    if (( _map["$_depend"] )); then
      _depends_resolved+=("$_depend")
    else
      _optdepends_resolved+=("$_depend")
    fi
  done

  eval "
package_${pkgbase/matlab/"matlab-${_release,,}"}() {
  pkgdesc+=' (${_release}, runtime, meta)'
  depends=(
    ${_depends_resolved[@]}
  )
  optdepends=(
    ${_optdepends_resolved[@]}
    'matlab-${_release,,}-jre: supported system-wide JRE'
    'matlab-${_release,,}-gcc: supported GCC'
    'matlab-${_release,,}-gcc-fortran: supported GFortran'
  )
}

package_${pkgbase/matlab/"matlab-${_release,,}"}-all() {
  pkgdesc+=' (${_release}, runtime, meta, all)'
  depends=(
    '${pkgbase/matlab/"matlab-${_release,,}"}>=${pkgver}-${pkgrel}'
    ${_optdepends_resolved[@]}
  )
}"
done
