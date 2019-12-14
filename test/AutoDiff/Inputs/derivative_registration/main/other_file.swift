enum FunctionInOtherFile_FileprivateDerivatives {
  static let expectedGradientFromOtherFile: Float = 10
  static let expectedGradientFromMainFile: Float = 20

  static func f(_ x: Float) -> Float { x }

  // TODO(TF-XXXX): Defining fileprivate derivatives in multiple files causes duplicate symbol
  // linker error.
  //@derivative(of: f)
  //static fileprivate func df(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  //  (x, { expectedGradientFromOtherFile * $0 })
  //}
  //static func gradFFromOtherFile(_ x: Float) -> Float { gradient(at: x, in: f) }
}

enum FunctionInOtherFile_DerivativeInMainFile {
  static let expectedGradient: Float = 10

  static func f(_ x: Float) -> Float { x }

  static func gradFFromOtherFile(_ x: Float) -> Float { gradient(at: x, in: f) }
}
