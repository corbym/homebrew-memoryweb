# typed: false
# frozen_string_literal: true

class Memoryweb < Formula
  desc "Persistent knowledge graph MCP server for AI agents"
  homepage "https://github.com/corbym/memoryweb"
  version "1.42.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_darwin_amd64.tar.gz"
      sha256 "b3c63799c2afb9bcfecacb41888c257856712fd09b4f17a3f84218eaa197b1a0"
    end

    on_arm do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_darwin_arm64.tar.gz"
      sha256 "d63f27361a6f4f303c28ba98a59f122b36e8ef983082a121a908c17ef1416bb6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_linux_amd64.tar.gz"
      sha256 "20796a289144c555be3bb1eb623a37029a2bd82c8ee6cd19a9d90a84a194fb58"
    end

    on_arm do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_linux_arm64.tar.gz"
      sha256 "d8c12980865fa4810d98cd96de2f49f9942bddddfdcdb56e219ba870f9b5634c"
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
