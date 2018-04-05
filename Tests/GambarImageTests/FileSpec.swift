import Spectre

@testable import GambarImage

struct FileSpec {
  static let run: (ContextType) -> Void = {
    $0.describe(".exists(path:)") {
      $0.describe("when given invalid image path") {
        $0.it("should return false") {
          try expect(File.exists(path: "./Tests/fixtures/imag.jpeg")) == false
        }
      }

      $0.describe("when given valid image path") {
        $0.it("should return true") {
          try expect(File.exists(path: "./Tests/fixtures/image.jpeg")) == true
        }
      }
    }
  }
}