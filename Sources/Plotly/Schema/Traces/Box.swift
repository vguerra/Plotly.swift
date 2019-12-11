/// In vertical (horizontal) box plots, statistics are computed using `y` (`x`) values. By supplying an `x` (`y`) array, one box per distinct x (y) value is drawn If no `x` (`y`) {array} is provided, a single box is drawn. That box position is then positioned with with `name` or with `x0` (`y0`) if provided. Each box spans from quartile 1 (Q1) to quartile 3 (Q3). The second quartile (Q2) is marked by a line inside the box. By default, the whiskers correspond to the box' edges +/- 1.5 times the interquartile range (IQR: Q3-Q1), see *boxpoints* for other options.
public struct Box: Trace {
    public let type: String = "box"

    public let animatable: Bool = false

    /// Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).
    public enum Visible: String, Encodable {
        case yes = "true"
        case no = "false"
        case legendOnly = "legendonly"
    }
    /// Determines whether or not this trace is visible. If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the legend itself is visible).
    public var visible: Visible?

    /// Determines whether or not an item corresponding to this trace is shown in the legend.
    public var showLegend: Bool?

    /// Sets the legend group for this trace. Traces part of the same legend group hide/show at the same time when toggling legend items.
    public var legendGroup: String?

    /// Sets the opacity of the trace.
    public var opacity: Double?

    /// Assign an id to this trace, Use this to provide object constancy between traces during animations and transitions.
    public var uid: String?

    /// Assigns id labels to each datum. These ids for object constancy of data points during animation. Should be an array of strings, not numbers or any other type.
    public var ids: [Double]?

    /// Assigns extra data each datum. This may be useful when listening to hover, click and selection events. Note that, *scatter* traces also appends customdata items in the markers DOM elements
    public var customData: [Double]?

    /// Assigns extra meta information associated with this trace that can be used in various text attributes. Attributes such as trace `name`, graph, axis and colorbar `title.text`, annotation `text` `rangeselector`, `updatemenues` and `sliders` `label` text all support `meta`. To access the trace `meta` values in an attribute in the same trace, simply use `%{meta[i]}` where `i` is the index or key of the `meta` item in question. To access trace `meta` in layout attributes, use `%{data[n[.meta[i]}` where `i` is the index or key of the `meta` and `n` is the trace index.
    public var meta: Anything?

    /// Array containing integer indices of selected points. Has an effect only for traces that support selections. Note that an empty array means an empty selection where the `unselected` are turned on for all points, whereas, any other non-array values means no selection all where the `selected` and `unselected` styles have no effect.
    public var selectedPoints: Anything?

    /// Determines which trace information appear on hover. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.
    public struct HoverInfo: OptionSet, Encodable {
        public let rawValue: Int
    
        public static let x = HoverInfo(rawValue: 1 << 0)
        public static let y = HoverInfo(rawValue: 1 << 1)
        public static let z = HoverInfo(rawValue: 1 << 2)
        public static let text = HoverInfo(rawValue: 1 << 3)
        public static let name = HoverInfo(rawValue: 1 << 4)
    
        public init(rawValue: Int) { self.rawValue = rawValue }
    
        public func encode(to encoder: Encoder) throws {
            var options = [String]()
            if (self.rawValue & 1 << 0) != 0 { options += ["x"] }
            if (self.rawValue & 1 << 1) != 0 { options += ["y"] }
            if (self.rawValue & 1 << 2) != 0 { options += ["z"] }
            if (self.rawValue & 1 << 3) != 0 { options += ["text"] }
            if (self.rawValue & 1 << 4) != 0 { options += ["name"] }
            var container = encoder.singleValueContainer()
            try container.encode(options.joined(separator: "+"))
        }
    }
    /// Determines which trace information appear on hover. If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set, click and hover events are still fired.
    public var hoverInfo: HoverInfo?

    public struct HoverLabel: Encodable {
        /// Sets the background color of the hover labels for this trace
        public var backgroundColor: Color?
    
        /// Sets the border color of the hover labels for this trace.
        public var borderColor: Color?
    
