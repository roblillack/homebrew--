class Tack < Formula
  desc "Sustainable static site generator"
  homepage "https://burningsoda.com/software/tack"
  url "https://burningsoda.com/software/tack/download/tack-1.0.0.tar.gz"
  sha256 "f52d435353d011f12a37d3b6c6c8aeda97c161f13e1fa2122475f25dc3e2837e"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    site = testpath/"mysite"
    system "#{bin}/tack", "tack", site
    assert_predicate testpath/"#{site}/output", :exist?
  end
end
