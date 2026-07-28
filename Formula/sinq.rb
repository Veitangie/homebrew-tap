class Sinq < Formula
  desc "A concurrent HTTP functional and integration testing tool."
  homepage "https://github.com/Veitangie/sinq"
  url "https://github.com/Veitangie/sinq/archive/refs/tags/v1.0.0-rc.15.tar.gz"
  sha256 "66440e046962b5c8947ea2d0e2a4ae4447bc248fb6a734220956ba4f49d260e5"
  license "GPL-3.0-or-later"

  depends_on "go" => :build
  depends_on "go-md2man" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w -X 'main.versionConstPart=sinq v1.0.0-rc.15 - '", "-o", bin/"sinq", "./cmd/sinq"
    system "go-md2man", "-in", "docs/man.md", "-out", "sinq.1"
    man1.install "sinq.1"
  end
end
