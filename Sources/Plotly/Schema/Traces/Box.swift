/// In vertical (horizontal) box plots, statistics are computed using `y` (`x`) values.
/// 
/// By supplying an `x` (`y`) array, one box per distinct x (y) value is drawn If no `x` (`y`)
/// {array} is provided, a single box is drawn. That box position is then positioned with with
/// `name` or with `x0` (`y0`) if provided. Each box spans from quartile 1 (Q1) to quartile 3 (Q3).
/// The second quartile (Q2) is marked by a line inside the box. By default, the whiskers correspond
/// to the box' edges +/- 1.5 times the interquartile range (IQR: Q3-Q1), see *boxpoints* for other
/// options.
/// 
/// - SeeAlso:
///   Documentation for 
///   [Python](https://plot.ly/python/reference/#box), 
///   [JavaScript](https://plot.ly/javascript/reference/#box) or 
///   [R](https://plot.ly/r/reference/#box)
public struct Box<YData, XData>: Trace, XYSubplot where YData: Plotable, XData: Plotable {
    public let type: String = "box"

    public let animatable: Bool = false

    /// Determines whether or not this trace is visible.
    /// 
    /// If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the
    /// legend itself is visible).
    public var visible: Shared.Visible? = nil

    /// Determines whether or not an item corresponding to this trace is shown in the legend.
    public var showLegend: Bool? = nil

    /// Sets the legend group for this trace.
    /// 
    /// Traces part of the same legend group hide/show at the same time when toggling legend items.
    public var legendGroup: String? = nil

    /// Sets the opacity of the trace.
    public var opacity: Double? = nil

    /// Sets the trace name.
    /// 
    /// The trace name appear as the legend item and on hover. For box traces, the name will also be
    /// used for the position coordinate, if `x` and `x0` (`y` and `y0` if horizontal) are missing and
    /// the position axis is categorical
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

    /// Array containing integer indices of selected points.
    /// 
    /// Has an effect only for traces that support selections. Note that an empty array means an empty
    /// selection where the `unselected` are turned on for all points, whereas, any other non-array
    /// values means no selection all where the `selected` and `unselected` styles have no effect.
    public var selectedPoints: Anything? = nil

    /// Determines which trace information appear on hover.
    /// 
    /// If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set,
    /// click and hover events are still fired.
    public var hoverInfo: Shared.HoverInfo? = nil

    public var hoverLabel: Shared.HoverLabel? = nil

    public var stream: Shared.Stream? = nil

    public var transforms: [Shared.Transform]? = nil

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

    /// Sets the y sample data or coordinates.
    /// 
    /// See overview for more info.
    public var y: YData? = nil

    /// Sets the x sample data or coordinates.
    /// 
    /// See overview for more info.
    public var x: XData? = nil

    /// Sets the x coordinate of the box.
    /// 
    /// See overview for more info.
    public var x0: Anything? = nil

    /// Sets the y coordinate of the box.
    /// 
    /// See overview for more info.
    public var y0: Anything? = nil

    /// Sets the text elements associated with each sample value.
    /// 
    /// If a single string, the same string appears over all the data points. If an array of string, the
    /// items are mapped in order to the this trace's (x,y) coordinates. To be seen, trace `hoverinfo`
    /// must contain a *text* flag.
    public var text: Data<String>? = nil

    /// Same as `text`.
    public var hoverText: Data<String>? = nil

    /// Template string used for rendering the information that appear on hover box.
    /// 
    /// Note that this will override `hoverinfo`. Variables are inserted using %{variable}, for example
    /// "y: %{y}". Numbers are formatted using d3-format's syntax %{variable:d3-format}, for example
    /// "Price: %{y:$.2f}".
    /// https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format for details on
    /// the formatting syntax. Dates are formatted using d3-time-format's syntax
    /// %{variable|d3-time-format}, for example "Day: %{2019-01-01|%A}".
    /// https://github.com/d3/d3-3.x-api-reference/blob/master/Time-Formatting.md#format for details on
    /// the date formatting syntax. The variables available in `hovertemplate` are the ones emitted as
    /// event data described at this link https://plot.ly/javascript/plotlyjs-events/#event-data.
    /// Additionally, every attributes that can be specified per-point (the ones that are `arrayOk:
    /// true`) are available. Anything contained in tag `<extra>` is displayed in the secondary box, for
    /// example "<extra>{fullData.name}</extra>". To hide the secondary box completely, use an empty tag
    /// `<extra></extra>`.
    public var hoverTemplate: Data<String>? = nil

