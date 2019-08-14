class Nxweb < Formula
  desc "Fast and Lightweight Web Server for Applications Written in C & Python"
  homepage "http://nxweb.org/"

  stable do
    url "https://bitbucket.org/yarosla/nxweb/downloads/nxweb-3.3.0-dev.tar.gz"
    sha256 "f901ccf5ef5c00e69d04f74ffb6551acb7d97f84d148064fb8342db51da79230"
  end

  head "https://bitbucket.org/yarosla/nxweb.git"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
