#!/usr/bin/env python2


from __future__ import print_function

import catkin_pkg.package
from optparse import OptionParser
import os
import os.path
import subprocess
import urllib2
import urlparse
import yaml


class PackageBase(object):

  def __init__(self, distro, repository_url, name, version):
    self.packages = []
    self.distro = distro
    self.repository_url = repository_url
    package = self._parse_package_file(
      self._get_package_xml_url(repository_url, name, version))
    self.name = package.name
    self.version = package.version
    self.licenses = package.licenses
    self.description = package.description
    self.dependencies = [self._ensure_python2_dependency(dependency.name)
                         for dependency in package.build_depends + package.run_depends]
    
  def _parse_package_file(self, url):
    """
    Parses the package.xml file specified by `url`.
    
    Arguments:
    - `url`: Valid URL pointing to a package.xml file.
    """
    return catkin_pkg.package.parse_package_string(
      urllib2.urlopen(url).read())

  def _get_ros_dependencies(self):
    known_packages = self.distro.package_names(expand_metapackages=True)
    return list(set(
        [self._rosify_package_name(
            'ros-%s-' % self.distro.name + dependency)
         for dependency in self.dependencies if dependency in known_packages]))
  
  def _get_non_ros_dependencies(self):
    known_packages = self.distro.package_names(expand_metapackages=True)
    return list(set([dependency for dependency in self.dependencies
                     if dependency not in known_packages]))

  def _rosify_package_name(self, name):
    return name.replace('_', '-')

  def _ensure_python2_dependency(self, dependency):
    return dependency.replace('python-', 'python2-')

  def _get_package_xml_url(self, url, name, version):
    if url.find('github'):
      return github_raw_url(url, 'package.xml', 'release/%s/%s' % (name, version))
    else:
      raise 'Unable to generate url for package.xml'

  def generate(self, exclude_dependencies=[]):
    raise '`generate` not implemented.'


class Package(PackageBase):
  BUILD_TEMPLATE = """
pkgdesc="%(description)s"
url='http://www.ros.org/'

pkgname='ros-%(distro)s-%(arch_package_name)s'
pkgver='%(package_version)s'
arch=('i686' 'x86_64')
pkgrel=1
license=('%(license)s')
makedepends=('ros-build-tools')

ros_depends=(%(ros_package_dependencies)s)
depends=(${ros_depends[@]}
  %(other_dependencies)s)

source=()
md5sums=()

build() {
  [ -f /opt/ros/%(distro)s/setup.bash ] && source /opt/ros/%(distro)s/setup.bash
  if [ -d ${srcdir}/%(package_name)s ]; then
    cd ${srcdir}/%(package_name)s
    git fetch origin --tags
    git reset --hard release/%(package_name)s/${pkgver}
  else
    git clone -b release/%(package_name)s/${pkgver} %(package_url)s ${srcdir}/%(package_name)s
  fi
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build
  /usr/share/ros-build-tools/fix-python-scripts.sh ${srcdir}/%(package_name)s
  cmake ${srcdir}/%(package_name)s -DCATKIN_BUILD_BINARY_PACKAGE=ON -DCMAKE_INSTALL_PREFIX=/opt/ros/%(distro)s -DPYTHON_EXECUTABLE=/usr/bin/python2 -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
"""

  def generate(self, exclude_dependencies=[]):
    ros_dependencies = [dependency for dependency in self._get_ros_dependencies()
                        if dependency not in exclude_dependencies]
    other_dependencies = [dependency for dependency in self._get_non_ros_dependencies()
                          if dependency not in exclude_dependencies]
    return self.BUILD_TEMPLATE % {
      'distro': self.distro.name,
      'arch_package_name': self._rosify_package_name(self.name),
      'package_name': self.name,
      'package_version': self.version,
      'package_url': self.repository_url,
      'license': ', '.join(self.licenses),
      'description': self.description.replace('"', '\\"').replace('`', '\`'),
      'ros_package_dependencies': '\n  '.join(ros_dependencies),
      'other_dependencies': '\n  '.join(other_dependencies)
      }


