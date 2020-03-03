/// The data describing carpet axis layout is set in `y` and (optionally) also `x`.
/// 
/// If only `y` is present, `x` the plot is interpreted as a cheater plot and is filled in using the
/// `y` values. `x` and `y` may either be 2D arrays matching with each dimension matching that of
/// `a` and `b`, or they may be 1D arrays with total length equal to that of `a` and `b`.
/// 
/// - SeeAlso:
///   Documentation for 
///   [Python](https://plot.ly/python/reference/#carpet), 
///   [JavaScript](https://plot.ly/javascript/reference/#carpet) or 
///   [R](https://plot.ly/r/reference/#carpet)
public struct Carpet<XData, YData, AData, BData>: Trace, XYSubplot where XData: Plotable, YData: Plotable, AData: Plotable, BData: Plotable {
    public let type: String = "carpet"

    public let animatable: Bool = true

    /// Determines whether or not this trace is visible.
    /// 
    /// If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the
    /// legend itself is visible).
    public var visible: Shared.Visible? = nil

    /// Sets the opacity of the trace.
    public var opacity: Double? = nil

    /// Sets the trace name.
    /// 
    /// The trace name appear as the legend item and on hover.
    public var name: String? = nil

    /// Assign an id to this trace, Use this to provide object constancy between traces during
    /// animations and transitions.
    public var uid: String? = nil

    /// Assigns id labels to each datum.
    /// 
    /// These ids for object constancy of data points during animation. Should be an array of strings,
    /// not numbers or any other type.
    public var ids: [String]? = nil

    /// Assigns extra data each datum.
    /// 
    /// This may be useful when listening to hover, click and selection events. Note that, *scatter*
    /// traces also appends customdata items in the markers DOM elements
    public var customData: [String]? = nil

    /// Assigns extra meta information associated with this trace that can be used in various text
    /// attributes.
    /// 
    /// Attributes such as trace `name`, graph, axis and colorbar `title.text`, annotation `text`
    /// `rangeselector`, `updatemenues` and `sliders` `label` text all support `meta`. To access the
    /// trace `meta` values in an attribute in the same trace, simply use `%{meta[i]}` where `i` is the
    /// index or key of the `meta` item in question. To access trace `meta` in layout attributes, use
    /// `%{data[n[.meta[i]}` where `i` is the index or key of the `meta` and `n` is the trace index.
    public var meta: Data<Anything>? = nil

    public var stream: Shared.Stream? = nil

    /// Controls persistence of some user-driven changes to the trace: `constraintrange` in `parcoords`
    /// traces, as well as some `editable: true` modifications such as `name` and `colorbar.title`.
    /// 
    /// Defaults to `layout.uirevision`. Note that other user-driven trace attribute changes are
    /// controlled by `layout` attributes: `trace.visible` is controlled by `layout.legend.uirevision`,
    /// `selectedpoints` is controlled by `layout.selectionrevision`, and `colorbar.(x|y)` (accessible
    /// with `config: {editable: true}`) is controlled by `layout.editrevision`. Trace changes are
    /// tracked by `uid`, which only falls back on trace index if no `uid` is provided. So if your app
    /// can add/remove traces before the end of the `data` array, such that the same trace has a
    /// different index, you can still preserve user-driven changes if you give each trace a `uid` that
    /// stays with it as it moves.
    public var uiRevision: Anything? = nil

    /// An identifier for this carpet, so that `scattercarpet` and `contourcarpet` traces can specify a
    /// carpet plot on which they lie
    public var carpet: String? = nil

    /// A two dimensional array of x coordinates at each carpet point.
    /// 
    /// If ommitted, the plot is a cheater plot and the xaxis is hidden by default.
    public var x: XData? = nil

    /// A two dimensional array of y coordinates at each carpet point.
    public var y: YData? = nil

    /// An array containing values of the first parameter value
    public var a: AData? = nil

    /// Alternate to `a`.
    /// 
    /// Builds a linear space of a coordinates. Use with `da` where `a0` is the starting coordinate and
    /// `da` the step.
    public var a0: Double? = nil

    /// Sets the a coordinate step.
    /// 
    /// See `a0` for more info.
    public var da: Double? = nil

    /// A two dimensional array of y coordinates at each carpet point.
    public var b: BData? = nil

    /// Alternate to `b`.
    /// 
    /// Builds a linear space of a coordinates. Use with `db` where `b0` is the starting coordinate and
    /// `db` the step.
    public var b0: Double? = nil

    /// Sets the b coordinate step.
    /// 
    /// See `b0` for more info.
    public var db: Double? = nil

    /// The shift applied to each successive row of data in creating a cheater plot.
    /// 
    /// Only used if `x` is been ommitted.
    public var cheaterSlope: Double? = nil

    public struct AAxis: Encodable {
        /// Sets default for all colors associated with this axis all at once: line, font, tick, and grid
        /// colors.
        /// 
        /// Grid color is lightened by blending this with the plot background Individual pieces can override
        /// this.
        public var color: Color? = nil
    
        public var smoothing: Double? = nil
    
        public struct Title: Encodable {
            /// Sets the title of this axis.
            /// 
            /// Note that before the existence of `title.text`, the title's contents used to be defined as the
            /// `title` attribute itself. This behavior has been deprecated.
            public var text: String? = nil
        
            /// Sets this axis' title font.
            /// 
            /// Note that the title's font used to be set by the now deprecated `titlefont` attribute.
            public var font: Shared.Font? = nil
        
            /// An additional amount by which to offset the title from the tick labels, given in pixels.
            /// 
            /// Note that this used to be set by the now deprecated `titleoffset` attribute.
            public var offset: Double? = nil
        
            /// Creates `Title` object with specified properties.
            /// 
            /// - Parameters:
            ///   - text: Sets the title of this axis.
            ///   - font: Sets this axis' title font.
            ///   - offset: An additional amount by which to offset the title from the tick labels, given in
            ///   pixels.
            public init(text: String? = nil, font: Shared.Font? = nil, offset: Double? = nil) {
                self.text = text
                self.font = font
                self.offset = offset
            }
            
        }
        public var title: Title? = nil
    