        /// Sets the font used in hover labels.
        public struct Font: Encodable {
            /// HTML font family - the typeface that will be applied by the web browser. The web browser will only be able to apply a font if it is available on the system which it operates. Provide multiple font families, separated by commas, to indicate the preference in which to apply fonts if they aren't available on the system. The plotly service (at https://plot.ly or on-premise) generates images on a server, where only a select number of fonts are installed and supported. These include *Arial*, *Balto*, *Courier New*, *Droid Sans*,, *Droid Serif*, *Droid Sans Mono*, *Gravitas One*, *Old Standard TT*, *Open Sans*, *Overpass*, *PT Sans Narrow*, *Raleway*, *Times New Roman*.
            public var family: String?
        
            public var size: Double?
        
            public var color: Color?
        
            /// Sets the source reference on plot.ly for  family .
            public var familySource: String?
        
            /// Sets the source reference on plot.ly for  size .
            public var sizeSource: String?
        
            /// Sets the source reference on plot.ly for  color .
            public var colorSource: String?
        
            public init(family: String? = nil, size: Double? = nil, color: Color? = nil, familySource: String? = nil, sizeSource: String? = nil, colorSource: String? = nil) {
                self.family = family
                self.size = size
                self.color = color
                self.familySource = familySource
                self.sizeSource = sizeSource
                self.colorSource = colorSource
            }
        }
        /// Sets the font used in hover labels.
        public var font: Font?
    
        /// Sets the horizontal alignment of the text content within hover label box. Has an effect only if the hover label text spans more two or more lines
        public enum Align: String, Encodable {
            case left
            case right
            case auto
        }
        /// Sets the horizontal alignment of the text content within hover label box. Has an effect only if the hover label text spans more two or more lines
        public var align: Align?
    
        /// Sets the default length (in number of characters) of the trace name in the hover labels for all traces. -1 shows the whole name regardless of length. 0-3 shows the first 0-3 characters, and an integer >3 will show the whole name if it is less than that many characters, but if it is longer, will truncate to `namelength - 3` characters and add an ellipsis.
        public var nameLength: Int?
    
        /// Sets the source reference on plot.ly for  bgcolor .
        public var backgroundColorSource: String?
    
        /// Sets the source reference on plot.ly for  bordercolor .
        public var borderColorSource: String?
    
        /// Sets the source reference on plot.ly for  align .
        public var alignSource: String?
    
        /// Sets the source reference on plot.ly for  namelength .
        public var nameLengthSource: String?
    
        public init(backgroundColor: Color? = nil, borderColor: Color? = nil, font: Font? = nil, align: Align? = nil, nameLength: Int? = nil, backgroundColorSource: String? = nil, borderColorSource: String? = nil, alignSource: String? = nil, nameLengthSource: String? = nil) {
            self.backgroundColor = backgroundColor
            self.borderColor = borderColor
            self.font = font
            self.align = align
            self.nameLength = nameLength
            self.backgroundColorSource = backgroundColorSource
            self.borderColorSource = borderColorSource
            self.alignSource = alignSource
            self.nameLengthSource = nameLengthSource
        }
    }
    public var hoverLabel: HoverLabel?

    public struct Stream: Encodable {
        /// The stream id number links a data trace on a plot with a stream. See https://plot.ly/settings for more details.
        public var token: String?
    
        /// Sets the maximum number of points to keep on the plots from an incoming stream. If `maxpoints` is set to *50*, only the newest 50 points will be displayed on the plot.
        public var maxPoints: Double?
    
        public init(token: String? = nil, maxPoints: Double? = nil) {
            self.token = token
            self.maxPoints = maxPoints
        }
    }
    public var stream: Stream?

    public struct Transforms: Encodable {
        public struct Items: Encodable {
            /// An array of operations that manipulate the trace data, for example filtering or sorting the data arrays.
            public struct Transform: Encodable {
                public init() {
                }
            }
            /// An array of operations that manipulate the trace data, for example filtering or sorting the data arrays.
            public var transform: Transform?
        
            public init(transform: Transform? = nil) {
                self.transform = transform
            }
        }
        public var items: Items?
    
        public init(items: Items? = nil) {
            self.items = items
        }
    }
    public var transforms: Transforms?

    /// Controls persistence of some user-driven changes to the trace: `constraintrange` in `parcoords` traces, as well as some `editable: true` modifications such as `name` and `colorbar.title`. Defaults to `layout.uirevision`. Note that other user-driven trace attribute changes are controlled by `layout` attributes: `trace.visible` is controlled by `layout.legend.uirevision`, `selectedpoints` is controlled by `layout.selectionrevision`, and `colorbar.(x|y)` (accessible with `config: {editable: true}`) is controlled by `layout.editrevision`. Trace changes are tracked by `uid`, which only falls back on trace index if no `uid` is provided. So if your app can add/remove traces before the end of the `data` array, such that the same trace has a different index, you can still preserve user-driven changes if you give each trace a `uid` that stays with it as it moves.
    public var uiRevision: Anything?

