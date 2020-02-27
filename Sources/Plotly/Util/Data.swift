
/// Encapsulation of either a constant value or a collection of changing data.
public enum Data<T>: Encodable where T: Encodable {
    /// Constant, fixed value.
    case constant(_ constant: T)

    /// Changing collection of values.
    case variable(_ values: [T])

    // TODO: Docs
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .constant(let constant):
            try container.encode(constant)
        case .variable(let values):
            try container.encode(values)
        }
    }
}


extension Data: ExpressibleByFloatLiteral where T: ExpressibleByFloatLiteral {
    public init(floatLiteral value: T.FloatLiteralType) {
        let t = T(floatLiteral: value)
        self = .constant(t)
    }
}


extension Data: ExpressibleByIntegerLiteral where T: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: T.IntegerLiteralType) {
        let t = T(integerLiteral: value)
        self = .constant(t)
    }
}


extension Data: ExpressibleByUnicodeScalarLiteral where T: ExpressibleByUnicodeScalarLiteral {
    public init(unicodeScalarLiteral value: T.UnicodeScalarLiteralType) {
        let t = T.init(unicodeScalarLiteral: value)
        self = .constant(t)
    }
}
extension Data: ExpressibleByExtendedGraphemeClusterLiteral where T: ExpressibleByExtendedGraphemeClusterLiteral {
    public init(extendedGraphemeClusterLiteral value: T.ExtendedGraphemeClusterLiteralType) {
        let t = T(extendedGraphemeClusterLiteral: value)
        self = .constant(t)
    }
}
extension Data: ExpressibleByStringLiteral where T: ExpressibleByStringLiteral {
    public init(stringLiteral value: T.StringLiteralType) {
        let t = T(stringLiteral: value)
        self = .constant(t)
    }

}
extension Data: ExpressibleByStringInterpolation where T: StringProtocol { }


extension Data: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: T...) {
        self = .variable(elements)
    }
}


// TODO: Docs
public enum ArrayOrColor: Encodable {
    case value(Color)
    case array([Double])
    case colors([Color])

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .value(let value):
            try container.encode(value)
        case .array(let array):
            try container.encode(array)
        case .colors(let colors):
            try container.encode(colors)
        }
    }
}
extension ArrayOrColor: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Double

    public init(arrayLiteral: Double...) {
        self = .array(arrayLiteral)
    }
}
extension ArrayOrColor: ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = UInt32

    public init(integerLiteral value: UInt32) {
        self = .value(.value(value))
    }
}
