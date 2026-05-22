class Patchy < Formula
  desc "Apache + mod_php dev server for macOS"
  homepage "https://github.com/joeworkman/patchy"
  url "https://github.com/joeworkman/patchy/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "bac914964056818cad9228547dc80e23690f8219a2758fcd87e9ddf70b616119"
  license "MIT"

  depends_on "hostess"
  depends_on "httpd"
  depends_on "jq"
  depends_on "mkcert"
  depends_on "php"

  def install
    bin.install "bin/patchy"
  end

  def post_install
    system bin/"patchy", "install"
  end

  test do
    assert_match "Patchy", shell_output("#{bin}/patchy help")
  end
end
