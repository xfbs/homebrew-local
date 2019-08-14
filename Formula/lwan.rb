class Lwan < Formula
  desc "Experimental, scalable, high performance HTTP server"
  homepage "https://lwan.ws"

  stable do
    url "https://github.com/lpereira/lwan/archive/v0.2.tar.gz"
    sha256 "932483eddd27393e7a9d28b507cebc88e7009d88cfea728a1e929f3feb7188be"
  end

  head "https://github.com/lpereira/lwan.git"

  depends_on :macos => :sierra # needs clock_gettime

  depends_on "cmake"
  depends_on "mysql-connector-c"
  depends_on "sqlite"
  depends_on "lua@5.1"
  depends_on "pkg-config"

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end
end
