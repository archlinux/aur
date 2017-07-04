class IosevkaGenerate < Formula
  desc "Tool to generate custom Iosevka fonts from a configuration file"
  homepage "https://github.com/OJFord/iosevka-generate"
  head "https://github.com/OJFord/iosevka-generate.git", :branch => "master"

  depends_on :python3
  depends_on "make"
  depends_on "node"
  depends_on "caryll/tap/otfcc-mac64"
  depends_on "ttfautohint"

  resource "GitPython" do
    url "https://files.pythonhosted.org/packages/6d/c1/d1c852f787a1ad4fd8346603e520e2b8b886158f177276cd8c2acf594001/GitPython-2.1.5.tar.gz"
    sha256 "5c00cbd256e2b1d039381d4f7d71fcb7ee5cc196ca10c101ff7191bd82ab5d9c"
  end

  resource "gitdb" do
    url "https://files.pythonhosted.org/packages/e3/95/7e5d7261feb46c0539ac5e451be340ddd64d78c5118f2d893b052c76fe8c/gitdb-0.6.4.tar.gz"
    sha256 "a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658"
  end

  resource "pyxdg" do
    url "https://files.pythonhosted.org/packages/26/28/ee953bd2c030ae5a9e9a0ff68e5912bd90ee50ae766871151cd2572ca570/pyxdg-0.25.tar.gz"
    sha256 "81e883e0b9517d624e8b0499eb267b82a815c0b7146d5269f364988ae031279d"
  end

  resource "smmap" do
    url "https://files.pythonhosted.org/packages/bc/aa/b744b3761fff1b10579df996a2d2e87f124ae07b8336e37edc89cc502f86/smmap-0.9.0.tar.gz"
    sha256 "0e2b62b497bd5f0afebc002eda4d90df9d209c30ef257e8673c90a6b5c119d62"
  end

  include Language::Python::Virtualenv

  def install
    venv = virtualenv_create(libexec, python="python3")
    venv.pip_install resources
    venv.pip_install_and_link buildpath
  end

  test do
    system "true"
  end
end
