import Foundation

import class SwiftGD.Image
import struct SwiftGD.Point
import Swort

extension Image: Bitmap {
  public func color(point: BitmapPoint) -> Color {
    let (x, y) = point
    let color = get(pixel: Point(x: x, y: y))

    return Color(rgba: toRGBA(
      red: color.redComponent,
      green: color.greenComponent,
      blue: color.blueComponent,
      alpha: color.alphaComponent
    ))
  }

  public func getSize() -> Size {
    return Size(width: self.size.width, height: self.size.height)
  }
}

public enum ImageReaderError: Swift.Error {
  case imageNotFound(path: String)
}

public struct ImageReader {
  public static func read(path: String) throws -> Image {
    guard File.exists(path: path) else {
      throw ImageReaderError.imageNotFound(path: path)
    }

    let url = URL(fileURLWithPath: path)

    return Image(url: url)!
  }

  public static func asciiString(path: String) throws -> String {
    let image = try read(path: path)
    let blockSize = calculateBlockSize(size: image.getSize())

    return createAsciiArt(blockSize: blockSize, image: image)
  }
}
