class Passgen < Formula
  desc "Regex-based password generator."
  homepage "https://github.com/xfbs/passgen"
  revision 0

  stable do
    url "https://github.com/xfbs/passgen/archive/v0.1.1.tar.gz"
    sha256 "7e94f9f7944504817d1fb859305a8d4e813b7987dc70bed1ff1ad41a72107c45"
  end

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

  test do
    bin/"passgen"
  end
end
