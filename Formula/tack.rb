class Tack < Formula
  desc "Sustainable static site generator"
  homepage "https://burningsoda.com/software/tack"
  url "https://burningsoda.com/software/tack/download/tack-1.3.0.tar.gz"
  sha256 "c9e7dc325e717a0a1c7897997debec27259a1856a3f53358812b42ec63c11cc0"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X github.com/roblillack/tack/commands.Version=v#{version}", *std_go_args
    man.mkpath
    man1.install "tack.1"
  end

  test do
    mkdir "content"
    mkdir "templates"
    (testpath/"content/default.yaml").write "who: World"
    (testpath/"templates/default.mustache").write "Hello {{who}}!"
    system "tack"
    assert_predicate testpath/"output/index.html", :exist?
    assert_equal "Hello World!", (testpath/"output/index.html").read.strip
  end
end
