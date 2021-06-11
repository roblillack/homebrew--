class Tack < Formula
  desc "Sustainable static site generator"
  homepage "https://burningsoda.com/software/tack"
  url "https://burningsoda.com/software/tack/download/tack-1.1.0.tar.gz"
  sha256 "30efd5a25e889e0d3b4c3333baf147e9bedf1ab32967cbd284fc2026fd7b227a"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
    # bin.install "tack"
    man.mkpath
    man1.install "tack.1"
  end

  test do
    system "go", "test", "./..."
  end
end
