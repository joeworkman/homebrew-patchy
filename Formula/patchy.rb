class Patchy < Formula
  desc "Apache + mod_php dev server for macOS"
  homepage "https://github.com/joeworkman/patchy"
  url "https://github.com/joeworkman/patchy/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "aec3e405a11735b6e57a468339ebb844f55466b556d1c4bb8dc0ccbb95a72b14"
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
