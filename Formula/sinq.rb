class Sinq < Formula
  desc "A concurrent HTTP functional and integration testing tool."
  homepage "https://github.com/Veitangie/sinq"
  url "https://github.com/Veitangie/sinq/archive/refs/tags/v1.0.0-rc.18.tar.gz"
  sha256 "b0fedeab30984841d5d529d90cac395cd0c60447bcae1ea5b78e3d42dfdbfff8"
  license "GPL-3.0-or-later"

  depends_on "go" => :build
  depends_on "go-md2man" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags", "-s -w -X 'main.versionConstPart=sinq v1.0.0-rc.18 - '", "-o", bin/"sinq", "./cmd/sinq"
    system "go-md2man", "-in", "docs/man.md", "-out", "sinq.1"
    man1.install "sinq.1"
    bash_completion.install "cmd/sinq/completions/sinq.bash" => "sinq"
    zsh_completion.install "cmd/sinq/completions/_sinq"
    fish_completion.install "cmd/sinq/completions/sinq.fish"
  end
end
