
/// **Warning** This is generated code and all changes will be eventually overwritten.
/// See `Sources/Codegen/Readme.md` for more details.


/// Specification of filter operation on trace data.
/// 
/// - SeeAlso:
///   Documentation for 
///   [Python](https://plot.ly/python/reference/#transformsfilter), 
///   [JavaScript](https://plot.ly/javascript/reference/#transformsfilter) or 
///   [R](https://plot.ly/r/reference/#transformsfilter)
public struct Filter: Transform {
    /// Determines whether this filter transform is enabled or disabled.
    public var enabled: Bool? = nil

    /// Sets the filter target by which the filter is applied.
    /// 
    /// If a string, `target` is assumed to be a reference to a data array in the parent trace object.
    /// To filter about nested variables, use *.* to access them. For example, set `target` to
    /// *marker.color* to filter about the marker color array. If an array, `target` is then the data
    /// array by which the filter is applied.
    public var target: Data<String>? = nil

    /// Sets the filter operation.
    /// 
    /// *=* keeps items equal to `value` *!=* keeps items not equal to `value` *<* keeps items less than
    /// `value` *<=* keeps items less than or equal to `value` *>* keeps items greater than `value` *>=*
    /// keeps items greater than or equal to `value` *[]* keeps items inside `value[0]` to `value[1]`
    /// including both bounds *()* keeps items inside `value[0]` to `value[1]` excluding both bounds
    /// *[)* keeps items inside `value[0]` to `value[1]` including `value[0]` but excluding `value[1]
    /// *(]* keeps items inside `value[0]` to `value[1]` excluding `value[0]` but including `value[1]
    /// *][* keeps items outside `value[0]` to `value[1]` and equal to both bounds *)(* keeps items
    /// outside `value[0]` to `value[1]` *](* keeps items outside `value[0]` to `value[1]` and equal to
    /// `value[0]` *)[* keeps items outside `value[0]` to `value[1]` and equal to `value[1]` *{}* keeps
    /// items present in a set of values *}{* keeps items not present in a set of values
    public enum Operation: String, Encodable {
        case equalTo = "="
        case notEqualTo = "!="
        case lessThan = "<"
        case greaterEqualThan = ">="
        case greaterThan = ">"
        case lessEqualThan = "<="
        case insideInclusive = "[]"
        case insideExclusive = "()"
        case insideInclusiveExclusive = "[)"
        case insideExclusiveInclusive = "(]"
        case outsideInclusive = "]["
        case outsideExclusive = ")("
        case outsideInclusiveExclusive = "]("
        case outsideExclusiveInclusive = ")["
        case presentInSet = "{}"
        case notPresentInSet = "}{"
    }
    /// Sets the filter operation.
    /// 
    /// *=* keeps items equal to `value` *!=* keeps items not equal to `value` *<* keeps items less than
    /// `value` *<=* keeps items less than or equal to `value` *>* keeps items greater than `value` *>=*
    /// keeps items greater than or equal to `value` *[]* keeps items inside `value[0]` to `value[1]`
    /// including both bounds *()* keeps items inside `value[0]` to `value[1]` excluding both bounds
    /// *[)* keeps items inside `value[0]` to `value[1]` including `value[0]` but excluding `value[1]
    /// *(]* keeps items inside `value[0]` to `value[1]` excluding `value[0]` but including `value[1]
    /// *][* keeps items outside `value[0]` to `value[1]` and equal to both bounds *)(* keeps items
    /// outside `value[0]` to `value[1]` *](* keeps items outside `value[0]` to `value[1]` and equal to
    /// `value[0]` *)[* keeps items outside `value[0]` to `value[1]` and equal to `value[1]` *{}* keeps
    /// items present in a set of values *}{* keeps items not present in a set of values
    public var operation: Operation? = nil

    /// Sets the value or values by which to filter.
    /// 
    /// Values are expected to be in the same type as the data linked to `target`. When `operation` is
    /// set to one of the comparison values (=,!=,<,>=,>,<=) `value` is expected to be a number or a
    /// string. When `operation` is set to one of the interval values ([],(),[),(],][,)(,](,)[) `value`
    /// is expected to be 2-item array where the first item is the lower bound and the second item is
    /// the upper bound. When `operation`, is set to one of the set values ({},}{) `value` is expected
    /// to be an array with as many items as the desired set elements.
    public var value: Anything? = nil

    /// Determines whether or not gaps in data arrays produced by the filter operation are preserved.
    /// 
    /// Setting this to *true* might be useful when plotting a line chart with `connectgaps` set to
    /// *false*.
    public var preserveGaps: Bool? = nil

    /// Sets the calendar system to use for `value`, if it is a date.
    public var valueCalendar: Shared.Calendar? = nil

    /// Sets the calendar system to use for `target`, if it is an array of dates.
    /// 
    /// If `target` is a string (eg *x*) we use the corresponding trace attribute (eg `xcalendar`) if it
    /// exists, even if `targetcalendar` is provided.
    public var targetCalendar: Shared.Calendar? = nil

    /// Decoding and encoding keys compatible with Plotly schema.
    enum CodingKeys: String, CodingKey {
        case enabled
        case target
        case operation
        case value
        case preserveGaps = "preservegaps"
        case valueCalendar = "valuecalendar"
        case targetCalendar = "targetcalendar"
    }
    
    /// Creates `Filter` object with specified properties.
    /// 
    /// - Parameters:
    ///   - enabled: Determines whether this filter transform is enabled or disabled.
    ///   - target: Sets the filter target by which the filter is applied.
    ///   - operation: Sets the filter operation.
    ///   - value: Sets the value or values by which to filter.
    ///   - preserveGaps: Determines whether or not gaps in data arrays produced by the filter operation
    ///   are preserved.
    ///   - valueCalendar: Sets the calendar system to use for `value`, if it is a date.
    ///   - targetCalendar: Sets the calendar system to use for `target`, if it is an array of dates.
    public init(enabled: Bool? = nil, target: Data<String>? = nil, operation: Operation? = nil,
            value: Anything? = nil, preserveGaps: Bool? = nil, valueCalendar: Shared.Calendar? = nil,
            targetCalendar: Shared.Calendar? = nil) {
        self.enabled = enabled
        self.target = target
        self.operation = operation
        self.value = value
        self.preserveGaps = preserveGaps
        self.valueCalendar = valueCalendar
        self.targetCalendar = targetCalendar
    }
    
}