    /// Sets the y sample data or coordinates. See overview for more info.
    public var y: [Double]?

    /// Sets the x sample data or coordinates. See overview for more info.
    public var x: [Double]?

    /// Sets the x coordinate of the box. See overview for more info.
    public var x0: Anything?

    /// Sets the y coordinate of the box. See overview for more info.
    public var y0: Anything?

    /// Sets the trace name. The trace name appear as the legend item and on hover. For box traces, the name will also be used for the position coordinate, if `x` and `x0` (`y` and `y0` if horizontal) are missing and the position axis is categorical
    public var name: String?

    /// Sets the text elements associated with each sample value. If a single string, the same string appears over all the data points. If an array of string, the items are mapped in order to the this trace's (x,y) coordinates. To be seen, trace `hoverinfo` must contain a *text* flag.
    public var text: String?

    /// Same as `text`.
    public var hoverText: String?

    /// Template string used for rendering the information that appear on hover box. Note that this will override `hoverinfo`. Variables are inserted using %{variable}, for example "y: %{y}". Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example "Price: %{y:$.2f}". https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format for details on the formatting syntax. Dates are formatted using d3-time-format's syntax %{variable|d3-time-format}, for example "Day: %{2019-01-01|%A}". https://github.com/d3/d3-3.x-api-reference/blob/master/Time-Formatting.md#format for details on the date formatting syntax. The variables available in `hovertemplate` are the ones emitted as event data described at this link https://plot.ly/javascript/plotlyjs-events/#event-data. Additionally, every attributes that can be specified per-point (the ones that are `arrayOk: true`) are available.  Anything contained in tag `<extra>` is displayed in the secondary box, for example "<extra>{fullData.name}</extra>". To hide the secondary box completely, use an empty tag `<extra></extra>`.
    public var hoverTemplate: String?

    /// Sets the width of the whiskers relative to the box' width. For example, with 1, the whiskers are as wide as the box(es).
    public var whiskerWidth: Double?

    /// Determines whether or not notches should be drawn.
    public var notched: Bool?

    /// Sets the width of the notches relative to the box' width. For example, with 0, the notches are as wide as the box(es).
    public var notchWidth: Double?

    /// If *outliers*, only the sample points lying outside the whiskers are shown If *suspectedoutliers*, the outlier points are shown and points either less than 4*Q1-3*Q3 or greater than 4*Q3-3*Q1 are highlighted (see `outliercolor`) If *all*, all sample points are shown If *false*, only the box(es) are shown with no sample points
    public enum BoxPoints: String, Encodable {
        case all
        case outliers
        case suspectedOutliers = "suspectedoutliers"
        case no = "false"
    }
    /// If *outliers*, only the sample points lying outside the whiskers are shown If *suspectedoutliers*, the outlier points are shown and points either less than 4*Q1-3*Q3 or greater than 4*Q3-3*Q1 are highlighted (see `outliercolor`) If *all*, all sample points are shown If *false*, only the box(es) are shown with no sample points
    public var boxPoints: BoxPoints?

    /// If *true*, the mean of the box(es)' underlying distribution is drawn as a dashed line inside the box(es). If *sd* the standard deviation is also drawn.
    public enum BoxMean: String, Encodable {
        case yes = "true"
        case sd
        case no = "false"
    }
    /// If *true*, the mean of the box(es)' underlying distribution is drawn as a dashed line inside the box(es). If *sd* the standard deviation is also drawn.
    public var boxMean: BoxMean?

    /// Sets the amount of jitter in the sample points drawn. If *0*, the sample points align along the distribution axis. If *1*, the sample points are drawn in a random jitter of width equal to the width of the box(es).
    public var jitter: Double?

    /// Sets the position of the sample points in relation to the box(es). If *0*, the sample points are places over the center of the box(es). Positive (negative) values correspond to positions to the right (left) for vertical boxes and above (below) for horizontal boxes
    public var pointPosition: Double?

