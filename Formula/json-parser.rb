class JsonParser < Formula
  desc "Very low footprint JSON parser written in portable ANSI C."
  homepage "https://github.com/udp/json-parser"
  revision 1

  stable do
    url "https://github.com/udp/json-parser/archive/v1.1.0.tar.gz"
    sha256 "5c278793269dbbf98d5f1592c797234581df69088d2838a14154b4af52ebd133"
  end

  head "https://github.com/udp/json-parser.git"

  depends_on "cmake" => :build

  def install
    args = %W[
      --prefix=#{prefix}
    ]

    system "./configure", *args
    system "make"

    ENV.deparallelize

    system "make", "install"
  end
end
