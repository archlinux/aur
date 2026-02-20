# Maintainer:  envolution
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: sukanka <su975853527[AT]gmail.com>

pkgbase="matlab-meta"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-all"
)
pkgver=R2025b
pkgrel=3
epoch=1
pkgdesc="A high-level language for numerical computation and visualization"
arch=(
  'any'
)
url="https://github.com/mathworks-ref-arch/container-images/tree/main/matlab-deps"
license=(
  '0BSD'
)

_releases=(
  'R2019b'
  'R2020a'
  'R2020b'
  'R2021a'
  'R2021b'
  'R2022a'
  'R2022b'
  'R2023a'
  'R2023b'
  'R2024a'
  'R2024b'
  'R2025a'
)

declare -Ag _depends=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['debianutils']=0           # debianutils
  ['rdma-core']=0             # ibverbs-providers
  ['alsa-lib']=1              # libasound2t64
  ['at-spi2-core']=1          # libatk-bridge2.0-0t64
  ['at-spi2-core']=1          # libatk1.0-0t64
  ['libatomic']=1             # libatomic1
  ['at-spi2-core']=1          # libatspi2.0-0t64
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libxcrypt-compat']=1      # libcrypt1
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
  ['gtk3']=0                  # libgtk-3-0t64
  ['rdma-core']=0             # libibverbs1
  ['libice']=1                # libice6
  ['libltdl']=0               # libltdl7
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['numactl']=0               # libnuma1
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['pixman']=1                # libpixman-1-0
  ['opa-psm2']=0              # libpsm2-2
  ['rdma-core']=0             # librdmacm1t64
  ['libsndfile']=1            # libsndfile1
  ['libtirpc']=0              # libtirpc3t64
  ['openucx']=0               # libucx0
  ['libuhd']=0                # libuhd4.6.0-dpdk
  ['util-linux-libs']=1       # libuuid1
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
  ['glibc-locales']=0         # locales
  ['glibc-locales']=0         # locales-all
  ['make']=1                  # make
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['sudo']=0                  # sudo
  ['unzip']=1                 # unzip
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['zlib']=1                  # zlib1g
  ['wget']=1                  # wget

  # archlinux                 # ubi9
  ['which']=1                 # which.x86_64
)

declare -Ag _depends_r2025a=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['debianutils']=0           # debianutils
  ['rdma-core']=0             # ibverbs-providers
  ['alsa-lib']=1              # libasound2t64
  ['libatomic']=1             # libatomic1
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libxcrypt-compat']=1      # libcrypt1
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
  ['gtk3']=0                  # libgtk-3-0t64
  ['rdma-core']=0             # libibverbs1
  ['libice']=1                # libice6
  ['libltdl']=0               # libltdl7
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['numactl']=0               # libnuma1
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['pixman']=1                # libpixman-1-0
  ['opa-psm2']=0              # libpsm2-2
  ['rdma-core']=0             # librdmacm1t64
  ['libsndfile']=1            # libsndfile1
  ['libtirpc']=0              # libtirpc3t64
  ['openucx']=0               # libucx0
  ['libuhd']=0                # libuhd4.6.0-dpdk
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
  ['glibc-locales']=0         # locales
  ['glibc-locales']=0         # locales-all
  ['make']=1                  # make
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['sudo']=0                  # sudo
  ['unzip']=1                 # unzip
  ['wget']=1                  # wget
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['zlib']=1                  # zlib1g

  # archlinux                 # ubi9
  ['which']=1                 # which.x86_64
)

declare -Ag _depends_r2024b=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['debianutils']=0           # debianutils
  ['alsa-lib']=1              # libasound2t64
  ['libatomic']=1             # libatomic1
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libxcrypt-compat']=1      # libcrypt1
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
  ['gtk3']=0                  # libgtk-3-0t64
  ['libice']=1                # libice6
  ['libltdl']=0               # libltdl7
  ['libmd']=1                 # libmd0 TODO: untested
  ['lnettlel']=1              # libnettle8t64 TODO: untested
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['pixman']=1                # libpixman-1-0
  ['libsndfile']=1            # libsndfile1
  ['libtirpc']=0              # libtirpc3t64
  ['systemd-libs']=1          # libudev1 TODO: untested
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
  ['glibc-locales']=0         # locales
  ['glibc-locales']=0         # locales-all
  ['make']=1                  # make
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['sudo']=0                  # sudo
  ['unzip']=1                 # unzip
  ['wget']=1                  # wget
  ['zlib']=1                  # zlib1g

  # archlinux                 # ubi9
  ['which']=1                 # which.x86_64
)

