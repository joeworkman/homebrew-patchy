class Patchy < Formula
  desc "Apache + mod_php dev server for macOS"
  homepage "https://github.com/joeworkman/patchy"
  url "https://github.com/joeworkman/patchy/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "f5179aa25981b80b528bbea82d0c7e1063754bdb85979b577018e10ed98c4dae"
  license "MIT"

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