    /// Sets the orientation of the box(es). If *v* (*h*), the distribution is visualized along the vertical (horizontal).
    public enum Orientation: String, Encodable {
        case v
        case h
    }
    /// Sets the orientation of the box(es). If *v* (*h*), the distribution is visualized along the vertical (horizontal).
    public var orientation: Orientation?

    /// Sets the width of the box in data coordinate If *0* (default value) the width is automatically selected based on the positions of other box traces in the same subplot.
    public var width: Double?

    public struct Marker: Encodable {
        /// Sets the color of the outlier sample points.
        public var outlierColor: Color?
    
        /// Sets the marker symbol type. Adding 100 is equivalent to appending *-open* to a symbol name. Adding 200 is equivalent to appending *-dot* to a symbol name. Adding 300 is equivalent to appending *-open-dot* or *dot-open* to a symbol name.
        public enum Symbol: String, Encodable {
            case circle
            case circleOpen = "circle-open"
            case circleDot = "circle-dot"
            case circleOpenDot = "circle-open-dot"
            case square
            case squareOpen = "square-open"
            case squareDot = "square-dot"
            case squareOpenDot = "square-open-dot"
            case diamond
            case diamondOpen = "diamond-open"
            case diamondDot = "diamond-dot"
            case diamondOpenDot = "diamond-open-dot"
            case cross
            case crossOpen = "cross-open"
            case crossDot = "cross-dot"
            case crossOpenDot = "cross-open-dot"
            case x
            case xOpen = "x-open"
            case xDot = "x-dot"
            case xOpenDot = "x-open-dot"
            case triangleUp = "triangle-up"
            case triangleUpOpen = "triangle-up-open"
            case triangleUpDot = "triangle-up-dot"
            case triangleUpOpenDot = "triangle-up-open-dot"
            case triangleDown = "triangle-down"
            case triangleDownOpen = "triangle-down-open"
            case triangleDownDot = "triangle-down-dot"
            case triangleDownOpenDot = "triangle-down-open-dot"
            case triangleLeft = "triangle-left"
            case triangleLeftOpen = "triangle-left-open"
            case triangleLeftDot = "triangle-left-dot"
            case triangleLeftOpenDot = "triangle-left-open-dot"
            case triangleRight = "triangle-right"
            case triangleRightOpen = "triangle-right-open"
            case triangleRightDot = "triangle-right-dot"
            case triangleRightOpenDot = "triangle-right-open-dot"
            case triangleNE = "triangle-ne"
            case triangleNEOpen = "triangle-ne-open"
            case triangleNEDot = "triangle-ne-dot"
            case triangleNEOpenDot = "triangle-ne-open-dot"
            case triangleSE = "triangle-se"
            case triangleSEOpen = "triangle-se-open"
            case triangleSEDot = "triangle-se-dot"
            case triangleSEOpenDot = "triangle-se-open-dot"
            case triangleSW = "triangle-sw"
            case triangleSWOpen = "triangle-sw-open"
            case triangleSWDot = "triangle-sw-dot"
            case triangleSWOpenDot = "triangle-sw-open-dot"
            case triangleNW = "triangle-nw"
            case triangleNWOpen = "triangle-nw-open"
            case triangleNWDot = "triangle-nw-dot"
            case triangleNWOpenDot = "triangle-nw-open-dot"
            case pentagon
            case pentagonOpen = "pentagon-open"
            case pentagonDot = "pentagon-dot"
            case pentagonOpenDot = "pentagon-open-dot"
            case hexagon
            case hexagonOpen = "hexagon-open"
            case hexagonDot = "hexagon-dot"
            case hexagonOpenDot = "hexagon-open-dot"
            case hexagon2
            case hexagon2Open = "hexagon2-open"
            case hexagon2Dot = "hexagon2-dot"
            case hexagon2OpenDot = "hexagon2-open-dot"
            case octagon
            case octagonOpen = "octagon-open"
            case octagonDot = "octagon-dot"
            case octagonOpenDot = "octagon-open-dot"
            case star
            case starOpen = "star-open"
            case starDot = "star-dot"
            case starOpenDot = "star-open-dot"
            case hexagram
            case hexagramOpen = "hexagram-open"
            case hexagramDot = "hexagram-dot"
            case hexagramOpenDot = "hexagram-open-dot"
            case starTriangleUp = "star-triangle-up"
            case starTriangleUpOpen = "star-triangle-up-open"
            case starTriangleUpDot = "star-triangle-up-dot"
            case starTriangleUpOpenDot = "star-triangle-up-open-dot"
            case starTriangleDown = "star-triangle-down"
            case starTriangleDownOpen = "star-triangle-down-open"
            case starTriangleDownDot = "star-triangle-down-dot"
            case starTriangleDownOpenDot = "star-triangle-down-open-dot"
            case starSquare = "star-square"
            case starSquareOpen = "star-square-open"
            case starSquareDot = "star-square-dot"
            case starSquareOpenDot = "star-square-open-dot"
            case starDiamond = "star-diamond"
            case starDiamondOpen = "star-diamond-open"
            case starDiamondDot = "star-diamond-dot"
            case starDiamondOpenDot = "star-diamond-open-dot"
            case diamondTall = "diamond-tall"
            case diamondTallOpen = "diamond-tall-open"
            case diamondTallDot = "diamond-tall-dot"
            case diamondTallOpenDot = "diamond-tall-open-dot"
            case diamondWide = "diamond-wide"
            case diamondWideOpen = "diamond-wide-open"
            case diamondWideDot = "diamond-wide-dot"
            case diamondWideOpenDot = "diamond-wide-open-dot"
            case hourglass
            case hourglassOpen = "hourglass-open"
            case bowTie = "bowtie"
            case bowTieOpen = "bowtie-open"
            case circleCross = "circle-cross"
            case circleCrossOpen = "circle-cross-open"
            case circleX = "circle-x"
            case circleXOpen = "circle-x-open"
            case squareCross = "square-cross"
            case squareCrossOpen = "square-cross-open"
            case squareX = "square-x"
            case squareXOpen = "square-x-open"
            case diamondCross = "diamond-cross"
            case diamondCrossOpen = "diamond-cross-open"
            case diamondX = "diamond-x"
            case diamondXOpen = "diamond-x-open"
            case crossThin = "cross-thin"
            case crossThinOpen = "cross-thin-open"
            case xThin = "x-thin"
            case xThinOpen = "x-thin-open"
            case asterisk
            case asteriskOpen = "asterisk-open"
            case hash
            case hashOpen = "hash-open"
            case hashDot = "hash-dot"
            case hashOpenDot = "hash-open-dot"
            case yUp = "y-up"
            case yUpOpen = "y-up-open"
            case yDown = "y-down"
            case yDownOpen = "y-down-open"
            case yLeft = "y-left"
            case yLeftOpen = "y-left-open"
            case yRight = "y-right"
            case yRightOpen = "y-right-open"
            case lineEw = "line-ew"
            case lineEwOpen = "line-ew-open"
            case lineNS = "line-ns"
            case lineNSOpen = "line-ns-open"
            case lineNE = "line-ne"
            case lineNEOpen = "line-ne-open"
            case lineNW = "line-nw"
            case lineNWOpen = "line-nw-open"
        }
        /// Sets the marker symbol type. Adding 100 is equivalent to appending *-open* to a symbol name. Adding 200 is equivalent to appending *-dot* to a symbol name. Adding 300 is equivalent to appending *-open-dot* or *dot-open* to a symbol name.
        public var symbol: Symbol?
    
