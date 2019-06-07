class Zbar < Formula
  desc "Suite of barcodes-reading tools"
  homepage "https://github.com/mchehab/zbar"
  revision 9

  stable do
    url "https://linuxtv.org/downloads/zbar/zbar-0.23.tar.bz2"
    sha256 "e99fb8f3be85a76fe24784ad67fecb2da3a02b1e432696b05eefe212d448ad2e"
  end

  head "https://github.com/mchehab/zbar.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "freetype"
  depends_on "imagemagick"
  depends_on "jpeg"
  depends_on "libtool"
  depends_on "ufraw"
  depends_on "xz"

  def install
    args = %W[
      --prefix=#{prefix}
      --with-python=python3
      --without-qt
      --disable-video
      --without-gtk
      --without-x
    ]

    system "autoreconf", "-fvi"
    system "./configure", *args
    system "make", "install"
  end

  test do
    system bin/"zbarimg", "-h"
  end
end