class MetaPackage(PackageBase):
  BUILD_TEMPLATE = """
pkgdesc="%(description)s"
url='http://www.ros.org/'

pkgname='ros-%(distro)s-%(arch_package_name)s'
pkgver='%(package_version)s'
arch=('i686' 'x86_64')
pkgrel=1
license=('%(license)s')
makedepends=('ros-build-tools')

ros_depends=(%(ros_package_dependencies)s)
depends=(${ros_depends[@]}
  %(other_dependencies)s)

source=()
md5sums=()

"""
  
  def __init__(self, distro, repository_url, name, version):
    super(MetaPackage, self).__init__(distro, repository_url, name, version)
    self.packages = [Package(distro, repository_url, child_name, version)
                     for child_name in distro.meta_package_package_names(name)]

  def generate(self, exclude_dependencies=[]):
    ros_dependencies = [dependency for dependency in self._get_ros_dependencies()
                        if dependency not in exclude_dependencies]
    other_dependencies = [dependency for dependency in self._get_non_ros_dependencies()
                          if dependency not in exclude_dependencies]
    return self.BUILD_TEMPLATE % {
      'distro': self.distro.name,
      'arch_package_name': self._rosify_package_name(self.name),
      'package_name': self.name,
      'package_version': self.version,
      'license': ', '.join(self.licenses),
      'description': self.description.replace('"', '\"'),
      'ros_package_dependencies': '\n  '.join(ros_dependencies),
      'other_dependencies': '\n  '.join(other_dependencies)
      }

  
class DistroDescription(object):

  def __init__(self, name, url):
    stream = urllib2.urlopen(url)
    self.name = name
    self._distro = yaml.load(stream)
    self._package_cache = {}
    if self.name != self._distro['release-name']:
      raise 'ROS distro names do not match (%s != %s)' % (self.name, self._distro['release-name'])

  def package_names(self, expand_metapackages=False):
    packages = [name for name in self._distro['repositories'].keys()]
    if expand_metapackages:
      return sum([([name] + self.meta_package_package_names(name)) if self._is_meta_package(name) else [name]
                  for name in packages],
                 [])
    else:
      return packages

  def is_package(self, name):
    return self._get_package_data(name) != None

  def package(self, name):
    package_data = self._get_package_data(name)
    if not package_data:
      raise 'Unable to find package `%s`' % name
    if self._package_cache.get(name):
      return self._package_cache[name]
    url = package_data['url']
    version = package_data['version'].split('-')[0]
    if self._is_meta_package(name):
      package = MetaPackage(self, url, name, version)
    else:
      package = Package(self, url, name, version)
    self._package_cache[name] = package
    return package

  def meta_package_package_names(self, name):
    return self._distro['repositories'][name]['packages'].keys()

  def _is_meta_package(self, name):
    if self._distro['repositories'].get(name):
      return (self._distro['repositories'][name].get('packages') != None)

  def _get_package_data(self, name):
    """Searches for `name` in all known packages and metapackages."""
    if self._distro['repositories'].get(name):
      return self._distro['repositories'][name]
    else:
      for package in self.package_names():
        if (self._is_meta_package(package)
            and name in self._distro['repositories'][package]['packages']):
          return self._distro['repositories'][package]


def list_packages(distro_description):
  print(*distro_description.package_names(), sep='\n')


### From http://code.activestate.com/recipes/577058/ (r2)
def query_yes_no(question, default="yes"):
  """Ask a yes/no question via raw_input() and return their answer.
  
  "question" is a string that is presented to the user.
  "default" is the presumed answer if the user just hits <Enter>.
      It must be "yes" (the default), "no" or None (meaning
      an answer is required of the user).

  The "answer" return value is one of "yes" or "no".
  """
  valid = {"yes":"yes",   "y":"yes",  "ye":"yes",
           "no":"no",     "n":"no"}
  if default == None:
      prompt = " [y/n] "
  elif default == "yes":
      prompt = " [Y/n] "
  elif default == "no":
      prompt = " [y/N] "
  else:
      raise ValueError("invalid default answer: '%s'" % default)
  while True:
      print(question + prompt)
      choice = raw_input().lower()
      if default is not None and choice == '':
          return default
      elif choice in valid.keys():
          return valid[choice]
      else:
          print("Please respond with 'yes' or 'no' (or 'y' or 'n').")


