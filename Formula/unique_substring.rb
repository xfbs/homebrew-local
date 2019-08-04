class UniqueSubstring < Formula
  desc "Finding unique substrings in C."
  homepage "https://github.com/xfbs/unique_substrings"
  revision 0

  stable do
    url "https://github.com/xfbs/unique_substring/archive/v0.1.0.tar.gz"
    sha256 "adfcc69ceaff5850736264cd116968f18aef4ac3abe58bf61ce191f19e979dc7"
  end

  head "https://github.com/xfbs/unique_substring.git"

  depends_on "meson" => :build
  depends_on "ninja" => :build

  def install
    mkdir "build" do
      system "meson", "--prefix=#{prefix}"
      system "ninja"
      system "ninja", "install"
    end
  end

  test do
    system bin/"unique_substring"
  end
end
