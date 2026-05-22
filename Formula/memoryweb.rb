# typed: false
# frozen_string_literal: true

class Memoryweb < Formula
  desc "Persistent knowledge graph MCP server for AI agents"
  homepage "https://github.com/corbym/memoryweb"
  version "1.15.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_darwin_amd64.tar.gz"
      sha256 "843fdc0c1929e931eb40689d0a8d6b9a86299223b879ca74434101f87d6a7140"
    end

    on_arm do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_darwin_arm64.tar.gz"
      sha256 "f06edc5794f66bd3dff119a86e0da5459205316842cf9edaa09d28ffda2369c4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_linux_amd64.tar.gz"
      sha256 "3b5f2fcc49effa212534c00a8129734ba07e7842b3508e478d96142fc5e0d728"
    end

    on_arm do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_linux_arm64.tar.gz"
      sha256 "c4c9abb1899258ea16b3a849cdd2b5497849fd847682d01f5e6bc9ef06408729"
    end
  end

  def install
    bin.install "memoryweb"
    (share/"memoryweb/hooks").install Dir["hooks/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/memoryweb --version 2>&1")
  end
end
