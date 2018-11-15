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