        /// Sets the marker opacity.
        public var opacity: Double?
    
        /// Sets the marker size (in px).
        public var size: Double?
    
        /// Sets themarkercolor. It accepts either a specific color or an array of numbers that are mapped to the colorscale relative to the max and min values of the array or relative to `marker.cmin` and `marker.cmax` if set.
        public var color: Color?
    
        public struct Line: Encodable {
            /// Sets themarker.linecolor. It accepts either a specific color or an array of numbers that are mapped to the colorscale relative to the max and min values of the array or relative to `marker.line.cmin` and `marker.line.cmax` if set.
            public var color: Color?
        
            /// Sets the width (in px) of the lines bounding the marker points.
            public var width: Double?
        
            /// Sets the border line color of the outlier sample points. Defaults to marker.color
            public var outlierColor: Color?
        
            /// Sets the border line width (in px) of the outlier sample points.
            public var outlierWidth: Double?
        
            public init(color: Color? = nil, width: Double? = nil, outlierColor: Color? = nil, outlierWidth: Double? = nil) {
                self.color = color
                self.width = width
                self.outlierColor = outlierColor
                self.outlierWidth = outlierWidth
            }
        }
        public var line: Line?
    
        public init(outlierColor: Color? = nil, symbol: Symbol? = nil, opacity: Double? = nil, size: Double? = nil, color: Color? = nil, line: Line? = nil) {
            self.outlierColor = outlierColor
            self.symbol = symbol
            self.opacity = opacity
            self.size = size
            self.color = color
            self.line = line
        }
    }
    public var marker: Marker?