        /// Sets the axis type.
        /// 
        /// By default, plotly attempts to determined the axis type by looking into the data of the traces
        /// that referenced the axis in question.
        public enum `Type`: String, Encodable {
            case auto = "-"
            case linear
            case date
            case category
        }
        /// Sets the axis type.
        /// 
        /// By default, plotly attempts to determined the axis type by looking into the data of the traces
        /// that referenced the axis in question.
        public var type: `Type`? = nil
    
        /// Determines whether or not the range of this axis is computed in relation to the input data.
        /// 
        /// See `rangemode` for more info. If `range` is provided, then `autorange` is set to *false*.
        public var autoRange: Shared.AutoRange? = nil
    
        /// If *normal*, the range is computed in relation to the extrema of the input data.
        /// 
        /// If *tozero*`, the range extends to 0, regardless of the input data If *nonnegative*, the range
        /// is non-negative, regardless of the input data.
        public var rangeMode: Shared.RangeMode? = nil
    
        /// Sets the range of this axis.
        /// 
        /// If the axis `type` is *log*, then you must take the log of your desired range (e.g. to set the
        /// range from 1 to 100, set the range from 0 to 2). If the axis `type` is *date*, it should be date
        /// strings, like date data, though Date objects and unix milliseconds will be accepted and
        /// converted to strings. If the axis `type` is *category*, it should be numbers, using the scale
        /// where each category is assigned a serial number from zero in the order it appears.
        public var range: InfoArray? = nil
    
        /// Determines whether or not this axis is zoom-able.
        /// 
        /// If true, then zoom is disabled.
        public var fixedRange: Bool? = nil
    
        public enum CheaterType: String, Encodable {
            case index
            case value
        }
        public var cheaterType: CheaterType? = nil
    
        public enum TickMode: String, Encodable {
            case linear
            case array
        }
        public var tickMode: TickMode? = nil
    
        /// Specifies the maximum number of ticks for the particular axis.
        /// 
        /// The actual number of ticks will be chosen automatically to be less than or equal to `nticks`.
        /// Has an effect only if `tickmode` is set to *auto*.
        public var numTicks: Int? = nil
    
        /// Sets the values at which ticks on this axis appear.
        /// 
        /// Only has an effect if `tickmode` is set to *array*. Used with `ticktext`.
        public var tickValues: [Double]? = nil
    
        /// Sets the text displayed at the ticks position via `tickvals`.
        /// 
        /// Only has an effect if `tickmode` is set to *array*. Used with `tickvals`.
        public var tickText: [Double]? = nil
    
        /// Determines whether axis labels are drawn on the low side, the high side, both, or neither side
        /// of the axis.
        public enum ShowTickLabels: String, Encodable {
            case start
            case end
            case both
            case none
        }
        /// Determines whether axis labels are drawn on the low side, the high side, both, or neither side
        /// of the axis.
        public var showTickLabels: ShowTickLabels? = nil
    
        /// Sets the tick font.
        public var tickFont: Shared.Font? = nil
    
        /// Sets the angle of the tick labels with respect to the horizontal.
        /// 
        /// For example, a `tickangle` of -90 draws the tick labels vertically.
        public var tickAngle: Angle? = nil
    
        /// Sets a tick label prefix.
        public var tickPrefix: String? = nil
    
        /// If *all*, all tick labels are displayed with a prefix.
        /// 
        /// If *first*, only the first tick is displayed with a prefix. If *last*, only the last tick is
        /// displayed with a suffix. If *none*, tick prefixes are hidden.
        public var showTickPrefix: Shared.ShowTickPrefix? = nil
    
        /// Sets a tick label suffix.
        public var tickSuffix: String? = nil
    
        /// Same as `showtickprefix` but for tick suffixes.
        public var showTickSuffix: Shared.ShowTickSuffix? = nil
    
        /// If *all*, all exponents are shown besides their significands.
        /// 
        /// If *first*, only the exponent of the first tick is shown. If *last*, only the exponent of the
        /// last tick is shown. If *none*, no exponents appear.
        public var showExponent: Shared.ShowExponent? = nil
    
        /// Determines a formatting rule for the tick exponents.
        /// 
        /// For example, consider the number 1,000,000,000. If *none*, it appears as 1,000,000,000. If *e*,
        /// 1e+9. If *E*, 1E+9. If *power*, 1x10^9 (with 9 in a super script). If *SI*, 1G. If *B*, 1B.
        public var exponentFormat: Shared.ExponentFormat? = nil
    
        /// If "true", even 4-digit integers are separated
        public var separateThousands: Bool? = nil
    
        /// Sets the tick label formatting rule using d3 formatting mini-languages which are very similar to
        /// those in Python.
        /// 
        /// For numbers, see: https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format
        /// And for dates see: We add one item to d3's date formatter: *%{n}f* for fractional seconds with n
        /// digits. For example, *2016-10-13 09:15:23.456* with tickformat *%H~%M~%S.%2f* would display
        /// *09~15~23.46*
        public var tickFormat: String? = nil
    
        public var tickFormatStops: [Shared.TickFormatStop]? = nil
    
        /// Specifies the ordering logic for the case of categorical variables.
        /// 
        /// By default, plotly uses *trace*, which specifies the order that is present in the data supplied.
        /// Set `categoryorder` to *category ascending* or *category descending* if order should be
        /// determined by the alphanumerical order of the category names. Set `categoryorder` to *array* to
        /// derive the ordering from the attribute `categoryarray`. If a category is not found in the
        /// `categoryarray` array, the sorting behavior for that attribute will be identical to the *trace*
        /// mode. The unspecified categories will follow the categories in `categoryarray`.
        public var categoryOrder: Shared.CarpetCategoryOrder? = nil
    
        /// Sets the order in which categories on this axis appear.
        /// 
        /// Only has an effect if `categoryorder` is set to *array*. Used with `categoryorder`.
        public var categoryArray: [Double]? = nil
    
        /// Extra padding between label and the axis
        public var labelPadding: Int? = nil
    
        /// Sets a axis label prefix.
        public var labelPrefix: String? = nil
    
