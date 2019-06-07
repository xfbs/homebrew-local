class Authenticator < Formula
  include Language::Python::Virtualenv

  desc "A Two-Factor Authentication application"
  homepage "https://gitlab.gnome.org/World/Authenticator/"
  revision 0

  stable do
    url "https://gitlab.gnome.org/World/Authenticator/-/archive/3.32.1/Authenticator-3.32.1.tar.bz2"
    sha256 "6b12f114f4fa83bbbb382106fd57c092c88f76c07d7a7cea2a998d7471546471"
  end

  head "https://gitlab.gnome.org/World/Authenticator.git"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  #depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "python"
  depends_on "glib"
  depends_on "gobject-introspection"
  depends_on "gtk+3"
  depends_on "libsecret"
  depends_on "xfbs/local/zbar"
  depends_on "zlib"

  def install
    venv = virtualenv_create(libexec, "python3")
    system libexec/"bin/pip3", "install", "-r", "requirements.txt"

    mkdir "build" do
      system "meson", "--prefix=#{prefix}"
      system "ninja"
      system "ninja", "install"
    end

    venv.pip_install_and_link buildpath
  end

  test do
    system bin/"authenticator", "-h"
  end
end
