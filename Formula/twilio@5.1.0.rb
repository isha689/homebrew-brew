require "language/node"

class TwilioAT510 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/isha689/twilio-cli/releases/latest/download//twilio-5.0.0.tar.gz"
  version "5.1.0"
  sha256 "6e6ae7f37471b0a17fc30b079e1d757551aafe41eeeb19dc51f9b59135ba51e2"
  depends_on "node"

  def install
    inreplace "bin/twilio", /^CLIENT_HOME=/, "export TWILIO_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/twilio"
  end

  def post_install
    pid = spawn("node #{libexec}/welcome.js")
    Process.wait pid
  end
end
