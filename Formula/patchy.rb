class Patchy < Formula
  desc "Apache + mod_php dev server for macOS"
  homepage "https://github.com/joeworkman/patchy"
  url "https://github.com/joeworkman/patchy/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "3edcaded329a180ee6c58fe9e3fe3543b65584cf861487239eb0a60b5fdb13cf"
  license "MIT"

  depends_on "cloudflared"
  depends_on "httpd"
  depends_on "jq"
  depends_on "mkcert"
  depends_on "php"

  def install
    bin.install "bin/patchy"
    libexec.install Dir["libexec/*"]
    doc.install "README.md"
    # The Alfred workflow ships from v1.4.0; older tarballs don't have it.
    if File.directory?("alfred")
      pkgshare.install "alfred"
      rm_r pkgshare/"alfred/tests"
    end
  end

  def post_install
    system bin/"patchy", "setup"
  end

  test do
    assert_match "Patchy", shell_output("#{bin}/patchy help")
  end
end
