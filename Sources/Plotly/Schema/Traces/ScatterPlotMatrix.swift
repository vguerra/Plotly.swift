/// Splom traces generate scatter plot matrix visualizations.
/// 
/// Each splom `dimensions` items correspond to a generated axis. Values for each of those
/// dimensions are set in `dimensions[i].values`. Splom traces support all `scattergl` marker style
/// attributes. Specify `layout.grid` attributes and/or layout x-axis and y-axis attributes for more
/// control over the axis positioning and style.
/// 
/// - SeeAlso:
///   Documentation for 
///   [Python](https://plot.ly/python/reference/#splom), 
///   [JavaScript](https://plot.ly/javascript/reference/#splom) or 
///   [R](https://plot.ly/r/reference/#splom)
public struct ScatterPlotMatrix: Trace {
    public let type: String = "splom"

    public let animatable: Bool = false

    /// Determines whether or not this trace is visible.
    /// 
    /// If *legendonly*, the trace is not drawn, but can appear as a legend item (provided that the
    /// legend itself is visible).
    public var visible: Shared.Visible?

    /// Determines whether or not an item corresponding to this trace is shown in the legend.
    public var showLegend: Bool?

    /// Sets the legend group for this trace.
    /// 
    /// Traces part of the same legend group hide/show at the same time when toggling legend items.
    public var legendGroup: String?

    /// Sets the trace name.
    /// 
    /// The trace name appear as the legend item and on hover.
    public var name: String?

    /// Assign an id to this trace, Use this to provide object constancy between traces during
    /// animations and transitions.
    public var uid: String?

    /// Assigns id labels to each datum.
    /// 
    /// These ids for object constancy of data points during animation. Should be an array of strings,
    /// not numbers or any other type.
    public var ids: [String]?

    /// Assigns extra data each datum.
    /// 
    /// This may be useful when listening to hover, click and selection events. Note that, *scatter*
    /// traces also appends customdata items in the markers DOM elements
    public var customData: [String]?

    /// Assigns extra meta information associated with this trace that can be used in various text
    /// attributes.
    /// 
    /// Attributes such as trace `name`, graph, axis and colorbar `title.text`, annotation `text`
    /// `rangeselector`, `updatemenues` and `sliders` `label` text all support `meta`. To access the
    /// trace `meta` values in an attribute in the same trace, simply use `%{meta[i]}` where `i` is the
    /// index or key of the `meta` item in question. To access trace `meta` in layout attributes, use
    /// `%{data[n[.meta[i]}` where `i` is the index or key of the `meta` and `n` is the trace index.
    public var meta: Data<Anything>?

    /// Array containing integer indices of selected points.
    /// 
    /// Has an effect only for traces that support selections. Note that an empty array means an empty
    /// selection where the `unselected` are turned on for all points, whereas, any other non-array
    /// values means no selection all where the `selected` and `unselected` styles have no effect.
    public var selectedPoints: Anything?

    /// Determines which trace information appear on hover.
    /// 
    /// If `none` or `skip` are set, no information is displayed upon hovering. But, if `none` is set,
    /// click and hover events are still fired.
    public var hoverInfo: Shared.HoverInfo?

    public var hoverLabel: Shared.HoverLabel?

    public var stream: Shared.Stream?

    public var transforms: [Shared.Transform]?

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
    public var uiRevision: Anything?

    public struct Dimension: Encodable {
        /// Determines whether or not this dimension is shown on the graph.
        /// 
        /// Note that even visible false dimension contribute to the default grid generate by this splom
        /// trace.
        public var visible: Bool?
    
        /// Sets the label corresponding to this splom dimension.
        public var label: String?
    
        /// Sets the dimension values to be plotted.
        public var values: [Double]?
    
        public struct Axis: Encodable {
            /// Sets the axis type for this dimension's generated x and y axes.
            /// 
            /// Note that the axis `type` values set in layout take precedence over this attribute.
            public enum `Type`: String, Encodable {
                case linear
                case log
                case date
                case category
            }
            /// Sets the axis type for this dimension's generated x and y axes.
            /// 
            /// Note that the axis `type` values set in layout take precedence over this attribute.
            public var type: `Type`?
        
            /// Determines whether or not the x & y axes generated by this dimension match.
            /// 
            /// Equivalent to setting the `matches` axis attribute in the layout with the correct axis id.
            public var matches: Bool?
        
