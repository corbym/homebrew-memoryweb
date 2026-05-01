# typed: false
# frozen_string_literal: true

class Memoryweb < Formula
  desc "Persistent knowledge graph MCP server for AI agents"
  homepage "https://github.com/corbym/memoryweb"
  version "1.4.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_darwin_amd64.tar.gz"
      sha256 "8d97ea78b5c1ec03ad0e62af09e573ad0fbe02eecc1584228ac8553d0ca35a0b"
    end

    on_arm do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_darwin_arm64.tar.gz"
      sha256 "bfb0683853f6ae7de20d3b6c79c8b956e2d19092a36d5a57642103707db16ce7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_linux_amd64.tar.gz"
      sha256 "ede6f540b74cac55e51be4adf5574f3894758525a84ed949379033804e03cf4a"
    end

    on_arm do
      url "https://github.com/corbym/memoryweb/releases/download/v#{version}/memoryweb_v#{version}_linux_arm64.tar.gz"
      sha256 "df807ba82805cf3ebac11165f71f2361cd61d921ab0072b2d5626379a4f5bfb1"
    end
  end

  def install
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    os   = OS.mac? ? "darwin" : "linux"
    dir  = "memoryweb_#{os}_#{arch}"

    bin.install "#{dir}/memoryweb"
    (share/"memoryweb/hooks").install Dir["#{dir}/hooks/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/memoryweb --version 2>&1")
  end
end
