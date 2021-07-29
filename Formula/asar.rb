class Asar < Formula
    desc "(Now) official repository of the SNES assembler Asar, originally created by Alcaro"
    homepage "https://github.com/RPGHacker/asar"
    url "https://github.com/RPGHacker/asar/archive/refs/tags/v1.81.tar.gz"
    sha256 "86af29abc2773fa6cfdbfb66f70e8d2ef1afa645f6e7653e07be198ee0e6cd47"
    license "LGPL-3.0-or-later"
  
    depends_on "cmake" => :build
  
    def install
      system "cmake", "src"
      system "make"
      mv "asar", "target"
      mv "target/asar-standalone", "asar"
      
      bin.install "asar"
    end
  
    test do
      # The installed folder is not in the path, so use the entire path to any
      # executables being tested: `system "#{bin}/program", "do", "something"`.
      system "#{bin}/asar", "--version"
    end
  end