def github_raw_url(repo_url, path, commitish):
  """
  Returns the URL of the file blob corresponding to `path` in the
  github repository `repo_url` in branch, commit or tag `commitish`.
  """
  url = urlparse.urlsplit(repo_url)
  return 'https://raw.%(host)s%(repo_path)s/%(branch)s/%(path)s' % {
    'host': url.hostname,
    'repo_path': url.path.replace('.git', ''),
    'branch': commitish,
    'path': path
    }


def generate_pkgbuild(distro, package, directory, force=False,
                      no_overwrite=False, recursive=False, exclude_dependencies=[],
                      generated=None):
  if generated is None:
    generated = []
  elif package.name in generated:
    return
  generated.append(package.name)  
  if package.packages:
    for child_package in package.packages:
      generate_pkgbuild(distro, child_package, directory,
                        force=force, exclude_dependencies=exclude_dependencies,
                        no_overwrite=no_overwrite, recursive=recursive,
                        generated=generated)
  if recursive:
    for dependency in package.dependencies:
      if distro.is_package(dependency):
        generate_pkgbuild(distro, distro.package(dependency), directory,
                          force=force, no_overwrite=no_overwrite, recursive=recursive,
                          exclude_dependencies=exclude_dependencies,
                          generated=generated)
  output_directory = os.path.join(directory, package.name)
  if not os.path.exists(output_directory):
    os.mkdir(output_directory)
  if os.path.exists(os.path.join(output_directory, 'PKGBUILD')):
    if no_overwrite:
      return
    if not force and not query_yes_no(
      "Directory '%s' already contains a PKGBUILD file. Overwrite?" % (
        output_directory)):
      return
  print('Generating PKGBUILD for package %s.' % package.name)
  with open(os.path.join(output_directory, 'PKGBUILD'), 'w') as pkgbuild:
    pkgbuild.write(package.generate(exclude_dependencies))


def main():
  parser = OptionParser(usage='usage: %prog [options] PACKAGE...')
  parser.add_option('--distro', default='groovy', metavar='distro',
                    help='Select the ROS distro to use.')
  parser.add_option('--list-packages', dest='list_packages', action='store_true',
                    default=False, help='Lists all available packages.')
  parser.add_option('--output-directory', metavar='output_directory', default='.',
                    help='The output directory. Packages are put into <output-directory>/<name>')
  parser.add_option(
    '--distro-url', metavar='distro_url',
    default='https://raw.github.com/ros/rosdistro/master/releases/%s.yaml',
    help='The URL of the distro description. %s is replaced by the actual distro name')
  parser.add_option(
    '--exclude-dependencies', metavar='exclude_dependencies',
    default='python2-catkin-pkg,python2-rospkg,python2-rosdep',
    help='Comma-separated list of (source) package dependencies to exclude from the generated PKGBUILD file.')
  parser.add_option('-f', '--force', dest='force', action='store_true', default=False,
                    help='Always overwrite exiting PKGBUILD files.')
  parser.add_option('-n', '--no-overwrite', dest='no_overwrite', action='store_true', default=False,
                    help='Do not overwrite PKGBUILD files.')
  parser.add_option('--recursive', dest='recursive', action='store_true', default=False,
                    help='Recursively import dependencies')
  options, args = parser.parse_args()

  distro = DistroDescription(
    options.distro, url=options.distro_url % options.distro)
  if options.list_packages:
    list_packages(distro)
    return
  elif args:
    for package in args:
      generate_pkgbuild(distro, distro.package(package),
                        os.path.abspath(options.output_directory),
                        exclude_dependencies=options.exclude_dependencies.split(','),
                        force=options.force, no_overwrite=options.no_overwrite,
                        recursive=options.recursive)
  else:
    parser.error('No packages specified.')


if __name__ == '__main__':
  main()
