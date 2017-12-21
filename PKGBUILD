# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Commonly needed Python modules, used by Python software developed at OSRF."
url='http://www.ros.org/'

pkgname='ros-ardent-osrf-pycommon'
pkgver='0.1.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=()
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/osrf_pycommon/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/osrf_pycommon-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="osrf_pycommon-release-release-ardent-osrf_pycommon-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/osrf_pycommon-release/archive/release/ardent/osrf_pycommon/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('c0ff531d4fc96cbbeceac25bf0578bdec3a3e43b71163caf96d4b53ae09f4f57')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}