        /// Sets a axis label suffix.
        public var labelSuffix: String? = nil
    
        /// Determines whether or not a line bounding this axis is drawn.
        public var showLine: Bool? = nil
    
        /// Sets the axis line color.
        public var lineColor: Color? = nil
    
        /// Sets the width (in px) of the axis line.
        public var lineWidth: Double? = nil
    
        /// Sets the axis line color.
        public var gridColor: Color? = nil
    
        /// Sets the width (in px) of the axis line.
        public var gridWidth: Double? = nil
    
        /// Determines whether or not grid lines are drawn.
        /// 
        /// If *true*, the grid lines are drawn at every tick mark.
        public var showGrid: Bool? = nil
    
        /// Sets the number of minor grid ticks per major grid tick
        public var minorGridCount: Int? = nil
    
        /// Sets the width (in px) of the grid lines.
        public var minorGridWidth: Double? = nil
    
        /// Sets the color of the grid lines.
        public var minorGridColor: Color? = nil
    
        /// Determines whether or not a line is drawn at along the starting value of this axis.
        /// 
        /// If *true*, the start line is drawn on top of the grid lines.
        public var startLine: Bool? = nil
    
        /// Sets the line color of the start line.
        public var startLineColor: Color? = nil
    
        /// Sets the width (in px) of the start line.
        public var startLineWidth: Double? = nil
    
        /// Determines whether or not a line is drawn at along the final value of this axis.
        /// 
        /// If *true*, the end line is drawn on top of the grid lines.
        public var endLine: Bool? = nil
    
        /// Sets the width (in px) of the end line.
        public var endLineWidth: Double? = nil
    
        /// Sets the line color of the end line.
        public var endLineColor: Color? = nil
    
        /// The starting index of grid lines along the axis
        public var tick0: Double? = nil
    
        /// The stride between grid lines along the axis
        public var dTick: Double? = nil
    
        /// The starting index of grid lines along the axis
        public var arrayTick0: Int? = nil
    
        /// The stride between grid lines along the axis
        public var arraydTick: Int? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case color
            case smoothing
            case title
            case type
            case autoRange = "autorange"
            case rangeMode = "rangemode"
            case range
            case fixedRange = "fixedrange"
            case cheaterType = "cheatertype"
            case tickMode = "tickmode"
            case numTicks = "nticks"
            case tickValues = "tickvals"
            case tickText = "ticktext"
            case showTickLabels = "showticklabels"
            case tickFont = "tickfont"
            case tickAngle = "tickangle"
            case tickPrefix = "tickprefix"
            case showTickPrefix = "showtickprefix"
            case tickSuffix = "ticksuffix"
            case showTickSuffix = "showticksuffix"
            case showExponent = "showexponent"
            case exponentFormat = "exponentformat"
            case separateThousands = "separatethousands"
            case tickFormat = "tickformat"
            case tickFormatStops = "tickformatstops"
            case categoryOrder = "categoryorder"
            case categoryArray = "categoryarray"
            case labelPadding = "labelpadding"
            case labelPrefix = "labelprefix"
            case labelSuffix = "labelsuffix"
            case showLine = "showline"
            case lineColor = "linecolor"
            case lineWidth = "linewidth"
            case gridColor = "gridcolor"
            case gridWidth = "gridwidth"
            case showGrid = "showgrid"
            case minorGridCount = "minorgridcount"
            case minorGridWidth = "minorgridwidth"
            case minorGridColor = "minorgridcolor"
            case startLine = "startline"
            case startLineColor = "startlinecolor"
            case startLineWidth = "startlinewidth"
            case endLine = "endline"
            case endLineWidth = "endlinewidth"
            case endLineColor = "endlinecolor"
            case tick0
            case dTick = "dtick"
            case arrayTick0 = "arraytick0"
            case arraydTick = "arraydtick"
        }
        
