class Passgen < Formula
  desc "Regex-based password generator."
  homepage "https://github.com/xfbs/passgen"
  revision 1

  head "https://github.com/xfbs/passgen.git"

  depends_on "utf8proc"
  depends_on "libsodium"
  depends_on "pkg-config" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build

  def install
    args = %W[
      PREFIX=#{prefix}
    ]

    system "make", *args
    system "make", "install"
  end
end