            /// Creates `Axis` object with specified properties.
            /// 
            /// - Parameters:
            ///   - type: Sets the axis type for this dimension's generated x and y axes.
            ///   - matches: Determines whether or not the x & y axes generated by this dimension match.
            public init(type: `Type`? = nil, matches: Bool? = nil) {
                self.type = type
                self.matches = matches
            }
            
        }
        public var axis: Axis?
    
        /// When used in a template, named items are created in the output figure in addition to any items
        /// the figure already has in this array.
        /// 
        /// You can modify these items in the output figure by making your own item with `templateitemname`
        /// matching this `name` alongside your modifications (including `visible: false` or `enabled:
        /// false` to hide it). Has no effect outside of a template.
        public var name: String?
    
        /// Used to refer to a named item in this array in the template.
        /// 
        /// Named items from the template will be created even without a matching item in the input figure,
        /// but you can modify one by making an item with `templateitemname` matching its `name`, alongside
        /// your modifications (including `visible: false` or `enabled: false` to hide it). If there is no
        /// template or no matching item, this item will be hidden unless you explicitly show it with
        /// `visible: true`.
        public var templateItemName: String?
    
        /// Decoding and encoding keys compatible with Plotly schema.
        enum CodingKeys: String, CodingKey {
            case visible
            case label
            case values
            case axis
            case name
            case templateItemName = "templateitemname"
        }
        
        /// Creates `Dimension` object with specified properties.
        /// 
        /// - Parameters:
        ///   - visible: Determines whether or not this dimension is shown on the graph.
        ///   - label: Sets the label corresponding to this splom dimension.
        ///   - values: Sets the dimension values to be plotted.
        ///   - axis:
        ///   - name: When used in a template, named items are created in the output figure in addition to any
        ///   items the figure already has in this array.
        ///   - templateItemName: Used to refer to a named item in this array in the template.
        public init(visible: Bool? = nil, label: String? = nil, values: [Double]? = nil, axis: Axis? =
                nil, name: String? = nil, templateItemName: String? = nil) {
            self.visible = visible
            self.label = label
            self.values = values
            self.axis = axis
            self.name = name
            self.templateItemName = templateItemName
        }
        
    }
    public var dimensions: [Dimension]?

    /// Sets text elements associated with each (x,y) pair to appear on hover.
    /// 
    /// If a single string, the same string appears over all the data points. If an array of string, the
    /// items are mapped in order to the this trace's (x,y) coordinates.
    public var text: Data<String>?

    /// Same as `text`.
    public var hoverText: Data<String>?

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
    public var hoverTemplate: Data<String>?

    public var marker: Shared.SymbolicMarker?

    /// Sets the list of x axes corresponding to dimensions of this splom trace.
    /// 
    /// By default, a splom will match the first N xaxes where N is the number of input dimensions. Note
    /// that, in case where `diagonal.visible` is false and `showupperhalf` or `showlowerhalf` is false,
    /// this splom trace will generate one less x-axis and one less y-axis.
    public var xAxes: InfoArray?

    /// Sets the list of y axes corresponding to dimensions of this splom trace.
    /// 
    /// By default, a splom will match the first N yaxes where N is the number of input dimensions. Note
    /// that, in case where `diagonal.visible` is false and `showupperhalf` or `showlowerhalf` is false,
    /// this splom trace will generate one less x-axis and one less y-axis.
    public var yAxes: InfoArray?

    public struct Diagonal: Encodable {
        /// Determines whether or not subplots on the diagonal are displayed.
        public var visible: Bool?
    
        /// Creates `Diagonal` object with specified properties.
        /// 
        /// - Parameters:
        ///   - visible: Determines whether or not subplots on the diagonal are displayed.
        public init(visible: Bool? = nil) {
            self.visible = visible
        }
        
    }
    public var diagonal: Diagonal?

    /// Determines whether or not subplots on the upper half from the diagonal are displayed.
    public var showUpperHalf: Bool?

    /// Determines whether or not subplots on the lower half from the diagonal are displayed.
    public var showLowerHalf: Bool?

    public struct Selected: Encodable {
        public struct Marker: Encodable {
            /// Sets the marker opacity of selected points.
            public var opacity: Double?
        
            /// Sets the marker color of selected points.
            public var color: Color?
        