        /// Creates `AAxis` object with specified properties.
        /// 
        /// - Parameters:
        ///   - color: Sets default for all colors associated with this axis all at once: line, font, tick,
        ///   and grid colors.
        ///   - smoothing:
        ///   - title:
        ///   - type: Sets the axis type.
        ///   - autoRange: Determines whether or not the range of this axis is computed in relation to the
        ///   input data.
        ///   - rangeMode: If *normal*, the range is computed in relation to the extrema of the input data.
        ///   - range: Sets the range of this axis.
        ///   - fixedRange: Determines whether or not this axis is zoom-able.
        ///   - cheaterType:
        ///   - tickMode:
        ///   - numTicks: Specifies the maximum number of ticks for the particular axis.
        ///   - tickValues: Sets the values at which ticks on this axis appear.
        ///   - tickText: Sets the text displayed at the ticks position via `tickvals`.
        ///   - showTickLabels: Determines whether axis labels are drawn on the low side, the high side, both,
        ///   or neither side of the axis.
        ///   - tickFont: Sets the tick font.
        ///   - tickAngle: Sets the angle of the tick labels with respect to the horizontal.
        ///   - tickPrefix: Sets a tick label prefix.
        ///   - showTickPrefix: If *all*, all tick labels are displayed with a prefix.
        ///   - tickSuffix: Sets a tick label suffix.
        ///   - showTickSuffix: Same as `showtickprefix` but for tick suffixes.
        ///   - showExponent: If *all*, all exponents are shown besides their significands.
        ///   - exponentFormat: Determines a formatting rule for the tick exponents.
        ///   - separateThousands: If "true", even 4-digit integers are separated
        ///   - tickFormat: Sets the tick label formatting rule using d3 formatting mini-languages which are
        ///   very similar to those in Python.
        ///   - tickFormatStops:
        ///   - categoryOrder: Specifies the ordering logic for the case of categorical variables.
        ///   - categoryArray: Sets the order in which categories on this axis appear.
        ///   - labelPadding: Extra padding between label and the axis
        ///   - labelPrefix: Sets a axis label prefix.
        ///   - labelSuffix: Sets a axis label suffix.
        ///   - showLine: Determines whether or not a line bounding this axis is drawn.
        ///   - lineColor: Sets the axis line color.
        ///   - lineWidth: Sets the width (in px) of the axis line.
        ///   - gridColor: Sets the axis line color.
        ///   - gridWidth: Sets the width (in px) of the axis line.
        ///   - showGrid: Determines whether or not grid lines are drawn.
        ///   - minorGridCount: Sets the number of minor grid ticks per major grid tick
        ///   - minorGridWidth: Sets the width (in px) of the grid lines.
        ///   - minorGridColor: Sets the color of the grid lines.
        ///   - startLine: Determines whether or not a line is drawn at along the starting value of this axis.
        ///   - startLineColor: Sets the line color of the start line.
        ///   - startLineWidth: Sets the width (in px) of the start line.
        ///   - endLine: Determines whether or not a line is drawn at along the final value of this axis.
        ///   - endLineWidth: Sets the width (in px) of the end line.
        ///   - endLineColor: Sets the line color of the end line.
        ///   - tick0: The starting index of grid lines along the axis
        ///   - dTick: The stride between grid lines along the axis
        ///   - arrayTick0: The starting index of grid lines along the axis
        ///   - arraydTick: The stride between grid lines along the axis
        public init(color: Color? = nil, smoothing: Double? = nil, title: Title? = nil, type: `Type`? =
                nil, autoRange: Shared.AutoRange? = nil, rangeMode: Shared.RangeMode? = nil, range: InfoArray? =
                nil, fixedRange: Bool? = nil, cheaterType: CheaterType? = nil, tickMode: TickMode? = nil,
                numTicks: Int? = nil, tickValues: [Double]? = nil, tickText: [Double]? = nil, showTickLabels:
                ShowTickLabels? = nil, tickFont: Shared.Font? = nil, tickAngle: Angle? = nil, tickPrefix:
                String? = nil, showTickPrefix: Shared.ShowTickPrefix? = nil, tickSuffix: String? = nil,
                showTickSuffix: Shared.ShowTickSuffix? = nil, showExponent: Shared.ShowExponent? = nil,
                exponentFormat: Shared.ExponentFormat? = nil, separateThousands: Bool? = nil, tickFormat:
                String? = nil, tickFormatStops: [Shared.TickFormatStop]? = nil, categoryOrder:
                Shared.CarpetCategoryOrder? = nil, categoryArray: [Double]? = nil, labelPadding: Int? = nil,
                labelPrefix: String? = nil, labelSuffix: String? = nil, showLine: Bool? = nil, lineColor: Color?
                = nil, lineWidth: Double? = nil, gridColor: Color? = nil, gridWidth: Double? = nil, showGrid:
                Bool? = nil, minorGridCount: Int? = nil, minorGridWidth: Double? = nil, minorGridColor: Color? =
                nil, startLine: Bool? = nil, startLineColor: Color? = nil, startLineWidth: Double? = nil,
                endLine: Bool? = nil, endLineWidth: Double? = nil, endLineColor: Color? = nil, tick0: Double? =
                nil, dTick: Double? = nil, arrayTick0: Int? = nil, arraydTick: Int? = nil) {
            self.color = color
            self.smoothing = smoothing
            self.title = title
            self.type = type
            self.autoRange = autoRange
            self.rangeMode = rangeMode
            self.range = range
            self.fixedRange = fixedRange
            self.cheaterType = cheaterType
            self.tickMode = tickMode
            self.numTicks = numTicks
            self.tickValues = tickValues
            self.tickText = tickText
            self.showTickLabels = showTickLabels
            self.tickFont = tickFont
            self.tickAngle = tickAngle
            self.tickPrefix = tickPrefix
            self.showTickPrefix = showTickPrefix
            self.tickSuffix = tickSuffix
            self.showTickSuffix = showTickSuffix
            self.showExponent = showExponent
            self.exponentFormat = exponentFormat
            self.separateThousands = separateThousands
            self.tickFormat = tickFormat
            self.tickFormatStops = tickFormatStops
            self.categoryOrder = categoryOrder
            self.categoryArray = categoryArray
            self.labelPadding = labelPadding
            self.labelPrefix = labelPrefix
            self.labelSuffix = labelSuffix
            self.showLine = showLine
            self.lineColor = lineColor
            self.lineWidth = lineWidth
            self.gridColor = gridColor
            self.gridWidth = gridWidth
            self.showGrid = showGrid
            self.minorGridCount = minorGridCount
            self.minorGridWidth = minorGridWidth
            self.minorGridColor = minorGridColor
            self.startLine = startLine
            self.startLineColor = startLineColor
            self.startLineWidth = startLineWidth
            self.endLine = endLine
            self.endLineWidth = endLineWidth
            self.endLineColor = endLineColor
            self.tick0 = tick0
            self.dTick = dTick
            self.arrayTick0 = arrayTick0
            self.arraydTick = arraydTick
        }
        
    }
    public var aAxis: AAxis? = nil

    public struct BAxis: Encodable {
        /// Sets default for all colors associated with this axis all at once: line, font, tick, and grid
        /// colors.
        /// 
        /// Grid color is lightened by blending this with the plot background Individual pieces can override
        /// this.
        public var color: Color? = nil
    
        public var smoothing: Double? = nil
    
        public struct Title: Encodable {
            /// Sets the title of this axis.
            /// 
            /// Note that before the existence of `title.text`, the title's contents used to be defined as the
            /// `title` attribute itself. This behavior has been deprecated.
            public var text: String? = nil
        
            /// Sets this axis' title font.
            /// 
            /// Note that the title's font used to be set by the now deprecated `titlefont` attribute.
            public var font: Shared.Font? = nil
        
            /// An additional amount by which to offset the title from the tick labels, given in pixels.
            /// 
            /// Note that this used to be set by the now deprecated `titleoffset` attribute.
            public var offset: Double? = nil
        
            /// Creates `Title` object with specified properties.
            /// 
            /// - Parameters:
            ///   - text: Sets the title of this axis.
            ///   - font: Sets this axis' title font.
            ///   - offset: An additional amount by which to offset the title from the tick labels, given in
            ///   pixels.
            public init(text: String? = nil, font: Shared.Font? = nil, offset: Double? = nil) {
                self.text = text
                self.font = font
                self.offset = offset
            }
            
        }
        public var title: Title? = nil
    
        /// Sets the axis type.
        /// 
        /// By default, plotly attempts to determined the axis type by looking into the data of the traces
        /// that referenced the axis in question.
        public enum `Type`: String, Encodable {
            case auto = "-"
            case linear
            case date
            case category
        }
        /// Sets the axis type.
        /// 
        /// By default, plotly attempts to determined the axis type by looking into the data of the traces
        /// that referenced the axis in question.
        public var type: `Type`? = nil
    
        /// Determines whether or not the range of this axis is computed in relation to the input data.
        /// 
        /// See `rangemode` for more info. If `range` is provided, then `autorange` is set to *false*.
        public var autoRange: Shared.AutoRange? = nil
    
        /// If *normal*, the range is computed in relation to the extrema of the input data.
        /// 
        /// If *tozero*`, the range extends to 0, regardless of the input data If *nonnegative*, the range
        /// is non-negative, regardless of the input data.
        public var rangeMode: Shared.RangeMode? = nil
    
        /// Sets the range of this axis.
        /// 
        /// If the axis `type` is *log*, then you must take the log of your desired range (e.g. to set the
        /// range from 1 to 100, set the range from 0 to 2). If the axis `type` is *date*, it should be date
        /// strings, like date data, though Date objects and unix milliseconds will be accepted and
        /// converted to strings. If the axis `type` is *category*, it should be numbers, using the scale
        /// where each category is assigned a serial number from zero in the order it appears.
        public var range: InfoArray? = nil
    
        /// Determines whether or not this axis is zoom-able.
        /// 
        /// If true, then zoom is disabled.
        public var fixedRange: Bool? = nil
    
        public enum CheaterType: String, Encodable {
            case index
            case value
        }
        public var cheaterType: CheaterType? = nil
    
        public enum TickMode: String, Encodable {
            case linear
            case array
        }
        public var tickMode: TickMode? = nil
    
        /// Specifies the maximum number of ticks for the particular axis.
        /// 
        /// The actual number of ticks will be chosen automatically to be less than or equal to `nticks`.
        /// Has an effect only if `tickmode` is set to *auto*.
        public var numTicks: Int? = nil
    
        /// Sets the values at which ticks on this axis appear.
        /// 
        /// Only has an effect if `tickmode` is set to *array*. Used with `ticktext`.
        public var tickValues: [Double]? = nil
    
        /// Sets the text displayed at the ticks position via `tickvals`.
        /// 
        /// Only has an effect if `tickmode` is set to *array*. Used with `tickvals`.
        public var tickText: [Double]? = nil
    
        /// Determines whether axis labels are drawn on the low side, the high side, both, or neither side
        /// of the axis.
        public enum ShowTickLabels: String, Encodable {
            case start
            case end
            case both
            case none
        }
        /// Determines whether axis labels are drawn on the low side, the high side, both, or neither side
        /// of the axis.
        public var showTickLabels: ShowTickLabels? = nil
    
        /// Sets the tick font.
        public var tickFont: Shared.Font? = nil
    
        /// Sets the angle of the tick labels with respect to the horizontal.
        /// 
        /// For example, a `tickangle` of -90 draws the tick labels vertically.
        public var tickAngle: Angle? = nil
    
        /// Sets a tick label prefix.
        public var tickPrefix: String? = nil
    
        /// If *all*, all tick labels are displayed with a prefix.
        /// 
        /// If *first*, only the first tick is displayed with a prefix. If *last*, only the last tick is
        /// displayed with a suffix. If *none*, tick prefixes are hidden.
        public var showTickPrefix: Shared.ShowTickPrefix? = nil
    
        /// Sets a tick label suffix.
        public var tickSuffix: String? = nil
    
        /// Same as `showtickprefix` but for tick suffixes.
        public var showTickSuffix: Shared.ShowTickSuffix? = nil
    
        /// If *all*, all exponents are shown besides their significands.
        /// 
        /// If *first*, only the exponent of the first tick is shown. If *last*, only the exponent of the
        /// last tick is shown. If *none*, no exponents appear.
        public var showExponent: Shared.ShowExponent? = nil
    
        /// Determines a formatting rule for the tick exponents.
        /// 
        /// For example, consider the number 1,000,000,000. If *none*, it appears as 1,000,000,000. If *e*,
        /// 1e+9. If *E*, 1E+9. If *power*, 1x10^9 (with 9 in a super script). If *SI*, 1G. If *B*, 1B.
        public var exponentFormat: Shared.ExponentFormat? = nil
    
        /// If "true", even 4-digit integers are separated
        public var separateThousands: Bool? = nil
    
        /// Sets the tick label formatting rule using d3 formatting mini-languages which are very similar to
        /// those in Python.
        /// 
        /// For numbers, see: https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format
        /// And for dates see: We add one item to d3's date formatter: *%{n}f* for fractional seconds with n
        /// digits. For example, *2016-10-13 09:15:23.456* with tickformat *%H~%M~%S.%2f* would display
        /// *09~15~23.46*
        public var tickFormat: String? = nil
    
        public var tickFormatStops: [Shared.TickFormatStop]? = nil
    
        /// Specifies the ordering logic for the case of categorical variables.
        /// 
        /// By default, plotly uses *trace*, which specifies the order that is present in the data supplied.
        /// Set `categoryorder` to *category ascending* or *category descending* if order should be
        /// determined by the alphanumerical order of the category names. Set `categoryorder` to *array* to
        /// derive the ordering from the attribute `categoryarray`. If a category is not found in the
        /// `categoryarray` array, the sorting behavior for that attribute will be identical to the *trace*
        /// mode. The unspecified categories will follow the categories in `categoryarray`.
        public var categoryOrder: Shared.CarpetCategoryOrder? = nil
    
        /// Sets the order in which categories on this axis appear.
        /// 
        /// Only has an effect if `categoryorder` is set to *array*. Used with `categoryorder`.
        public var categoryArray: [Double]? = nil
    
        /// Extra padding between label and the axis
        public var labelPadding: Int? = nil
    
        /// Sets a axis label prefix.
        public var labelPrefix: String? = nil
    
        /// Sets a axis label suffix.
        public var labelSuffix: String? = nil
    
        /// Determines whether or not a line bounding this axis is drawn.
        public var showLine: Bool? = nil
    
        /// Sets the axis line color.
        public var lineColor: Color? = nil
    
        /// Sets the width (in px) of the axis line.
        public var lineWidth: Double? = nil
    
        /// Sets the axis line color.
        public var gridColor: Color? = nil
    
        /// Sets the width (in px) of the axis line.
        public var gridWidth: Double? = nil
    
        /// Determines whether or not grid lines are drawn.
        /// 
        /// If *true*, the grid lines are drawn at every tick mark.
        public var showGrid: Bool? = nil
    
        /// Sets the number of minor grid ticks per major grid tick
        public var minorGridCount: Int? = nil
    
        /// Sets the width (in px) of the grid lines.
        public var minorGridWidth: Double? = nil
    
        /// Sets the color of the grid lines.
        public var minorGridColor: Color? = nil
    
        /// Determines whether or not a line is drawn at along the starting value of this axis.
        /// 
        /// If *true*, the start line is drawn on top of the grid lines.
        public var startLine: Bool? = nil
    
        /// Sets the line color of the start line.
        public var startLineColor: Color? = nil
    
        /// Sets the width (in px) of the start line.
        public var startLineWidth: Double? = nil
    
        /// Determines whether or not a line is drawn at along the final value of this axis.
        /// 
        /// If *true*, the end line is drawn on top of the grid lines.
        public var endLine: Bool? = nil
    
        /// Sets the width (in px) of the end line.
        public var endLineWidth: Double? = nil
    
        /// Sets the line color of the end line.
        public var endLineColor: Color? = nil
    
        /// The starting index of grid lines along the axis
        public var tick0: Double? = nil
    
        /// The stride between grid lines along the axis
        public var dTick: Double? = nil
    
        /// The starting index of grid lines along the axis
        public var arrayTick0: Int? = nil
    
        /// The stride between grid lines along the axis
        public var arraydTick: Int? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case color
            case smoothing
            case title
            case type
            case autoRange = "autorange"
            case rangeMode = "rangemode"
            case range
            case fixedRange = "fixedrange"
            case cheaterType = "cheatertype"
            case tickMode = "tickmode"
            case numTicks = "nticks"
            case tickValues = "tickvals"
            case tickText = "ticktext"
            case showTickLabels = "showticklabels"
            case tickFont = "tickfont"
            case tickAngle = "tickangle"
            case tickPrefix = "tickprefix"
            case showTickPrefix = "showtickprefix"
            case tickSuffix = "ticksuffix"
            case showTickSuffix = "showticksuffix"
            case showExponent = "showexponent"
            case exponentFormat = "exponentformat"
            case separateThousands = "separatethousands"
            case tickFormat = "tickformat"
            case tickFormatStops = "tickformatstops"
            case categoryOrder = "categoryorder"
            case categoryArray = "categoryarray"
            case labelPadding = "labelpadding"
            case labelPrefix = "labelprefix"
            case labelSuffix = "labelsuffix"
            case showLine = "showline"
            case lineColor = "linecolor"
            case lineWidth = "linewidth"
            case gridColor = "gridcolor"
            case gridWidth = "gridwidth"
            case showGrid = "showgrid"
            case minorGridCount = "minorgridcount"
            case minorGridWidth = "minorgridwidth"
            case minorGridColor = "minorgridcolor"
            case startLine = "startline"
            case startLineColor = "startlinecolor"
            case startLineWidth = "startlinewidth"
            case endLine = "endline"
            case endLineWidth = "endlinewidth"
            case endLineColor = "endlinecolor"
            case tick0
            case dTick = "dtick"
            case arrayTick0 = "arraytick0"
            case arraydTick = "arraydtick"
        }
        
        /// Creates `BAxis` object with specified properties.
        /// 
        /// - Parameters:
        ///   - color: Sets default for all colors associated with this axis all at once: line, font, tick,
        ///   and grid colors.
        ///   - smoothing:
        ///   - title:
        ///   - type: Sets the axis type.
        ///   - autoRange: Determines whether or not the range of this axis is computed in relation to the
        ///   input data.
        ///   - rangeMode: If *normal*, the range is computed in relation to the extrema of the input data.
        ///   - range: Sets the range of this axis.
        ///   - fixedRange: Determines whether or not this axis is zoom-able.
        ///   - cheaterType:
        ///   - tickMode:
        ///   - numTicks: Specifies the maximum number of ticks for the particular axis.
        ///   - tickValues: Sets the values at which ticks on this axis appear.
        ///   - tickText: Sets the text displayed at the ticks position via `tickvals`.
        ///   - showTickLabels: Determines whether axis labels are drawn on the low side, the high side, both,
        ///   or neither side of the axis.
        ///   - tickFont: Sets the tick font.
        ///   - tickAngle: Sets the angle of the tick labels with respect to the horizontal.
        ///   - tickPrefix: Sets a tick label prefix.
        ///   - showTickPrefix: If *all*, all tick labels are displayed with a prefix.
        ///   - tickSuffix: Sets a tick label suffix.
        ///   - showTickSuffix: Same as `showtickprefix` but for tick suffixes.
        ///   - showExponent: If *all*, all exponents are shown besides their significands.
        ///   - exponentFormat: Determines a formatting rule for the tick exponents.
        ///   - separateThousands: If "true", even 4-digit integers are separated
        ///   - tickFormat: Sets the tick label formatting rule using d3 formatting mini-languages which are
        ///   very similar to those in Python.
        ///   - tickFormatStops:
        ///   - categoryOrder: Specifies the ordering logic for the case of categorical variables.
        ///   - categoryArray: Sets the order in which categories on this axis appear.
        ///   - labelPadding: Extra padding between label and the axis
        ///   - labelPrefix: Sets a axis label prefix.
        ///   - labelSuffix: Sets a axis label suffix.
        ///   - showLine: Determines whether or not a line bounding this axis is drawn.
        ///   - lineColor: Sets the axis line color.
        ///   - lineWidth: Sets the width (in px) of the axis line.
        ///   - gridColor: Sets the axis line color.
        ///   - gridWidth: Sets the width (in px) of the axis line.
        ///   - showGrid: Determines whether or not grid lines are drawn.
        ///   - minorGridCount: Sets the number of minor grid ticks per major grid tick
        ///   - minorGridWidth: Sets the width (in px) of the grid lines.
        ///   - minorGridColor: Sets the color of the grid lines.
        ///   - startLine: Determines whether or not a line is drawn at along the starting value of this axis.
        ///   - startLineColor: Sets the line color of the start line.
        ///   - startLineWidth: Sets the width (in px) of the start line.
        ///   - endLine: Determines whether or not a line is drawn at along the final value of this axis.
        ///   - endLineWidth: Sets the width (in px) of the end line.
        ///   - endLineColor: Sets the line color of the end line.
        ///   - tick0: The starting index of grid lines along the axis
        ///   - dTick: The stride between grid lines along the axis
        ///   - arrayTick0: The starting index of grid lines along the axis
        ///   - arraydTick: The stride between grid lines along the axis
        public init(color: Color? = nil, smoothing: Double? = nil, title: Title? = nil, type: `Type`? =
                nil, autoRange: Shared.AutoRange? = nil, rangeMode: Shared.RangeMode? = nil, range: InfoArray? =
                nil, fixedRange: Bool? = nil, cheaterType: CheaterType? = nil, tickMode: TickMode? = nil,
                numTicks: Int? = nil, tickValues: [Double]? = nil, tickText: [Double]? = nil, showTickLabels:
                ShowTickLabels? = nil, tickFont: Shared.Font? = nil, tickAngle: Angle? = nil, tickPrefix:
                String? = nil, showTickPrefix: Shared.ShowTickPrefix? = nil, tickSuffix: String? = nil,
                showTickSuffix: Shared.ShowTickSuffix? = nil, showExponent: Shared.ShowExponent? = nil,
                exponentFormat: Shared.ExponentFormat? = nil, separateThousands: Bool? = nil, tickFormat:
                String? = nil, tickFormatStops: [Shared.TickFormatStop]? = nil, categoryOrder:
                Shared.CarpetCategoryOrder? = nil, categoryArray: [Double]? = nil, labelPadding: Int? = nil,
                labelPrefix: String? = nil, labelSuffix: String? = nil, showLine: Bool? = nil, lineColor: Color?
                = nil, lineWidth: Double? = nil, gridColor: Color? = nil, gridWidth: Double? = nil, showGrid:
                Bool? = nil, minorGridCount: Int? = nil, minorGridWidth: Double? = nil, minorGridColor: Color? =
                nil, startLine: Bool? = nil, startLineColor: Color? = nil, startLineWidth: Double? = nil,
                endLine: Bool? = nil, endLineWidth: Double? = nil, endLineColor: Color? = nil, tick0: Double? =
                nil, dTick: Double? = nil, arrayTick0: Int? = nil, arraydTick: Int? = nil) {
            self.color = color
            self.smoothing = smoothing
            self.title = title
            self.type = type
            self.autoRange = autoRange
            self.rangeMode = rangeMode
            self.range = range
            self.fixedRange = fixedRange
            self.cheaterType = cheaterType
            self.tickMode = tickMode
            self.numTicks = numTicks
            self.tickValues = tickValues
            self.tickText = tickText
            self.showTickLabels = showTickLabels
            self.tickFont = tickFont
            self.tickAngle = tickAngle
            self.tickPrefix = tickPrefix
            self.showTickPrefix = showTickPrefix
            self.tickSuffix = tickSuffix
            self.showTickSuffix = showTickSuffix
            self.showExponent = showExponent
            self.exponentFormat = exponentFormat
            self.separateThousands = separateThousands
            self.tickFormat = tickFormat
            self.tickFormatStops = tickFormatStops
            self.categoryOrder = categoryOrder
            self.categoryArray = categoryArray
            self.labelPadding = labelPadding
            self.labelPrefix = labelPrefix
            self.labelSuffix = labelSuffix
            self.showLine = showLine
            self.lineColor = lineColor
            self.lineWidth = lineWidth
            self.gridColor = gridColor
            self.gridWidth = gridWidth
            self.showGrid = showGrid
            self.minorGridCount = minorGridCount
            self.minorGridWidth = minorGridWidth
            self.minorGridColor = minorGridColor
            self.startLine = startLine
            self.startLineColor = startLineColor
            self.startLineWidth = startLineWidth
            self.endLine = endLine
            self.endLineWidth = endLineWidth
            self.endLineColor = endLineColor
            self.tick0 = tick0
            self.dTick = dTick
            self.arrayTick0 = arrayTick0
            self.arraydTick = arraydTick
        }
        
    }
    public var bAxis: BAxis? = nil

    /// The default font used for axis & tick labels on this carpet
    public var font: Shared.Font? = nil

    /// Sets default for all colors associated with this axis all at once: line, font, tick, and grid
    /// colors.
    /// 
    /// Grid color is lightened by blending this with the plot background Individual pieces can override
    /// this.
    public var color: Color? = nil

    /// Sets a reference between this trace's x coordinates and a 2D cartesian x axis.
    /// 
    /// If *x* (the default value), the x coordinates refer to `layout.xaxis`. If *x2*, the x
    /// coordinates refer to `layout.xaxis2`, and so on.
    public var xAxis: Layout.XAxis = Layout.XAxis(uid: 1)

    /// Sets a reference between this trace's y coordinates and a 2D cartesian y axis.
    /// 
    /// If *y* (the default value), the y coordinates refer to `layout.yaxis`. If *y2*, the y
    /// coordinates refer to `layout.yaxis2`, and so on.
    public var yAxis: Layout.YAxis = Layout.YAxis(uid: 1)

    /// Decoding and encoding keys compatible with Plotly schema.
    enum CodingKeys: String, CodingKey {
        case type
        case visible
        case opacity
        case name
        case uid
        case ids
        case customData = "customdata"
        case meta
        case stream
        case uiRevision = "uirevision"
        case carpet
        case x
        case y
        case a
        case a0
        case da
        case b
        case b0
        case db
        case cheaterSlope = "cheaterslope"
        case aAxis = "aaxis"
        case bAxis = "baxis"
        case font
        case color
        case xAxis = "xaxis"
        case yAxis = "yaxis"
    }
    
    /// Creates `Carpet` object from the most frequently used properties.
    /// 
    /// - Parameters:
    ///   - name: Sets the trace name.
    ///   - x: A two dimensional array of x coordinates at each carpet point.
    ///   - y: A two dimensional array of y coordinates at each carpet point.
    ///   - a: An array containing values of the first parameter value
    ///   - b: A two dimensional array of y coordinates at each carpet point.
    public init(name: String? = nil, x: XData? = nil, y: YData? = nil, a: AData? = nil, b: BData? =
            nil) {
        self.name = name
        self.x = x
        self.y = y
        self.a = a
        self.b = b
    }
    
    /// Creates `Carpet` object with specified properties.
    /// 
    /// - Parameters:
    ///   - visible: Determines whether or not this trace is visible.
    ///   - opacity: Sets the opacity of the trace.
    ///   - name: Sets the trace name.
    ///   - uid: Assign an id to this trace, Use this to provide object constancy between traces during
    ///   animations and transitions.
    ///   - ids: Assigns id labels to each datum.
    ///   - customData: Assigns extra data each datum.
    ///   - meta: Assigns extra meta information associated with this trace that can be used in various
    ///   text attributes.
    ///   - stream:
    ///   - uiRevision: Controls persistence of some user-driven changes to the trace: `constraintrange`
    ///   in `parcoords` traces, as well as some `editable: true` modifications such as `name` and
    ///   `colorbar.title`.
    ///   - carpet: An identifier for this carpet, so that `scattercarpet` and `contourcarpet` traces can
    ///   specify a carpet plot on which they lie
    ///   - x: A two dimensional array of x coordinates at each carpet point.
    ///   - y: A two dimensional array of y coordinates at each carpet point.
    ///   - a: An array containing values of the first parameter value
    ///   - a0: Alternate to `a`.
    ///   - da: Sets the a coordinate step.
    ///   - b: A two dimensional array of y coordinates at each carpet point.
    ///   - b0: Alternate to `b`.
    ///   - db: Sets the b coordinate step.
    ///   - cheaterSlope: The shift applied to each successive row of data in creating a cheater plot.
    ///   - aAxis:
    ///   - bAxis:
    ///   - font: The default font used for axis & tick labels on this carpet
    ///   - color: Sets default for all colors associated with this axis all at once: line, font, tick,
    ///   and grid colors.
    ///   - xAxis: Sets a reference between this trace's x coordinates and a 2D cartesian x axis.
    ///   - yAxis: Sets a reference between this trace's y coordinates and a 2D cartesian y axis.
    public init(visible: Shared.Visible? = nil, opacity: Double? = nil, name: String? = nil, uid:
            String? = nil, ids: [String]? = nil, customData: [String]? = nil, meta: Data<Anything>? = nil,
            stream: Shared.Stream? = nil, uiRevision: Anything? = nil, carpet: String? = nil, x: XData? =
            nil, y: YData? = nil, a: AData? = nil, a0: Double? = nil, da: Double? = nil, b: BData? = nil,
            b0: Double? = nil, db: Double? = nil, cheaterSlope: Double? = nil, aAxis: AAxis? = nil, bAxis:
            BAxis? = nil, font: Shared.Font? = nil, color: Color? = nil, xAxis: Layout.XAxis =
            Layout.XAxis(uid: 1), yAxis: Layout.YAxis = Layout.YAxis(uid: 1)) {
        self.visible = visible
        self.opacity = opacity
        self.name = name
        self.uid = uid
        self.ids = ids
        self.customData = customData
        self.meta = meta
        self.stream = stream
        self.uiRevision = uiRevision
        self.carpet = carpet
        self.x = x
        self.y = y
        self.a = a
        self.a0 = a0
        self.da = da
        self.b = b
        self.b0 = b0
        self.db = db
        self.cheaterSlope = cheaterSlope
        self.aAxis = aAxis
        self.bAxis = bAxis
        self.font = font
        self.color = color
        self.xAxis = xAxis
        self.yAxis = yAxis
    }
    
    /// Encodes the object in a format compatible with Plotly.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(visible, forKey: .visible)
        try container.encodeIfPresent(opacity, forKey: .opacity)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(uid, forKey: .uid)
        try container.encodeIfPresent(ids, forKey: .ids)
        try container.encodeIfPresent(customData, forKey: .customData)
        try container.encodeIfPresent(meta, forKey: .meta)
        try container.encodeIfPresent(stream, forKey: .stream)
        try container.encodeIfPresent(uiRevision, forKey: .uiRevision)
        try container.encodeIfPresent(carpet, forKey: .carpet)
        if let x = self.x {
            try x.encode(toPlotly: container.superEncoder(forKey: .x))
        }
        if let y = self.y {
            try y.encode(toPlotly: container.superEncoder(forKey: .y))
        }
        if let a = self.a {
            try a.encode(toPlotly: container.superEncoder(forKey: .a))
        }
        try container.encodeIfPresent(a0, forKey: .a0)
        try container.encodeIfPresent(da, forKey: .da)
        if let b = self.b {
            try b.encode(toPlotly: container.superEncoder(forKey: .b))
        }
        try container.encodeIfPresent(b0, forKey: .b0)
        try container.encodeIfPresent(db, forKey: .db)
        try container.encodeIfPresent(cheaterSlope, forKey: .cheaterSlope)
        try container.encodeIfPresent(aAxis, forKey: .aAxis)
        try container.encodeIfPresent(bAxis, forKey: .bAxis)
        try container.encodeIfPresent(font, forKey: .font)
        try container.encodeIfPresent(color, forKey: .color)
        try container.encode("x\(xAxis.uid)", forKey: .xAxis)
        try container.encode("y\(yAxis.uid)", forKey: .yAxis)
    }
}