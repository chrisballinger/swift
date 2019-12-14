public enum FunctionInModule1_InternalDerivatives {
  public static let expectedGradientFromModule1: Float = 10
  public static let expectedGradientFromModule2: Float = 20
  public static let expectedGradientFromMain: Float = 30

  public static func f(_ x: Float) -> Float { x }

  // TODO(TF-XXXX): Why is @usableFromInline necessary?
  @derivative(of: f)
  @usableFromInline
  static func df(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
    (x, { expectedGradientFromModule1 * $0 })
  }
  public static func gradFFromModule1(_ x: Float) -> Float { gradient(at: x, in: f) }
}

public enum FunctionInModule1_PublicDerivativeInModule2 {
  public static let expectedGradient: Float = 10

  public static func f(_ x: Float) -> Float { x }
}
