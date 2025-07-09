class Plakar < Formula
  desc "Create backups with compression, encryption and deduplication"
  homepage "https://plakar.io"
  url "https://github.com/PlakarKorp/plakar/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "425f551c5ade725bb93e3e33840b1d16187a6f8ec47abfe4830deefc5b70b2f8"
  license "ISC"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match version.to_s, shell_output(bin/"plakar version")

    system bin/"plakar", "create", "-no-encryption"
    system bin/"plakar", "agent"

    sleep 5 # Allow agent to start
    assert_match "Version: 1.0.0", shell_output(bin/"plakar info")
  end
end
