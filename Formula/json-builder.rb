class JsonBuilder < Formula
  desc "The serializing counterpart to json-parser."
  homepage "https://github.com/udp/json-builder"
  revision 1

  head "https://github.com/udp/json-builder.git"

  depends_on "cmake" => :build
  depends_on "json-parser" => ["HEAD"]

  def install
    args = %W[
      -DCMAKE_C_FLAGS="-I/usr/local/include/json-parser"
    ]

    system "cmake", ".", *std_cmake_args, *args
    system "make", "install"
  end
end
