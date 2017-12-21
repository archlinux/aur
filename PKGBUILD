# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The ability to check code against style conventions using uncrustify and generate xUnit test result files."
url='http://www.ros.org/'

pkgname='ros-ardent-ament-uncrustify'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-uncrustify)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/ament_uncrustify/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/ament_lint-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ament_lint-release-release-ardent-ament_uncrustify-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/ament_lint-release/archive/release/ardent/ament_uncrustify/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('a4446e5336d1f2bd4623d724760c51fb023edfcc7b757f123a2218bc04d79c7f')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}
