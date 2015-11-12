from setuptools import setup, find_packages

setup(
    name='pypi2deb',
    description='pypi to debian package converter helper',
    author='Piotr Ożarowski',
    author_email='piotr@debian.org',
    version=1.20151018,
    url='https://github.com/p1otr/pypi2deb',
    packages=find_packages(),
    scripts=['py2dsp','pypi2debian'],
    include_package_data = True,
    data_files = [
      ('/usr/share/pypi2deb/overrides/mako' , ['overrides/mako/ctx.json'] ),
      ('/usr/share/pypi2deb/profiles/dpmt' , ['profiles/dpmt/ctx.json'] ),
      ('/usr/share/pypi2deb/profiles/openstack' , ['profiles/openstack/ctx.json'] ),
      ('/usr/share/pypi2deb/profiles/openstack/debian' , ['profiles/openstack/debian/gbp.conf'] ),
      ('/usr/share/pypi2deb/profiles/papt' , ['profiles/papt/ctx.json'] ),
      ('/usr/share/pypi2deb/templates' , ['templates/itp.mail'] ),
      ('/usr/share/pypi2deb/templates/debian' , ['templates/debian/compat'] ),
      ('/usr/share/pypi2deb/templates/debian' , ['templates/debian/control.tpl'] ),
      ('/usr/share/pypi2deb/templates/debian' , ['templates/debian/copyright.tpl'] ),
      ('/usr/share/pypi2deb/templates/debian' , ['templates/debian/rules.tpl'] ),
      ('/usr/share/pypi2deb/templates/debian' , ['templates/debian/watch.tpl'] ), 
      ('/usr/share/pypi2deb/templates/debian/source' , ['templates/debian/source/format'] ),
      ('/usr/share/pypi2deb/templates/debian/source' , ['templates/debian/source/options'] ) ]
)