declare -Ag _depends_r2024a=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['debianutils']=0           # debianutils
  ['alsa-lib']=1              # libasound2t64
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libcups']=0               # libcups2t64
  ['libdrm']=1                # libdrm2
  ['fontconfig']=1            # libfontconfig1
  ['mesa']=1                  # libgbm1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['glib2']=1                 # libglib2.0-0t64
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk3']=0                  # libgtk-3-0t64
  ['libice']=1                # libice6
  ['libltdl']=0               # libltdl7
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['libsndfile']=1            # libsndfile1
  ['systemd-libs']=1          # libudev1 TODO: untested
  ['util-linux-libs']=1       # libuuid1
  ['wayland']=1               # libwayland-client0
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=0            # libxdamage1
  ['libxfixes']=1             # libxfixes3
  ['libxft']=1                # libxft2
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxt']=1                 # libxt6t64
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['glibc-locales']=0         # locales
  ['glibc-locales']=0         # locales-all
  ['make']=1                  # make
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['sudo']=0                  # sudo
  ['unzip']=1                 # unzip
  ['wget']=1                  # wget
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['zlib']=1                  # zlib1g
  ['libatomic']=1             # libatomic1

  # archlinux                 # ubi9
  ['which']=1                 # which.x86_64
)

declare -Ag _depends_r2023b=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['debianutils']=0           # debianutils
  ['alsa-lib']=1              # libasound2t64
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libcups']=0               # libcups2t64
  ['libdrm']=1                # libdrm2
  ['mesa']=1                  # libgbm1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['glib2']=1                 # libglib2.0-0t64
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk3']=0                  # libgtk-3-0t64
  ['libice']=1                # libice6
  ['libltdl']=0               # libltdl7
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['libsndfile']=1            # libsndfile1
  ['util-linux-libs']=1       # libuuid1
  ['wayland']=1               # libwayland-client0
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=0            # libxdamage1
  ['libxfixes']=1             # libxfixes3
  ['libxft']=1                # libxft2
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxt']=1                 # libxt6t64
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['glibc-locales']=0         # locales
  ['glibc-locales']=0         # locales-all
  ['make']=1                  # make
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['sudo']=0                  # sudo
  ['unzip']=1                 # unzip
  ['wget']=1                  # wget
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['zlib']=1                  # zlib1g
  ['libatomic']=1             # libatomic1

  # archlinux                 # ubi9
  ['which']=1                 # which.x86_64
)

declare -Ag _depends_r2023a=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['debianutils']=0           # debianutils
  ['alsa-lib']=1              # libasound2t64
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libxcrypt-compat']=1      # libcrypt1
  ['libcups']=0               # libcups2t64
  ['libdrm']=1                # libdrm2
  ['mesa']=1                  # libgbm1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['glib2']=1                 # libglib2.0-0t64
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk3']=0                  # libgtk-3-0t64
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
  ['util-linux-libs']=1       # libuuid1
  ['wayland']=1               # libwayland-client0
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=0            # libxdamage1
  ['libxfixes']=1             # libxfixes3
  ['libxft']=1                # libxft2
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxt']=1                 # libxt6t64
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['glibc-locales']=0         # locales
  ['glibc-locales']=0         # locales-all
  ['make']=1                  # make
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['sudo']=0                  # sudo
  ['unzip']=1                 # unzip
  ['wget']=1                  # wget
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['zlib']=1                  # zlib1g
  ['libatomic']=1             # libatomic1

  # archlinux                 # ubi9
  ['which']=1                 # which.x86_64
)

