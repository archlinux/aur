# Building a custom waf binary

Waf is primarily intended to be distributed with the project using it. The Arch Linux package makes waf usable directly, but also brings all files necessary to compose a custom binary for your project. To do so, create a temporary directory, link all the resources together and build it.

```bash
cd $(mktemp -d)
ln -s /usr/share/waf/wscript .
ln -s /usr/bin/waf waf-light
ln -s /usr/lib/waf/waflib .
mkdir zip
waf configure build --make-waf --tools=''
```

The last line allows you to choose tools to include.

After this process, there should be a `waf` binary ready in the current working directory.


## Building an older version for current Python

Especially after version 2 introduced API-breaking changes, some projects may have become incompatible and require older waf versions to build. Fortunately, they mostly stay available online and can be retrieved directly in binary form with a command like

```bash
wget -O waf http://ftp.waf.io/pub/release/waf-1.2.3
chmod 755 waf
```

Unfortunately, a change in language library makes these impossible to run on Python version 3.7 or up. However, by applying the necessary change that made waf 2.0.7 compatible to newer Python versions, a compatible binary can still be built. The patch should apply even on older versions. This can be achieved through a build process similar to the one described above, extended with the download of an older waf version and patch.

```bash
wget 'https://waf.io/waf-1.8.22.tar.bz2'
wget 'https://gitlab.com/ita1024/waf/commit/facdc0b173d933073832c768ec1917c553cb369c.patch'
tar xjf waf-*.tar.bz2
rm waf-*.tar.bz2
cd waf-*
patch -p1 -i ../*.patch
./waf-light configure build --make-waf --tools=''
```
