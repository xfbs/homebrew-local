class Passgen < Formula
  desc "Regex-based password generator."
  homepage "https://github.com/xfbs/passgen"
  revision 0

  stable do
    url "https://github.com/xfbs/passgen/archive/v0.1.2.tar.gz"
    sha256 "c4fb739f57e71c69a7ba34863ac240e2eb6113da174dd4073cf20f9148e94f8a"
  end

  head "https://github.com/xfbs/passgen.git"

  depends_on "utf8proc"
  depends_on "libsodium"
  depends_on "jansson"
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

  test do
    bin/"passgen"
  end
end