    public struct Line: Encodable {
        /// Sets the color of line bounding the box(es).
        public var color: Color?
    
        /// Sets the width (in px) of line bounding the box(es).
        public var width: Double?
    
        public init(color: Color? = nil, width: Double? = nil) {
            self.color = color
            self.width = width
        }
    }
    public var line: Line?

    /// Sets the fill color. Defaults to a half-transparent variant of the line color, marker color, or marker line color, whichever is available.
    public var fillColor: Color?

    /// Set several traces linked to the same position axis or matching axes to the same offsetgroup where bars of the same position coordinate will line up.
    public var offsetGroup: String?

    /// Set several traces linked to the same position axis or matching axes to the same alignmentgroup. This controls whether bars compute their positional range dependently or independently.
    public var alignmentGroup: String?

    public struct Selected: Encodable {
        public struct Marker: Encodable {
            /// Sets the marker opacity of selected points.
            public var opacity: Double?
        
            /// Sets the marker color of selected points.
            public var color: Color?
        
            /// Sets the marker size of selected points.
            public var size: Double?
        
            public init(opacity: Double? = nil, color: Color? = nil, size: Double? = nil) {
                self.opacity = opacity
                self.color = color
                self.size = size
            }
        }
        public var marker: Marker?
    
        public init(marker: Marker? = nil) {
            self.marker = marker
        }
    }
    public var selected: Selected?

    public struct Unselected: Encodable {
        public struct Marker: Encodable {
            /// Sets the marker opacity of unselected points, applied only when a selection exists.
            public var opacity: Double?
        
            /// Sets the marker color of unselected points, applied only when a selection exists.
            public var color: Color?
        
            /// Sets the marker size of unselected points, applied only when a selection exists.
            public var size: Double?
        
            public init(opacity: Double? = nil, color: Color? = nil, size: Double? = nil) {
                self.opacity = opacity
                self.color = color
                self.size = size
            }
        }
        public var marker: Marker?
    
        public init(marker: Marker? = nil) {
            self.marker = marker
        }
    }
    public var unselected: Unselected?

    /// Do the hover effects highlight individual boxes  or sample points or both?
    public struct HoverOn: OptionSet, Encodable {
        public let rawValue: Int
    
        public static let boxes = HoverOn(rawValue: 1 << 0)
        public static let points = HoverOn(rawValue: 1 << 1)
    
        public init(rawValue: Int) { self.rawValue = rawValue }
    
        public func encode(to encoder: Encoder) throws {
            var options = [String]()
            if (self.rawValue & 1 << 0) != 0 { options += ["boxes"] }
            if (self.rawValue & 1 << 1) != 0 { options += ["points"] }
            var container = encoder.singleValueContainer()
            try container.encode(options.joined(separator: "+"))
        }
    }
    /// Do the hover effects highlight individual boxes  or sample points or both?
    public var hoverOn: HoverOn?

    /// Sets the calendar system to use with `x` date data.
    public enum XCalendar: String, Encodable {
        case gregorian
        case chinese
        case coptic
        case discworld
        case ethiopian
        case hebrew
        case islamic
        case julian
        case mayan
        case nanakshahi
        case nepali
        case persian
        case jalali
        case taiwan
        case thai
        case ummalqura
    }
    /// Sets the calendar system to use with `x` date data.
    public var xCalendar: XCalendar?

    /// Sets the calendar system to use with `y` date data.
    public enum YCalendar: String, Encodable {
        case gregorian
        case chinese
        case coptic
        case discworld
        case ethiopian
        case hebrew
        case islamic
        case julian
        case mayan
        case nanakshahi
        case nepali
        case persian
        case jalali
        case taiwan
        case thai
        case ummalqura
    }
    /// Sets the calendar system to use with `y` date data.
    public var yCalendar: YCalendar?

    /// Sets a reference between this trace's x coordinates and a 2D cartesian x axis. If *x* (the default value), the x coordinates refer to `layout.xaxis`. If *x2*, the x coordinates refer to `layout.xaxis2`, and so on.
    public var xAxis: SubplotID?