    /// Sets the width of the whiskers relative to the box' width.
    /// 
    /// For example, with 1, the whiskers are as wide as the box(es).
    public var whiskerWidth: Double? = nil

    /// Determines whether or not notches should be drawn.
    public var notched: Bool? = nil

    /// Sets the width of the notches relative to the box' width.
    /// 
    /// For example, with 0, the notches are as wide as the box(es).
    public var notchWidth: Double? = nil

    /// If *outliers*, only the sample points lying outside the whiskers are shown If
    /// *suspectedoutliers*, the outlier points are shown and points either less than 4*Q1-3*Q3 or
    /// greater than 4*Q3-3*Q1 are highlighted (see `outliercolor`) If *all*, all sample points are
    /// shown If *false*, only the box(es) are shown with no sample points
    public enum BoxPoints: Encodable {
        case all
        case outliers
        case suspectedOutliers
        case off
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .all:
                try container.encode("all")
            case .outliers:
                try container.encode("outliers")
            case .suspectedOutliers:
                try container.encode("suspectedoutliers")
            case .off:
                try container.encode(false)
            }
        }
    }
    /// If *outliers*, only the sample points lying outside the whiskers are shown If
    /// *suspectedoutliers*, the outlier points are shown and points either less than 4*Q1-3*Q3 or
    /// greater than 4*Q3-3*Q1 are highlighted (see `outliercolor`) If *all*, all sample points are
    /// shown If *false*, only the box(es) are shown with no sample points
    public var boxPoints: BoxPoints? = nil

    /// If *true*, the mean of the box(es)' underlying distribution is drawn as a dashed line inside the
    /// box(es).
    /// 
    /// If *sd* the standard deviation is also drawn.
    public enum BoxMean: Encodable {
        case on
        case sd
        case off
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .on:
                try container.encode(true)
            case .sd:
                try container.encode("sd")
            case .off:
                try container.encode(false)
            }
        }
    }
    /// If *true*, the mean of the box(es)' underlying distribution is drawn as a dashed line inside the
    /// box(es).
    /// 
    /// If *sd* the standard deviation is also drawn.
    public var boxMean: BoxMean? = nil

    /// Sets the amount of jitter in the sample points drawn.
    /// 
    /// If *0*, the sample points align along the distribution axis. If *1*, the sample points are drawn
    /// in a random jitter of width equal to the width of the box(es).
    public var jitter: Double? = nil

    /// Sets the position of the sample points in relation to the box(es).
    /// 
    /// If *0*, the sample points are places over the center of the box(es). Positive (negative) values
    /// correspond to positions to the right (left) for vertical boxes and above (below) for horizontal
    /// boxes
    public var pointPosition: Double? = nil

    /// Sets the orientation of the box(es).
    /// 
    /// If *v* (*h*), the distribution is visualized along the vertical (horizontal).
    public var orientation: Shared.Orientation? = nil

    /// Sets the width of the box in data coordinate If *0* (default value) the width is automatically
    /// selected based on the positions of other box traces in the same subplot.
    public var width: Double? = nil

    public struct SymbolicMarker: Encodable {
        /// Sets the color of the outlier sample points.
        public var outlierColor: Color? = nil
    
        /// Sets the marker symbol type.
        /// 
        /// Adding 100 is equivalent to appending *-open* to a symbol name. Adding 200 is equivalent to
        /// appending *-dot* to a symbol name. Adding 300 is equivalent to appending *-open-dot* or
        /// *dot-open* to a symbol name.
        public var symbol: Shared.Symbol? = nil
    
        /// Sets the marker opacity.
        public var opacity: Double? = nil
    
        /// Sets the marker size (in px).
        public var size: Double? = nil
    
        /// Sets themarkercolor.
        /// 
        /// It accepts either a specific color or an array of numbers that are mapped to the colorscale
        /// relative to the max and min values of the array or relative to `marker.cmin` and `marker.cmax`
        /// if set.
        public var color: Color? = nil
    
        public struct Line: Encodable {
            /// Sets themarker.linecolor.
            /// 
            /// It accepts either a specific color or an array of numbers that are mapped to the colorscale
            /// relative to the max and min values of the array or relative to `marker.line.cmin` and
            /// `marker.line.cmax` if set.
            public var color: Color? = nil
        
            /// Sets the width (in px) of the lines bounding the marker points.
            public var width: Double? = nil
        
            /// Sets the border line color of the outlier sample points.
            /// 
            /// Defaults to marker.color
            public var outlierColor: Color? = nil
        
            /// Sets the border line width (in px) of the outlier sample points.
            public var outlierWidth: Double? = nil
        
            /// Decoding and encoding keys compatible with Plotly schema.
            enum CodingKeys: String, CodingKey {
                case color
                case width
                case outlierColor = "outliercolor"
                case outlierWidth = "outlierwidth"
            }
            
            /// Creates `Line` object with specified properties.
            /// 
            /// - Parameters:
            ///   - color: Sets themarker.linecolor.
            ///   - width: Sets the width (in px) of the lines bounding the marker points.
            ///   - outlierColor: Sets the border line color of the outlier sample points.
            ///   - outlierWidth: Sets the border line width (in px) of the outlier sample points.
            public init(color: Color? = nil, width: Double? = nil, outlierColor: Color? = nil, outlierWidth:
                    Double? = nil) {
                self.color = color
                self.width = width
                self.outlierColor = outlierColor
                self.outlierWidth = outlierWidth
            }
            
        }
        public var line: Line? = nil
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case outlierColor = "outliercolor"
            case symbol
            case opacity
            case size
            case color
            case line
        }
        
        /// Creates `SymbolicMarker` object with specified properties.
        /// 
        /// - Parameters:
        ///   - outlierColor: Sets the color of the outlier sample points.
        ///   - symbol: Sets the marker symbol type.
        ///   - opacity: Sets the marker opacity.
        ///   - size: Sets the marker size (in px).
        ///   - color: Sets themarkercolor.
        ///   - line:
        public init(outlierColor: Color? = nil, symbol: Shared.Symbol? = nil, opacity: Double? = nil,
                size: Double? = nil, color: Color? = nil, line: Line? = nil) {
            self.outlierColor = outlierColor
            self.symbol = symbol
            self.opacity = opacity
            self.size = size
            self.color = color
            self.line = line
        }
        
    }
    public var marker: SymbolicMarker? = nil

    public var line: Shared.Line? = nil

    /// Sets the fill color.
    /// 
    /// Defaults to a half-transparent variant of the line color, marker color, or marker line color,
    /// whichever is available.
    public var fillColor: Color? = nil

    /// Set several traces linked to the same position axis or matching axes to the same offsetgroup
    /// where bars of the same position coordinate will line up.
    public var offsetGroup: String? = nil

    /// Set several traces linked to the same position axis or matching axes to the same alignmentgroup.
    /// 
    /// This controls whether bars compute their positional range dependently or independently.
    public var alignmentGroup: String? = nil

    public struct Selected: Encodable {
        public struct Marker: Encodable {
            /// Sets the marker opacity of selected points.
            public var opacity: Double? = nil
        
            /// Sets the marker color of selected points.
            public var color: Color? = nil
        
            /// Sets the marker size of selected points.
            public var size: Double? = nil
        
            /// Creates `Marker` object with specified properties.
            /// 
            /// - Parameters:
            ///   - opacity: Sets the marker opacity of selected points.
            ///   - color: Sets the marker color of selected points.
            ///   - size: Sets the marker size of selected points.
            public init(opacity: Double? = nil, color: Color? = nil, size: Double? = nil) {
                self.opacity = opacity
                self.color = color
                self.size = size
            }
            
        }
        public var marker: Marker? = nil
    
        /// Creates `Selected` object with specified properties.
        public init(marker: Marker? = nil) {
            self.marker = marker
        }
        
    }
    public var selected: Selected? = nil

    public struct Unselected: Encodable {
        public struct Marker: Encodable {
            /// Sets the marker opacity of unselected points, applied only when a selection exists.
            public var opacity: Double? = nil
        
            /// Sets the marker color of unselected points, applied only when a selection exists.
            public var color: Color? = nil
        
            /// Sets the marker size of unselected points, applied only when a selection exists.
            public var size: Double? = nil
        
            /// Creates `Marker` object with specified properties.
            /// 
            /// - Parameters:
            ///   - opacity: Sets the marker opacity of unselected points, applied only when a selection exists.
            ///   - color: Sets the marker color of unselected points, applied only when a selection exists.
            ///   - size: Sets the marker size of unselected points, applied only when a selection exists.
            public init(opacity: Double? = nil, color: Color? = nil, size: Double? = nil) {
                self.opacity = opacity
                self.color = color
                self.size = size
            }
            
        }
        public var marker: Marker? = nil
    
        /// Creates `Unselected` object with specified properties.
        public init(marker: Marker? = nil) {
            self.marker = marker
        }
        
    }
    public var unselected: Unselected? = nil

    /// Do the hover effects highlight individual boxes or sample points or both?
    public struct HoverOn: OptionSet, Encodable {
        public let rawValue: Int
        public static var boxes: HoverOn { HoverOn(rawValue: 1 << 0) }
        public static var points: HoverOn { HoverOn(rawValue: 1 << 1) }
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        public func encode(to encoder: Encoder) throws {
            var options = [String]()
            if (self.rawValue & 1 << 0) != 0 { options += ["boxes"] }
            if (self.rawValue & 1 << 1) != 0 { options += ["points"] }
            var container = encoder.singleValueContainer()
            try container.encode(options.joined(separator: "+"))
        }
    }
    /// Do the hover effects highlight individual boxes or sample points or both?
    public var hoverOn: HoverOn? = nil

    /// Sets the calendar system to use with `x` date data.
    public var xCalendar: Shared.Calendar? = nil

    /// Sets the calendar system to use with `y` date data.
    public var yCalendar: Shared.Calendar? = nil

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
        case showLegend = "showlegend"
        case legendGroup = "legendgroup"
        case opacity
        case name
        case uid
        case ids
        case customData = "customdata"
        case meta
        case selectedPoints = "selectedpoints"
        case hoverInfo = "hoverinfo"
        case hoverLabel = "hoverlabel"
        case stream
        case transforms
        case uiRevision = "uirevision"
        case y
        case x
        case x0
        case y0
        case text
        case hoverText = "hovertext"
        case hoverTemplate = "hovertemplate"
        case whiskerWidth = "whiskerwidth"
        case notched
        case notchWidth = "notchwidth"
        case boxPoints = "boxpoints"
        case boxMean = "boxmean"
        case jitter
        case pointPosition = "pointpos"
        case orientation
        case width
        case marker
        case line
        case fillColor = "fillcolor"
        case offsetGroup = "offsetgroup"
        case alignmentGroup = "alignmentgroup"
        case selected
        case unselected
        case hoverOn = "hoveron"
        case xCalendar = "xcalendar"
        case yCalendar = "ycalendar"
        case xAxis = "xaxis"
        case yAxis = "yaxis"
    }
    
    /// Creates `Box` object from the most frequently used properties.
    /// 
    /// - Parameters:
    ///   - name: Sets the trace name.
    ///   - y: Sets the y sample data or coordinates.
    ///   - x: Sets the x sample data or coordinates.
    ///   - text: Sets the text elements associated with each sample value.
    ///   - hoverText: Same as `text`.
    ///   - marker:
    ///   - line:
    public init(name: String? = nil, y: YData? = nil, x: XData? = nil, text: Data<String>? = nil,
            hoverText: Data<String>? = nil, marker: SymbolicMarker? = nil, line: Shared.Line? = nil) {
        self.name = name
        self.y = y
        self.x = x
        self.text = text
        self.hoverText = hoverText
        self.marker = marker
        self.line = line
    }
    
    /// Creates `Box` object with specified properties.
    /// 
    /// - Parameters:
    ///   - visible: Determines whether or not this trace is visible.
    ///   - showLegend: Determines whether or not an item corresponding to this trace is shown in the
    ///   legend.
    ///   - legendGroup: Sets the legend group for this trace.
    ///   - opacity: Sets the opacity of the trace.
    ///   - name: Sets the trace name.
    ///   - uid: Assign an id to this trace, Use this to provide object constancy between traces during
    ///   animations and transitions.
    ///   - ids: Assigns id labels to each datum.
    ///   - customData: Assigns extra data each datum.
    ///   - meta: Assigns extra meta information associated with this trace that can be used in various
    ///   text attributes.
    ///   - selectedPoints: Array containing integer indices of selected points.
    ///   - hoverInfo: Determines which trace information appear on hover.
    ///   - hoverLabel:
    ///   - stream:
    ///   - transforms:
    ///   - uiRevision: Controls persistence of some user-driven changes to the trace: `constraintrange`
    ///   in `parcoords` traces, as well as some `editable: true` modifications such as `name` and
    ///   `colorbar.title`.
    ///   - y: Sets the y sample data or coordinates.
    ///   - x: Sets the x sample data or coordinates.
    ///   - x0: Sets the x coordinate of the box.
    ///   - y0: Sets the y coordinate of the box.
    ///   - text: Sets the text elements associated with each sample value.
    ///   - hoverText: Same as `text`.
    ///   - hoverTemplate: Template string used for rendering the information that appear on hover box.
    ///   - whiskerWidth: Sets the width of the whiskers relative to the box' width.
    ///   - notched: Determines whether or not notches should be drawn.
    ///   - notchWidth: Sets the width of the notches relative to the box' width.
    ///   - boxPoints: If *outliers*, only the sample points lying outside the whiskers are shown If
    ///   *suspectedoutliers*, the outlier points are shown and points either less than 4*Q1-3*Q3 or
    ///   greater than 4*Q3-3*Q1 are highlighted (see `outliercolor`) If *all*, all sample points are
    ///   shown If *false*, only the box(es) are shown with no sample points
    ///   - boxMean: If *true*, the mean of the box(es)' underlying distribution is drawn as a dashed line
    ///   inside the box(es).
    ///   - jitter: Sets the amount of jitter in the sample points drawn.
    ///   - pointPosition: Sets the position of the sample points in relation to the box(es).
    ///   - orientation: Sets the orientation of the box(es).
    ///   - width: Sets the width of the box in data coordinate If *0* (default value) the width is
    ///   automatically selected based on the positions of other box traces in the same subplot.
    ///   - marker:
    ///   - line:
    ///   - fillColor: Sets the fill color.
    ///   - offsetGroup: Set several traces linked to the same position axis or matching axes to the same
    ///   offsetgroup where bars of the same position coordinate will line up.
    ///   - alignmentGroup: Set several traces linked to the same position axis or matching axes to the
    ///   same alignmentgroup.
    ///   - selected:
    ///   - unselected:
    ///   - hoverOn: Do the hover effects highlight individual boxes or sample points or both?
    ///   - xCalendar: Sets the calendar system to use with `x` date data.
    ///   - yCalendar: Sets the calendar system to use with `y` date data.
    ///   - xAxis: Sets a reference between this trace's x coordinates and a 2D cartesian x axis.
    ///   - yAxis: Sets a reference between this trace's y coordinates and a 2D cartesian y axis.
    public init(visible: Shared.Visible? = nil, showLegend: Bool? = nil, legendGroup: String? = nil,
            opacity: Double? = nil, name: String? = nil, uid: String? = nil, ids: [String]? = nil,
            customData: [String]? = nil, meta: Data<Anything>? = nil, selectedPoints: Anything? = nil,
            hoverInfo: Shared.HoverInfo? = nil, hoverLabel: Shared.HoverLabel? = nil, stream: Shared.Stream?
            = nil, transforms: [Shared.Transform]? = nil, uiRevision: Anything? = nil, y: YData? = nil, x:
            XData? = nil, x0: Anything? = nil, y0: Anything? = nil, text: Data<String>? = nil, hoverText:
            Data<String>? = nil, hoverTemplate: Data<String>? = nil, whiskerWidth: Double? = nil, notched:
            Bool? = nil, notchWidth: Double? = nil, boxPoints: BoxPoints? = nil, boxMean: BoxMean? = nil,
            jitter: Double? = nil, pointPosition: Double? = nil, orientation: Shared.Orientation? = nil,
            width: Double? = nil, marker: SymbolicMarker? = nil, line: Shared.Line? = nil, fillColor: Color?
            = nil, offsetGroup: String? = nil, alignmentGroup: String? = nil, selected: Selected? = nil,
            unselected: Unselected? = nil, hoverOn: HoverOn? = nil, xCalendar: Shared.Calendar? = nil,
            yCalendar: Shared.Calendar? = nil, xAxis: Layout.XAxis = Layout.XAxis(uid: 1), yAxis:
            Layout.YAxis = Layout.YAxis(uid: 1)) {
        self.visible = visible
        self.showLegend = showLegend
        self.legendGroup = legendGroup
        self.opacity = opacity
        self.name = name
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
    }
    
    /// Encodes the object in a format compatible with Plotly.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(visible, forKey: .visible)
        try container.encodeIfPresent(showLegend, forKey: .showLegend)
        try container.encodeIfPresent(legendGroup, forKey: .legendGroup)
        try container.encodeIfPresent(opacity, forKey: .opacity)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(uid, forKey: .uid)
        try container.encodeIfPresent(ids, forKey: .ids)
        try container.encodeIfPresent(customData, forKey: .customData)
        try container.encodeIfPresent(meta, forKey: .meta)
        try container.encodeIfPresent(selectedPoints, forKey: .selectedPoints)
        try container.encodeIfPresent(hoverInfo, forKey: .hoverInfo)
        try container.encodeIfPresent(hoverLabel, forKey: .hoverLabel)
        try container.encodeIfPresent(stream, forKey: .stream)
        try container.encodeIfPresent(transforms, forKey: .transforms)
        try container.encodeIfPresent(uiRevision, forKey: .uiRevision)
        if let y = self.y {
            try y.encode(toPlotly: container.superEncoder(forKey: .y))
        }
        if let x = self.x {
            try x.encode(toPlotly: container.superEncoder(forKey: .x))
        }
        try container.encodeIfPresent(x0, forKey: .x0)
        try container.encodeIfPresent(y0, forKey: .y0)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(hoverText, forKey: .hoverText)
        try container.encodeIfPresent(hoverTemplate, forKey: .hoverTemplate)
        try container.encodeIfPresent(whiskerWidth, forKey: .whiskerWidth)
        try container.encodeIfPresent(notched, forKey: .notched)
        try container.encodeIfPresent(notchWidth, forKey: .notchWidth)
        try container.encodeIfPresent(boxPoints, forKey: .boxPoints)
        try container.encodeIfPresent(boxMean, forKey: .boxMean)
        try container.encodeIfPresent(jitter, forKey: .jitter)
        try container.encodeIfPresent(pointPosition, forKey: .pointPosition)
        try container.encodeIfPresent(orientation, forKey: .orientation)
        try container.encodeIfPresent(width, forKey: .width)
        try container.encodeIfPresent(marker, forKey: .marker)
        try container.encodeIfPresent(line, forKey: .line)
        try container.encodeIfPresent(fillColor, forKey: .fillColor)
        try container.encodeIfPresent(offsetGroup, forKey: .offsetGroup)
        try container.encodeIfPresent(alignmentGroup, forKey: .alignmentGroup)
        try container.encodeIfPresent(selected, forKey: .selected)
        try container.encodeIfPresent(unselected, forKey: .unselected)
        try container.encodeIfPresent(hoverOn, forKey: .hoverOn)
        try container.encodeIfPresent(xCalendar, forKey: .xCalendar)
        try container.encodeIfPresent(yCalendar, forKey: .yCalendar)
        try container.encode("x\(xAxis.uid)", forKey: .xAxis)
        try container.encode("y\(yAxis.uid)", forKey: .yAxis)
    }
}