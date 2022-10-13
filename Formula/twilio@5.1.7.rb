require "language/node"

class TwilioAT517 < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/isha689/twilio-cli/releases/latest/download/twilio-5.1.7.tar.gz"
  version "5.1.7"
  sha256 "26c1aff70b390014e76e3ac862267b469bb8b30a96eae919826b8718f6c73d5b"
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