declare -Ag _depends_r2022b=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['debianutils']=0           # debianutils
  ['alsa-lib']=1              # libasound2t64
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libxcrypt-compat']=1      # libcrypt1
  ['libcups']=0               # libcups2t64
  ['libdrm']=1                # libdrm2
  ['mesa']=1                  # libgbm1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['glib2']=1                 # libglib2.0-0t64
  ['libgomp']=1               # libgomp1 TODO: untested
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk3']=0                  # libgtk-3-0t64
  ['libice']=1                # libice6
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['unixodbc']=1              # libodbc2 TODO: untested
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['libsndfile']=1            # libsndfile1
  ['util-linux-libs']=1       # libuuid1
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=0            # libxdamage1
  ['libxfixes']=1             # libxfixes3
  ['libxft']=1                # libxft2
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxt']=1                 # libxt6t64
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['glibc-locales']=0         # locales
  ['glibc-locales']=0         # locales-all
  ['make']=1                  # make
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['sudo']=0                  # sudo
  ['unzip']=1                 # unzip
  ['wget']=1                  # wget
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['zlib']=1                  # zlib1g
  ['libatomic']=1             # libatomic1

  # archlinux                 # ubi9
  ['which']=1                 # which.x86_64
)

declare -Ag _depends_r2022a=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['debianutils']=0           # debianutils
  ['alsa-lib']=1              # libasound2t64
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libxcrypt-compat']=1      # libcrypt1
  ['libcups']=0               # libcups2t64
  ['dbus']=1                  # libdbus-1-3 TODO: untested
  ['libdrm']=1                # libdrm2
  ['fontconfig']=1            # libfontconfig1
  ['mesa']=1                  # libgbm1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['glib2']=1                 # libglib2.0-0t64
  ['libgomp']=1               # libgomp1 TODO: untested
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk3']=0                  # libgtk-3-0t64
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['unixodbc']=1              # libodbc2 TODO: untested
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['libsm']=1                 # libsm6 TODO: untested
  ['libsndfile']=1            # libsndfile1
  ['util-linux-libs']=1       # libuuid1
  ['libx11']=1                # libx11-6 TODO: untested
  ['libx11']=1                # libx11-xcb1 TODO: untested
  ['libxcb']=1                # libxcb-dri3-0 TODO: untested
  ['libxcb']=1                # libxcb1 TODO: untested
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=1            # libxdamage1 TODO: untested
  ['libxext']=1               # libxext6
  ['libxfixes']=1             # libxfixes3
  ['libxft']=1                # libxft2
  ['libxi']=1                 # libxi6 TODO: untested
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxrender']=1            # libxrender1 TODO: untested
  ['libxt']=1                 # libxt6t64
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['glibc-locales']=0         # locales
  ['glibc-locales']=0         # locales-all
  ['make']=1                  # make
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['sudo']=0                  # sudo
  ['unzip']=1                 # unzip
  ['wget']=1                  # wget
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['zlib']=1                  # zlib1g
  ['libatomic']=1             # libatomic1

  # archlinux                 # ubi8
  ['which']=1                 # which.x86_64
)

declare -Ag _depends_r2021b=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['debianutils']=0           # debianutils
  ['alsa-lib']=1              # libasound2t64
  ['at-spi2-core']=1          # libatk-bridge2.0-0t64
  ['at-spi2-core']=1          # libatk1.0-0t64
  ['at-spi2-core']=1          # libatspi2.0-0t64
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libcap']=0                # libcap2
  ['libxcrypt-compat']=1      # libcrypt1
  ['libcups']=0               # libcups2t64
  ['dbus']=1                  # libdbus-1-3 TODO: untested
  ['libdrm']=1                # libdrm2
  ['fontconfig']=1            # libfontconfig1
  ['mesa']=1                  # libgbm1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['glib2']=1                 # libglib2.0-0t64
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk3']=0                  # libgtk-3-0t64
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['unixodbc']=1              # libodbc2 TODO: untested
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['libsm']=1                 # libsm6 TODO: untested
  ['libsndfile']=1            # libsndfile1
  ['util-linux-libs']=1       # libuuid1
  ['libx11']=1                # libx11-6 TODO: untested
  ['libx11']=1                # libx11-xcb1 TODO: untested
  ['libxcb']=1                # libxcb-dri3-0 TODO: untested
  ['libxcb']=1                # libxcb1 TODO: untested
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=1            # libxdamage1 TODO: untested
  ['libxext']=1               # libxext6
  ['libxfixes']=1             # libxfixes3
  ['libxft']=1                # libxft2
  ['libxi']=1                 # libxi6 TODO: untested
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxrender']=1            # libxrender1 TODO: untested
  ['libxt']=1                 # libxt6t64
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['glibc-locales']=0         # locales
  ['glibc-locales']=0         # locales-all
  ['make']=1                  # make
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['sudo']=0                  # sudo
  ['unzip']=1                 # unzip
  ['wget']=1                  # wget
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['zlib']=1                  # zlib1g
  ['libatomic']=1             # libatomic1
)

