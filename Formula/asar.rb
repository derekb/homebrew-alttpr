# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Asar < Formula
    desc "(Now) official repository of the SNES assembler Asar, originally created by Alcaro"
    homepage "https://github.com/RPGHacker/asar"
    url "https://github.com/RPGHacker/asar/archive/refs/tags/v1.81.tar.gz"
    sha256 "86af29abc2773fa6cfdbfb66f70e8d2ef1afa645f6e7653e07be198ee0e6cd47"
    license "LGPL-3.0-or-later"
  
    depends_on "cmake" => :build
  
    def install
      # ENV.deparallelize  # if your formula fails when building in parallel
      # Remove unrecognized options if warned by configure
      # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
      system "cmake", "src"
      system "make"
      mv "asar", "target"
      mv "target/asar-standalone", "asar"
  
    end
  
    test do
      # `test do` will create, run in and delete a temporary directory.
      #
      # This test will fail and we won't accept that! For Homebrew/homebrew-core
      # this will need to be a test that verifies the functionality of the
      # software. Run the test with `brew test asar`. Options passed
      # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
      #
      # The installed folder is not in the path, so use the entire path to any
      # executables being tested: `system "#{bin}/program", "do", "something"`.
      system "false"
    end
  end
  