            /// Sets the marker size of selected points.
            public var size: Double?
        
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
        public var marker: Marker?
    
        /// Creates `Selected` object with specified properties.
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
        public var marker: Marker?
    
        /// Creates `Unselected` object with specified properties.
        public init(marker: Marker? = nil) {
            self.marker = marker
        }
        
    }
    public var unselected: Unselected?

    /// Sets the opacity of the trace.
    public var opacity: Double?

    /// Decoding and encoding keys compatible with Plotly schema.
    enum CodingKeys: String, CodingKey {
        case type
        case animatable
        case visible
        case showLegend = "showlegend"
        case legendGroup = "legendgroup"
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
        case dimensions
        case text
        case hoverText = "hovertext"
        case hoverTemplate = "hovertemplate"
        case marker
        case xAxes = "xaxes"
        case yAxes = "yaxes"
        case diagonal
        case showUpperHalf = "showupperhalf"
        case showLowerHalf = "showlowerhalf"
        case selected
        case unselected
        case opacity
    }
    
    /// Creates `ScatterPlotMatrix` object from the most frequently used properties.
    /// 
    /// - Parameters:
    ///   - name: Sets the trace name.
    ///   - text: Sets text elements associated with each (x,y) pair to appear on hover.
    ///   - hoverText: Same as `text`.
    ///   - marker:
    public init(name: String? = nil, text: Data<String>? = nil, hoverText: Data<String>? = nil,
            marker: Shared.SymbolicMarker? = nil) {
        self.name = name
        self.text = text
        self.hoverText = hoverText
        self.marker = marker
    }
    
    /// Creates `ScatterPlotMatrix` object with specified properties.
    /// 
    /// - Parameters:
    ///   - visible: Determines whether or not this trace is visible.
    ///   - showLegend: Determines whether or not an item corresponding to this trace is shown in the
    ///   legend.
    ///   - legendGroup: Sets the legend group for this trace.
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
    ///   - dimensions:
    ///   - text: Sets text elements associated with each (x,y) pair to appear on hover.
    ///   - hoverText: Same as `text`.
    ///   - hoverTemplate: Template string used for rendering the information that appear on hover box.
    ///   - marker:
    ///   - xAxes: Sets the list of x axes corresponding to dimensions of this splom trace.
    ///   - yAxes: Sets the list of y axes corresponding to dimensions of this splom trace.
    ///   - diagonal:
    ///   - showUpperHalf: Determines whether or not subplots on the upper half from the diagonal are
    ///   displayed.
    ///   - showLowerHalf: Determines whether or not subplots on the lower half from the diagonal are
    ///   displayed.
    ///   - selected:
    ///   - unselected:
    ///   - opacity: Sets the opacity of the trace.
    public init(visible: Shared.Visible? = nil, showLegend: Bool? = nil, legendGroup: String? = nil,
            name: String? = nil, uid: String? = nil, ids: [String]? = nil, customData: [String]? = nil,
            meta: Data<Anything>? = nil, selectedPoints: Anything? = nil, hoverInfo: Shared.HoverInfo? =
            nil, hoverLabel: Shared.HoverLabel? = nil, stream: Shared.Stream? = nil, transforms:
            [Shared.Transform]? = nil, uiRevision: Anything? = nil, dimensions: [Dimension]? = nil, text:
            Data<String>? = nil, hoverText: Data<String>? = nil, hoverTemplate: Data<String>? = nil, marker:
            Shared.SymbolicMarker? = nil, xAxes: InfoArray? = nil, yAxes: InfoArray? = nil, diagonal:
            Diagonal? = nil, showUpperHalf: Bool? = nil, showLowerHalf: Bool? = nil, selected: Selected? =
            nil, unselected: Unselected? = nil, opacity: Double? = nil) {
        self.visible = visible
        self.showLegend = showLegend
        self.legendGroup = legendGroup
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
        self.dimensions = dimensions
        self.text = text
        self.hoverText = hoverText
        self.hoverTemplate = hoverTemplate
        self.marker = marker
        self.xAxes = xAxes
        self.yAxes = yAxes
        self.diagonal = diagonal
        self.showUpperHalf = showUpperHalf
        self.showLowerHalf = showLowerHalf
        self.selected = selected
        self.unselected = unselected
        self.opacity = opacity
    }
    
}