    /// Sets a reference between this trace's y coordinates and a 2D cartesian y axis. If *y* (the default value), the y coordinates refer to `layout.yaxis`. If *y2*, the y coordinates refer to `layout.yaxis2`, and so on.
    public var yAxis: SubplotID?

    /// Sets the source reference on plot.ly for  ids .
    public var idsSource: String?

    /// Sets the source reference on plot.ly for  customdata .
    public var customDataSource: String?

    /// Sets the source reference on plot.ly for  meta .
    public var metaSource: String?

    /// Sets the source reference on plot.ly for  hoverinfo .
    public var hoverInfoSource: String?

    /// Sets the source reference on plot.ly for  y .
    public var ySource: String?

    /// Sets the source reference on plot.ly for  x .
    public var xSource: String?

    /// Sets the source reference on plot.ly for  text .
    public var textSource: String?

    /// Sets the source reference on plot.ly for  hovertext .
    public var hoverTextSource: String?

    /// Sets the source reference on plot.ly for  hovertemplate .
    public var hoverTemplateSource: String?

    public init(visible: Visible? = nil, showLegend: Bool? = nil, legendGroup: String? = nil, opacity: Double? = nil, uid: String? = nil, ids: [Double]? = nil, customData: [Double]? = nil, meta: Anything? = nil, selectedPoints: Anything? = nil, hoverInfo: HoverInfo? = nil, hoverLabel: HoverLabel? = nil, stream: Stream? = nil, transforms: Transforms? = nil, uiRevision: Anything? = nil, y: [Double]? = nil, x: [Double]? = nil, x0: Anything? = nil, y0: Anything? = nil, name: String? = nil, text: String? = nil, hoverText: String? = nil, hoverTemplate: String? = nil, whiskerWidth: Double? = nil, notched: Bool? = nil, notchWidth: Double? = nil, boxPoints: BoxPoints? = nil, boxMean: BoxMean? = nil, jitter: Double? = nil, pointPosition: Double? = nil, orientation: Orientation? = nil, width: Double? = nil, marker: Marker? = nil, line: Line? = nil, fillColor: Color? = nil, offsetGroup: String? = nil, alignmentGroup: String? = nil, selected: Selected? = nil, unselected: Unselected? = nil, hoverOn: HoverOn? = nil, xCalendar: XCalendar? = nil, yCalendar: YCalendar? = nil, xAxis: SubplotID? = nil, yAxis: SubplotID? = nil, idsSource: String? = nil, customDataSource: String? = nil, metaSource: String? = nil, hoverInfoSource: String? = nil, ySource: String? = nil, xSource: String? = nil, textSource: String? = nil, hoverTextSource: String? = nil, hoverTemplateSource: String? = nil) {
        self.visible = visible
        self.showLegend = showLegend
        self.legendGroup = legendGroup
        self.opacity = opacity
        self.uid = uid
        self.ids = ids
        self.customData = customData
        self.meta = meta
        self.selectedPoints = selectedPoints
        self.hoverInfo = hoverInfo
        self.hoverLabel = hoverLabel
        self.stream = stream
        self.transforms = transforms
        self.uiRevision = uiRevision
        self.y = y
        self.x = x
        self.x0 = x0
        self.y0 = y0
        self.name = name
        self.text = text
        self.hoverText = hoverText
        self.hoverTemplate = hoverTemplate
        self.whiskerWidth = whiskerWidth
        self.notched = notched
        self.notchWidth = notchWidth
        self.boxPoints = boxPoints
        self.boxMean = boxMean
        self.jitter = jitter
        self.pointPosition = pointPosition
        self.orientation = orientation
        self.width = width
        self.marker = marker
        self.line = line
        self.fillColor = fillColor
        self.offsetGroup = offsetGroup
        self.alignmentGroup = alignmentGroup
        self.selected = selected
        self.unselected = unselected
        self.hoverOn = hoverOn
        self.xCalendar = xCalendar
        self.yCalendar = yCalendar
        self.xAxis = xAxis
        self.yAxis = yAxis
        self.idsSource = idsSource
        self.customDataSource = customDataSource
        self.metaSource = metaSource
        self.hoverInfoSource = hoverInfoSource
        self.ySource = ySource
        self.xSource = xSource
        self.textSource = textSource
        self.hoverTextSource = hoverTextSource
        self.hoverTemplateSource = hoverTemplateSource
    }
}