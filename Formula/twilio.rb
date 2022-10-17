require "language/node"

class Twilio < Formula
  desc "unleash the power of Twilio from your command prompt"
  homepage "https://github.com/twilio/twilio-cli"
  url "https://github.com/isha689/twilio-cli/releases/latest/download/twilio-5.1.8-draft.1.tar.gz"
  version "5.1.8-draft.1"
  sha256 "324d0321030419077b2520d1e4fda7fdda7c2ea76b4c3f69456009b2e22d33b9"
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