declare -Ag _depends_r2021a=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['debianutils']=0           # debianutils
  ['alsa-lib']=1              # libasound2t64
  ['at-spi2-core']=1          # libatk1.0-0t64
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libxcrypt-compat']=1      # libcrypt1
  ['libcups']=0               # libcups2t64
  ['dbus']=1                  # libdbus-1-3 TODO: untested
  ['fontconfig']=1            # libfontconfig1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk3']=0                  # libgtk-3-0t64
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['unixodbc']=1              # libodbc2 TODO: untested
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['libselinux']=0            # libselinux1 TODO: untested
  ['libsm']=1                 # libsm6 TODO: untested
  ['libsndfile']=1            # libsndfile1
  ['util-linux-libs']=1       # libuuid1
  ['libx11']=1                # libx11-6 TODO: untested
  ['libx11']=1                # libx11-xcb1 TODO: untested
  ['libxcb']=1                # libxcb1 TODO: untested
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=1            # libxdamage1 TODO: untested
  ['libxext']=1               # libxext6
  ['libxfixes']=1             # libxfixes3
  ['libxft']=1                # libxft2
  ['libxi']=1                 # libxi6 TODO: untested
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxrender']=1            # libxrender1 TODO: untested
  ['libxt']=1                 # libxt6t64
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['glibc-locales']=0         # locales
  ['glibc-locales']=0         # locales-all
  ['make']=1                  # make
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['sudo']=0                  # sudo
  ['unzip']=1                 # unzip
  ['wget']=1                  # wget
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['zlib']=1                  # zlib1g
  ['libatomic']=1             # libatomic1
)

declare -Ag _depends_r2020b=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['debianutils']=0           # debianutils
  ['alsa-lib']=1              # libasound2t64
  ['at-spi2-core']=1          # libatk1.0-0t64
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libxcrypt-compat']=1      # libcrypt1
  ['libcups']=0               # libcups2t64
  ['dbus']=1                  # libdbus-1-3 TODO: untested
  ['fontconfig']=1            # libfontconfig1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk3']=0                  # libgtk-3-0t64
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['libselinux']=0            # libselinux1 TODO: untested
  ['libsm']=1                 # libsm6 TODO: untested
  ['libsndfile']=1            # libsndfile1
  ['onetbb']=1                # libtbbmalloc2 TODO: untested
  # ['tcl8.6']=1                # libtcl8.6 TODO: package
  ['util-linux-libs']=1       # libuuid1
  ['libx11']=1                # libx11-6 TODO: untested
  ['libx11']=1                # libx11-xcb1 TODO: untested
  ['libxcb']=1                # libxcb1 TODO: untested
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=1            # libxdamage1 TODO: untested
  ['libxext']=1               # libxext6
  ['libxfixes']=1             # libxfixes3
  ['libxi']=1                 # libxi6 TODO: untested
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxrender']=1            # libxrender1 TODO: untested
  ['libxt']=1                 # libxt6t64
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['glibc-locales']=0         # locales
  ['glibc-locales']=0         # locales-all
  ['make']=1                  # make
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['sudo']=0                  # sudo
  ['unzip']=1                 # unzip
  ['wget']=1                  # wget
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['libatomic']=1             # libatomic1
)

declare -Ag _depends_r2020a=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['debianutils']=0           # debianutils
  ['alsa-lib']=1              # libasound2t64
  ['at-spi2-core']=1          # libatk-bridge2.0-0t64
  ['at-spi2-core']=1          # libatk1.0-0t64
  ['at-spi2-core']=1          # libatspi2.0-0t64
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libxcrypt-compat']=1      # libcrypt1
  ['libcups']=0               # libcups2t64
  ['dbus']=1                  # libdbus-1-3 TODO: untested
  ['libdrm']=1                # libdrm2
  ['fontconfig']=1            # libfontconfig1
  ['mesa']=1                  # libgbm1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['glib2']=1                 # libglib2.0-0t64
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk3']=0                  # libgtk-3-0t64
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['unixodbc']=1              # libodbc2 TODO: untested
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['libsm']=1                 # libsm6 TODO: untested
  ['libsndfile']=1            # libsndfile1
  ['util-linux-libs']=1       # libuuid1
  ['libx11']=1                # libx11-6 TODO: untested
  ['libx11']=1                # libx11-xcb1 TODO: untested
  ['libxcb']=1                # libxcb-dri3-0 TODO: untested
  ['libxcb']=1                # libxcb1 TODO: untested
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=1            # libxdamage1 TODO: untested
  ['libxext']=1               # libxext6
  ['libxfixes']=1             # libxfixes3
  ['libxft']=1                # libxft2
  ['libxi']=1                 # libxi6 TODO: untested
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxrender']=1            # libxrender1 TODO: untested
  ['libxt']=1                 # libxt6t64
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['glibc-locales']=0         # locales
  ['glibc-locales']=0         # locales-all
  ['make']=1                  # make
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['sudo']=0                  # sudo
  ['unzip']=1                 # unzip
  ['wget']=1                  # wget
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['zlib']=1                  # zlib1g
  ['libatomic']=1             # libatomic1
)

