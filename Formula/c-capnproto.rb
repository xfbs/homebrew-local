class CCapnproto < Formula
  desc "C library/compiler for the Cap'n Proto serialization/RPC protocol"
  homepage "https://github.com/opensourcerouting/c-capnproto"
  revision 1

  stable do
    url "https://github.com/opensourcerouting/c-capnproto/releases/download/c-capnproto-0.3/c-capnproto-0.3.tar.xz"
    sha256 "215bc921b5196d0e52a2a8a65d99b80f6a3c0c4413300736fd961c174cf79937"
  end

  head "https://github.com/opensourcerouting/c-capnproto.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "libtool" => :build
  depends_on "capnp"

  def install
    args = %W[
      --prefix=#{prefix}
    ]

    system "autoreconf", "-fis"
    system "./configure", *args
    system "make", "install"
  end
end
