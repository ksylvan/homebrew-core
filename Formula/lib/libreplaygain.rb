class Libreplaygain < Formula
  desc "Library to implement ReplayGain standard for audio"
  homepage "https://www.musepack.net/"
  url "https://files.musepack.net/source/libreplaygain_r475.tar.gz"
  version "r475"
  sha256 "8258bf785547ac2cda43bb195e07522f0a3682f55abe97753c974609ec232482"
  license "LGPL-2.1-or-later"

  livecheck do
    url "https://www.musepack.net/index.php?pg=src"
    regex(/href=.*?libreplaygain[._-](r\d+)\.t/i)
  end

  no_autobump! because: :requires_manual_review

  bottle do
    rebuild 1
    sha256 cellar: :any,                 arm64_sequoia:  "72f8e66bd85dbe08e01f9aad98d73a4788a030f34a3f8e40e940c6a62a7fbfc7"
    sha256 cellar: :any,                 arm64_sonoma:   "ce1c314acee4f01b3ac7c91b703dfa170154fe833df860f608c4d02e4f6d59a4"
    sha256 cellar: :any,                 arm64_ventura:  "a8c89293c396219851faeecf23be969764bd4c169e66b10fc16b3949f2348d37"
    sha256 cellar: :any,                 arm64_monterey: "9100ec7606c07112a90c00796c4be0f7ee25e6305f0fbf5baff40fca51eec333"
    sha256 cellar: :any,                 arm64_big_sur:  "e1cafa5a3cc922c818b746cea6e697757dfd1450703678dc0f6ba89eb41c94ac"
    sha256 cellar: :any,                 sonoma:         "29787fd64c241aea0fe1d5199403bf71d3f7bb7436000237a534ec603fffffbc"
    sha256 cellar: :any,                 ventura:        "35848fd5f3cfbea613b2a2a017e10b7a1ede2cadbaab00da1d9dac1168b2af7e"
    sha256 cellar: :any,                 monterey:       "ea6a3522033b4b63e6f8786f14036cd2e3f685b8ad57050d9a64fc1adcf24e45"
    sha256 cellar: :any,                 big_sur:        "b7a2c4c9ab84445dbe76e5ba32cc84e5f64b4dca4bd0c6ceda202d024a4fcbe6"
    sha256 cellar: :any,                 catalina:       "34a785ef56c26e506e4e225ace636163dd3b5dd310448a7b63d1ba1c99a2ea77"
    sha256 cellar: :any,                 mojave:         "13df0590c2056af8071e5c182bc1b73cfd52b6ad7afb561d16a1ac3ddf0df179"
    sha256 cellar: :any,                 high_sierra:    "c2d3becfcd2f629fb875b6d6c907505489381e5ea3893b0a882510ebbee9951a"
    sha256 cellar: :any,                 sierra:         "d8f7cfc1bfad75b97271300a16f5c927849b03ff488141423ecf48b25c6ed8c3"
    sha256 cellar: :any,                 el_capitan:     "58b52d360c2f37f3ab3a50c4a2fe72b9a370bd951d52939f8853a5ef49fcc322"
    sha256 cellar: :any_skip_relocation, arm64_linux:    "d8f6ee7956817e86f157467092d3040167e1c1cc09fcb0503fca830c7bb08540"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "e25a808e70aa00573bcb1f195bb76b774e8060031e8a188d47eda1fb30fc6a4f"
  end

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    include.install "include/replaygain/"
  end
end