declare -Ag _depends_r2019b=(
  # archlinux                 # ubuntu24.04
  ['ca-certificates']=1       # ca-certificates
  ['debianutils']=0           # debianutils
  ['alsa-lib']=1              # libasound2t64
  ['at-spi2-core']=1          # libatk1.0-0t64
  ['glibc']=1                 # libc6
  ['cairo']=0                 # libcairo-gobject2
  ['cairo']=0                 # libcairo2
  ['libxcrypt-compat']=1      # libcrypt1
  ['libcups']=0               # libcups2t64
  ['dbus']=1                  # libdbus-1-3 TODO: untested
  ['fontconfig']=1            # libfontconfig1
  ['gdk-pixbuf2']=1           # libgdk-pixbuf-2.0-0
  ['libgl']=1                 # libgl1
  ['gst-plugins-base-libs']=1 # libgstreamer-plugins-base1.0-0
  ['gstreamer']=1             # libgstreamer1.0-0
  ['gtk3']=0                  # libgtk-3-0t64
  ['nspr']=1                  # libnspr4
  ['nss']=1                   # libnss3
  ['pam']=1                   # libpam0g
  ['pango']=1                 # libpango-1.0-0
  ['pango']=1                 # libpangocairo-1.0-0
  ['pango']=1                 # libpangoft2-1.0-0
  ['libselinux']=0            # libselinux1 TODO: untested
  ['libsm']=1                 # libsm6 TODO: untested
  ['libsndfile']=1            # libsndfile1
  ['onetbb']=1                # libtbbmalloc2 TODO: untested
  # ['tcl8.6']=1                # libtcl8.6 TODO: package
  ['util-linux-libs']=1       # libuuid1
  ['libx11']=1                # libx11-6 TODO: untested
  ['libx11']=1                # libx11-xcb1 TODO: untested
  ['libxcb']=1                # libxcb1 TODO: untested
  ['libxcomposite']=1         # libxcomposite1
  ['libxcursor']=0            # libxcursor1
  ['libxdamage']=1            # libxdamage1 TODO: untested
  ['libxext']=1               # libxext6
  ['libxfixes']=1             # libxfixes3
  ['libxi']=1                 # libxi6 TODO: untested
  ['libxinerama']=0           # libxinerama1
  ['libxrandr']=1             # libxrandr2
  ['libxrender']=1            # libxrender1 TODO: untested
  ['libxt']=1                 # libxt6t64
  ['libxtst']=0               # libxtst6
  ['libxxf86vm']=1            # libxxf86vm1
  ['glibc-locales']=0         # locales
  ['glibc-locales']=0         # locales-all
  ['make']=1                  # make
  ['net-tools']=0             # net-tools
  ['libprocps']=0             # procps
  ['sudo']=0                  # sudo
  ['unzip']=1                 # unzip
  ['wget']=1                  # wget
  ['xorg-setxkbmap']=0        # x11-xkb-utils
  ['xorg-xkbcomp']=0          # x11-xkb-utils
  ['xorg-xkbevd']=0           # x11-xkb-utils
  ['xorg-xkbprint']=0         # x11-xkb-utils
  ['xorg-xkbutils']=0         # x11-xkb-utils
  ['libatomic']=1             # libatomic1
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

package_matlab-meta() {
  pkgdesc+=" (meta)"
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

package_matlab-meta-all() {
  pkgdesc+=" (meta, all)"
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
  pkgdesc+=' (${_release}, meta)'
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
