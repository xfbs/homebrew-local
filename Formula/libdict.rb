class Libdict < Formula
  desc "C library of key-value data structures."
  homepage "https://github.com/fmela/libdict"
  revision 0

  head "https://github.com/xfbs/libdict.git"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "cunit"

  def install
    mkdir "build" do
      system "meson", "--prefix=#{prefix}"
      system "ninja"
      system "ninja", "install"
    end
  end
end
