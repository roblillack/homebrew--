class Newmail < Formula
  desc "Command-line tool to check for new/unread mail in a Maildir++ folder structure"
  homepage "https://burningsoda.com/software/newmail/"
  url "https://burningsoda.com/software/newmail/newmail-1.0.tgz"
  sha256 "ed05dd73ac1c0130642378205fce0dc81d855e1dca96e65cf977d5b21d20cec7"
  license "BSD-2-Clause"

  depends_on "make" => :build

  def install
    system "make", "newmail"
    bin.install "newmail"
    man1.install "newmail.1"
  end
end
