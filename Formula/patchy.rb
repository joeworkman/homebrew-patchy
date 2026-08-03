class Patchy < Formula
  desc "Apache + mod_php dev server for macOS"
  homepage "https://github.com/joeworkman/patchy"
  url "https://github.com/joeworkman/patchy/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "2719896828d0f60cf6555076bc001c894298d26de1cc188d1915d35b4072acc2"
  license "MIT"

  depends_on "dnsmasq"
  depends_on "httpd"
  depends_on "jq"
  depends_on "mkcert"
  depends_on "php"

  def install
    bin.install "bin/patchy"
  end

  def post_install
    system bin/"patchy", "setup"
  end

  test do
    assert_match "Patchy", shell_output("#{bin}/patchy help")
  end
end
