class Libqb < Formula
  desc "A library providing high performance logging, tracing, ipc, and poll."
  homepage "https://github.com/ClusterLabs/libqb"
  revision 1

  stable do
    url "https://github.com/ClusterLabs/libqb/releases/download/v1.0.5/libqb-1.0.5.tar.xz"
    sha256 "277b86122839591da97e43fd761771b19924b2264f25ac4f1204a9e35182b82c"
  end

  head "https://github.com/ClusterLabs/libqb.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    args = %W[
      --prefix=#{prefix}
    ]

    system "./autogen.sh"
    system "./configure", *args
    system "make"
    system "make", "install"
  end
end
