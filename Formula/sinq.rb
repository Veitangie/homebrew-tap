class Sinq < Formula
  desc "A concurrent HTTP functional and integration testing tool."
  homepage "https://github.com/Veitangie/sinq"
  url "https://github.com/Veitangie/sinq/archive/refs/tags/v1.0.0-rc.23.tar.gz"
  sha256 "ac6c33b53b5bb47f8d98ecb050bd541d776967a5d47621facd5ec6ea54864c4d"
  license "GPL-3.0-or-later"

  depends_on "go" => :build
  depends_on "go-md2man" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w -X 'main.version=v1.0.0-rc.23'", "-o", bin/"sinq", "./cmd/sinq"
    system "go-md2man", "-in", "docs/man.md", "-out", "sinq.1"
    man1.install "sinq.1"
    bash_completion.install "cmd/sinq/completions/sinq.bash" => "sinq"
    zsh_completion.install "cmd/sinq/completions/_sinq"
    fish_completion.install "cmd/sinq/completions/sinq.fish"
  end
end
