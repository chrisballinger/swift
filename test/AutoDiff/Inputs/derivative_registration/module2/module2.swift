import module1

extension FunctionInModule1_InternalDerivatives {
  // TODO(TF-XXXX): This causes duplicate symbol linker errors.
  // TODO(TF-XXXX): Why is @usableFromInline necessary?
  // @derivative(of: f)
  // @usableFromInline
  // static func df(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
  //   (x, { expectedGradientFromModule2 * $0 })
  // }
  // public static func gradFFromModule2(_ x: Float) -> Float { gradient(at: x, in: f) }
}

extension FunctionInModule1_PublicDerivativeInModule2 {
  @derivative(of: f)
  public static func df(_ x: Float) -> (value: Float, pullback: (Float) -> Float) {
    (x, { expectedGradient * $0 })
  }
}
