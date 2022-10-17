require "language/node"

class TwilioAT518 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/isha689/twilio-cli/releases/download/#{version}/twilio-5.1.8.tar.gz"
  version "5.1.8"
  sha256 "debec9dc9c3c16065611876e464f6e46ebf6530d171ad3514d56824a5a2b07bf"
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
