class Kore < Formula
  desc "Web application framework for writing web APIs in C"
  homepage "https://kore.io/"

  stable do
    url "https://kore.io/releases/kore-3.3.1.tar.gz"
    sha256 "c80d7a817883e631adf9eb5271b4ffa6ebb06c2e2fca40ce6c3c75638c08b67a"
  end

  head "https://github.com/jorisvink/kore.git"

  depends_on :macos => :sierra # needs clock_gettime

  depends_on "openssl"

  def install
    # Ensure make finds our OpenSSL when Homebrew isn't in /usr/local.
    # Current Makefile hardcodes paths for default MacPorts/Homebrew.
    ENV.prepend "CFLAGS", "-I#{Formula["openssl"].opt_include}"
    ENV.prepend "LDFLAGS", "-L#{Formula["openssl"].opt_lib}"
    # Also hardcoded paths in src/cli.c at compile.
    inreplace "src/cli.c", "/usr/local/opt/openssl/include",
                            Formula["openssl"].opt_include

    system "make", "PREFIX=#{prefix}", "TASKS=1", "NOTLS=1", "DEBUG=1"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    system bin/"kodev", "create", "test"
    cd "test" do
      system bin/"kodev", "build"
      system bin/"kodev", "clean"
    end
  end
end
