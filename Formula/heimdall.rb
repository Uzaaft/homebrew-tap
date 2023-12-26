# typed: false
#
# frozen_string_literal: true

# heimdall.rb
class Heimdall < Formula
  env :std
  desc "A simple hotkey deamon with a TOML format. Primarly tested on MacOS"
  homepage "https://github.com/uzaaft/heimdall"
  head "https://github.com/uzaaft/heimdall.git"
  depends_on "rust" => :build

  def install
    system "cargo", "install",  "--path", "."
    bin.install "#{buildpath}/target/release/heim"
  end

  service do
    run "#{opt_bin}/heim"
    keep_alive true
    process_type :interactive
  end
end
