class Patchy < Formula
  desc "Apache + mod_php dev server for macOS"
  homepage "https://github.com/joeworkman/patchy"
  url "https://github.com/joeworkman/patchy/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "d574420df5c7d0efa1fda4404041142336293838e8d168dea33e2f3d6f3633bc"
  license "MIT"

  depends_on "cloudflared"
  depends_on "httpd"
  depends_on "jq"
  depends_on "mkcert"
  depends_on "php"

  def install
    bin.install "bin/patchy"
    libexec.install Dir["libexec/*"]
  end

  def post_install
    system bin/"patchy", "setup"
  end

  test do
    assert_match "Patchy", shell_output("#{bin}/patchy help")
  end
end
