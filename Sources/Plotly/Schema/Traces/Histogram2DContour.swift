/// The sample data from which statistics are computed is set in `x` and `y` (where `x` and `y`
/// represent marginal distributions, binning is set in `xbins` and `ybins` in this case) or `z`
/// (where `z` represent the 2D distribution and binning set, binning is set by `x` and `y` in this
/// case).
/// 
/// The resulting distribution is visualized as a contour plot.
/// 
/// - SeeAlso:
///   Documentation for 
///   [Python](https://plot.ly/python/reference/#histogram2dcontour), 
///   [JavaScript](https://plot.ly/javascript/reference/#histogram2dcontour) or 
///   [R](https://plot.ly/r/reference/#histogram2dcontour)
public struct Histogram2DContour<XData, YData, ZData>: Trace where XData: Plotable, YData: Plotable, ZData: Plotable {
    public let type: String = "histogram2dcontour"

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

    /// Sets the opacity of the trace.
    public var opacity: Double?

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

    /// Sets the sample data to be binned on the x axis.
    public var x: XData?

    /// Sets the sample data to be binned on the y axis.
    public var y: YData?

    /// Sets the aggregation data.
    public var z: ZData?

    public struct Marker: Encodable {
        /// Sets the aggregation data.
        public var color: [Double]?
    
        /// Creates `Marker` object with specified properties.
        /// 
        /// - Parameters:
        ///   - color: Sets the aggregation data.
        public init(color: [Double]? = nil) {
            self.color = color
        }
        
    }
    public var marker: Marker?

    /// Specifies the type of normalization used for this histogram trace.
    /// 
    /// If **, the span of each bar corresponds to the number of occurrences (i.e. the number of data
    /// points lying inside the bins). If *percent* / *probability*, the span of each bar corresponds to
    /// the percentage / fraction of occurrences with respect to the total number of sample points
    /// (here, the sum of all bin HEIGHTS equals 100% / 1). If *density*, the span of each bar
    /// corresponds to the number of occurrences in a bin divided by the size of the bin interval (here,
    /// the sum of all bin AREAS equals the total number of sample points). If *probability density*,
    /// the area of each bar corresponds to the probability that an event will fall into the
    /// corresponding bin (here, the sum of all bin AREAS equals 1).
    public var normalization: Shared.Normalization?

    /// Specifies the binning function used for this histogram trace.
    /// 
    /// If *count*, the histogram values are computed by counting the number of values lying inside each
    /// bin. If *sum*, *avg*, *min*, *max*, the histogram values are computed using the sum, the
    /// average, the minimum or the maximum of the values lying inside each bin respectively.
    public var binningFunction: Shared.BinningFunction?

    /// Specifies the maximum number of desired bins.
    /// 
    /// This value will be used in an algorithm that will decide the optimal bin size such that the
    /// histogram best visualizes the distribution of the data. Ignored if `xbins.size` is provided.
    public var xNumBins: Int?

    public var xBins: Shared.Bins?

    /// Specifies the maximum number of desired bins.
    /// 
    /// This value will be used in an algorithm that will decide the optimal bin size such that the
    /// histogram best visualizes the distribution of the data. Ignored if `ybins.size` is provided.
    public var yNumBins: Int?

    public var yBins: Shared.Bins?

    /// Obsolete: since v1.42 each bin attribute is auto-determined separately and `autobinx` is not
    /// needed.
    /// 
    /// However, we accept `autobinx: true` or `false` and will update `xbins` accordingly before
    /// deleting `autobinx` from the trace.
    public var xAutoBin: Bool?

    /// Obsolete: since v1.42 each bin attribute is auto-determined separately and `autobiny` is not
    /// needed.
    /// 
    /// However, we accept `autobiny: true` or `false` and will update `ybins` accordingly before
    /// deleting `autobiny` from the trace.
    public var yAutoBin: Bool?

    /// Set the `xbingroup` and `ybingroup` default prefix For example, setting a `bingroup` of *1* on
    /// two histogram2d traces will make them their x-bins and y-bins match separately.
    public var binGroup: String?

    /// Set a group of histogram traces which will have compatible x-bin settings.
    /// 
    /// Using `xbingroup`, histogram2d and histogram2dcontour traces (on axes of the same axis type) can
    /// have compatible x-bin settings. Note that the same `xbingroup` value can be used to set (1D)
    /// histogram `bingroup`
    public var xBinGroup: String?

    /// Set a group of histogram traces which will have compatible y-bin settings.
    /// 
    /// Using `ybingroup`, histogram2d and histogram2dcontour traces (on axes of the same axis type) can
    /// have compatible y-bin settings. Note that the same `ybingroup` value can be used to set (1D)
    /// histogram `bingroup`
    public var yBinGroup: String?

    /// Determines whether or not the contour level attributes are picked by an algorithm.
    /// 
    /// If *true*, the number of contour levels can be set in `ncontours`. If *false*, set the contour
    /// level attributes in `contours`.
    public var autoContour: Bool?

    /// Sets the maximum number of contour levels.
    /// 
    /// The actual number of contours will be chosen automatically to be less than or equal to the value
    /// of `ncontours`. Has an effect only if `autocontour` is *true* or if `contours.size` is missing.
    public var nContours: Int?

    public var contours: Shared.Contours?

    public var line: Shared.SmoothedDashedLine?

    /// Sets the hover text formatting rule using d3 formatting mini-languages which are very similar to
    /// those in Python.
    /// 
    /// See: https://github.com/d3/d3-3.x-api-reference/blob/master/Formatting.md#d3_format
    public var zHoverFormat: String?

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
    /// true`) are available. variable `z` Anything contained in tag `<extra>` is displayed in the
    /// secondary box, for example "<extra>{fullData.name}</extra>". To hide the secondary box
    /// completely, use an empty tag `<extra></extra>`.
    public var hoverTemplate: Data<String>?

    /// Determines whether or not the color domain is computed with respect to the input data (here in
    /// `z`) or the bounds set in `zmin` and `zmax` Defaults to `false` when `zmin` and `zmax` are set
    /// by the user.
    public var zAuto: Bool?

    /// Sets the lower bound of the color domain.
    /// 
    /// Value should have the same units as in `z` and if set, `zmax` must be set as well.
    public var zMin: Double?

    /// Sets the upper bound of the color domain.
    /// 
    /// Value should have the same units as in `z` and if set, `zmin` must be set as well.
    public var zMax: Double?

    /// Sets the mid-point of the color domain by scaling `zmin` and/or `zmax` to be equidistant to this
    /// point.
    /// 
    /// Value should have the same units as in `z`. Has no effect when `zauto` is `false`.
    public var zMiddle: Double?

    /// Sets the colorscale.
    /// 
    /// The colorscale must be an array containing arrays mapping a normalized value to an rgb, rgba,
    /// hex, hsl, hsv, or named color string. At minimum, a mapping for the lowest (0) and highest (1)
    /// values are required. For example, `[[0, 'rgb(0,0,255)'], [1, 'rgb(255,0,0)']]`. To control the
    /// bounds of the colorscale in color space, use`zmin` and `zmax`. Alternatively, `colorscale` may
    /// be a palette name string of the following list:
    /// Greys,YlGnBu,Greens,YlOrRd,Bluered,RdBu,Reds,Blues,Picnic,Rainbow,Portland,Jet,Hot,Blackbody,Earth,Electric,Viridis,Cividis.
    public var colorScale: ColorScale?

    /// Determines whether the colorscale is a default palette (`autocolorscale: true`) or the palette
    /// determined by `colorscale`.
    /// 
    /// In case `colorscale` is unspecified or `autocolorscale` is true, the default palette will be
    /// chosen according to whether numbers in the `color` array are all positive, all negative or
    /// mixed.
    public var autoColorScale: Bool?

    /// Reverses the color mapping if true.
    /// 
    /// If true, `zmin` will correspond to the last color in the array and `zmax` will correspond to the
    /// first color.
    public var reverseScale: Bool?

    /// Determines whether or not a colorbar is displayed for this trace.
    public var showScale: Bool?

    public var colorBar: Shared.ColorBar?

    /// Sets a reference to a shared color axis.
    /// 
    /// References to these shared color axes are *coloraxis*, *coloraxis2*, *coloraxis3*, etc. Settings
    /// for these shared color axes are set in the layout, under `layout.coloraxis`,
    /// `layout.coloraxis2`, etc. Note that multiple color scales can be linked to the same color axis.
    public var colorAxis: SubPlotID?

    /// Sets the calendar system to use with `x` date data.
    public var xCalendar: Shared.Calendar?

    /// Sets the calendar system to use with `y` date data.
    public var yCalendar: Shared.Calendar?

    /// Sets a reference between this trace's x coordinates and a 2D cartesian x axis.
    /// 
    /// If *x* (the default value), the x coordinates refer to `layout.xaxis`. If *x2*, the x
    /// coordinates refer to `layout.xaxis2`, and so on.
    public var xAxis: SubPlotID?

    /// Sets a reference between this trace's y coordinates and a 2D cartesian y axis.
    /// 
    /// If *y* (the default value), the y coordinates refer to `layout.yaxis`. If *y2*, the y
    /// coordinates refer to `layout.yaxis2`, and so on.
    public var yAxis: SubPlotID?

    /// Decoding and encoding keys compatible with Plotly schema.
    enum CodingKeys: String, CodingKey {
        case type
        case animatable
        case visible
        case showLegend = "showlegend"
        case legendGroup = "legendgroup"
        case opacity
        case name
        case uid
        case ids
        case customData = "customdata"
        case meta
        case hoverInfo = "hoverinfo"
        case hoverLabel = "hoverlabel"
        case stream
        case transforms
        case uiRevision = "uirevision"
        case x
        case y
        case z
        case marker
        case normalization = "histnorm"
        case binningFunction = "histfunc"
        case xNumBins = "nbinsx"
        case xBins = "xbins"
        case yNumBins = "nbinsy"
        case yBins = "ybins"
        case xAutoBin = "autobinx"
        case yAutoBin = "autobiny"
        case binGroup = "bingroup"
        case xBinGroup = "xbingroup"
        case yBinGroup = "ybingroup"
        case autoContour = "autocontour"
        case nContours = "ncontours"
        case contours
        case line
        case zHoverFormat = "zhoverformat"
        case hoverTemplate = "hovertemplate"
        case zAuto = "zauto"
        case zMin = "zmin"
        case zMax = "zmax"
        case zMiddle = "zmid"
        case colorScale = "colorscale"
        case autoColorScale = "autocolorscale"
        case reverseScale = "reversescale"
        case showScale = "showscale"
        case colorBar = "colorbar"
        case colorAxis = "coloraxis"
        case xCalendar = "xcalendar"
        case yCalendar = "ycalendar"
        case xAxis = "xaxis"
        case yAxis = "yaxis"
    }
    
    /// Creates `Histogram2DContour` object from the most frequently used properties.
    /// 
    /// - Parameters:
    ///   - name: Sets the trace name.
    ///   - x: Sets the sample data to be binned on the x axis.
    ///   - y: Sets the sample data to be binned on the y axis.
    ///   - z: Sets the aggregation data.
    ///   - marker:
    ///   - line:
    ///   - colorScale: Sets the colorscale.
    ///   - reverseScale: Reverses the color mapping if true.
    public init(name: String? = nil, x: XData? = nil, y: YData? = nil, z: ZData? = nil, marker:
            Marker? = nil, line: Shared.SmoothedDashedLine? = nil, colorScale: ColorScale? = nil,
            reverseScale: Bool? = nil) {
        self.name = name
        self.x = x
        self.y = y
        self.z = z
        self.marker = marker
        self.line = line
        self.colorScale = colorScale
        self.reverseScale = reverseScale
    }
    
    /// Creates `Histogram2DContour` object with specified properties.
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
    ///   - hoverInfo: Determines which trace information appear on hover.
    ///   - hoverLabel:
    ///   - stream:
    ///   - transforms:
    ///   - uiRevision: Controls persistence of some user-driven changes to the trace: `constraintrange`
    ///   in `parcoords` traces, as well as some `editable: true` modifications such as `name` and
    ///   `colorbar.title`.
    ///   - x: Sets the sample data to be binned on the x axis.
    ///   - y: Sets the sample data to be binned on the y axis.
    ///   - z: Sets the aggregation data.
    ///   - marker:
    ///   - normalization: Specifies the type of normalization used for this histogram trace.
    ///   - binningFunction: Specifies the binning function used for this histogram trace.
    ///   - xNumBins: Specifies the maximum number of desired bins.
    ///   - xBins:
    ///   - yNumBins: Specifies the maximum number of desired bins.
    ///   - yBins:
    ///   - xAutoBin: Obsolete: since v1.42 each bin attribute is auto-determined separately and
    ///   `autobinx` is not needed.
    ///   - yAutoBin: Obsolete: since v1.42 each bin attribute is auto-determined separately and
    ///   `autobiny` is not needed.
    ///   - binGroup: Set the `xbingroup` and `ybingroup` default prefix For example, setting a `bingroup`
    ///   of *1* on two histogram2d traces will make them their x-bins and y-bins match separately.
    ///   - xBinGroup: Set a group of histogram traces which will have compatible x-bin settings.
    ///   - yBinGroup: Set a group of histogram traces which will have compatible y-bin settings.
    ///   - autoContour: Determines whether or not the contour level attributes are picked by an
    ///   algorithm.
    ///   - nContours: Sets the maximum number of contour levels.
    ///   - contours:
    ///   - line:
    ///   - zHoverFormat: Sets the hover text formatting rule using d3 formatting mini-languages which are
    ///   very similar to those in Python.
    ///   - hoverTemplate: Template string used for rendering the information that appear on hover box.
    ///   - zAuto: Determines whether or not the color domain is computed with respect to the input data
    ///   (here in `z`) or the bounds set in `zmin` and `zmax` Defaults to `false` when `zmin` and `zmax`
    ///   are set by the user.
    ///   - zMin: Sets the lower bound of the color domain.
    ///   - zMax: Sets the upper bound of the color domain.
    ///   - zMiddle: Sets the mid-point of the color domain by scaling `zmin` and/or `zmax` to be
    ///   equidistant to this point.
    ///   - colorScale: Sets the colorscale.
    ///   - autoColorScale: Determines whether the colorscale is a default palette (`autocolorscale:
    ///   true`) or the palette determined by `colorscale`.
    ///   - reverseScale: Reverses the color mapping if true.
    ///   - showScale: Determines whether or not a colorbar is displayed for this trace.
    ///   - colorBar:
    ///   - colorAxis: Sets a reference to a shared color axis.
    ///   - xCalendar: Sets the calendar system to use with `x` date data.
    ///   - yCalendar: Sets the calendar system to use with `y` date data.
    ///   - xAxis: Sets a reference between this trace's x coordinates and a 2D cartesian x axis.
    ///   - yAxis: Sets a reference between this trace's y coordinates and a 2D cartesian y axis.
    public init(visible: Shared.Visible? = nil, showLegend: Bool? = nil, legendGroup: String? = nil,
            opacity: Double? = nil, name: String? = nil, uid: String? = nil, ids: [String]? = nil,
            customData: [String]? = nil, meta: Data<Anything>? = nil, hoverInfo: Shared.HoverInfo? = nil,
            hoverLabel: Shared.HoverLabel? = nil, stream: Shared.Stream? = nil, transforms:
            [Shared.Transform]? = nil, uiRevision: Anything? = nil, x: XData? = nil, y: YData? = nil, z:
            ZData? = nil, marker: Marker? = nil, normalization: Shared.Normalization? = nil,
            binningFunction: Shared.BinningFunction? = nil, xNumBins: Int? = nil, xBins: Shared.Bins? = nil,
            yNumBins: Int? = nil, yBins: Shared.Bins? = nil, xAutoBin: Bool? = nil, yAutoBin: Bool? = nil,
            binGroup: String? = nil, xBinGroup: String? = nil, yBinGroup: String? = nil, autoContour: Bool?
            = nil, nContours: Int? = nil, contours: Shared.Contours? = nil, line: Shared.SmoothedDashedLine?
            = nil, zHoverFormat: String? = nil, hoverTemplate: Data<String>? = nil, zAuto: Bool? = nil,
            zMin: Double? = nil, zMax: Double? = nil, zMiddle: Double? = nil, colorScale: ColorScale? = nil,
            autoColorScale: Bool? = nil, reverseScale: Bool? = nil, showScale: Bool? = nil, colorBar:
            Shared.ColorBar? = nil, colorAxis: SubPlotID? = nil, xCalendar: Shared.Calendar? = nil,
            yCalendar: Shared.Calendar? = nil, xAxis: SubPlotID? = nil, yAxis: SubPlotID? = nil) {
        self.visible = visible
        self.showLegend = showLegend
        self.legendGroup = legendGroup
        self.opacity = opacity
        self.name = name
        self.uid = uid
        self.ids = ids
        self.customData = customData
        self.meta = meta
        self.hoverInfo = hoverInfo
        self.hoverLabel = hoverLabel
        self.stream = stream
        self.transforms = transforms
        self.uiRevision = uiRevision
        self.x = x
        self.y = y
        self.z = z
        self.marker = marker
        self.normalization = normalization
        self.binningFunction = binningFunction
        self.xNumBins = xNumBins
        self.xBins = xBins
        self.yNumBins = yNumBins
        self.yBins = yBins
        self.xAutoBin = xAutoBin
        self.yAutoBin = yAutoBin
        self.binGroup = binGroup
        self.xBinGroup = xBinGroup
        self.yBinGroup = yBinGroup
        self.autoContour = autoContour
        self.nContours = nContours
        self.contours = contours
        self.line = line
        self.zHoverFormat = zHoverFormat
        self.hoverTemplate = hoverTemplate
        self.zAuto = zAuto
        self.zMin = zMin
        self.zMax = zMax
        self.zMiddle = zMiddle
        self.colorScale = colorScale
        self.autoColorScale = autoColorScale
        self.reverseScale = reverseScale
        self.showScale = showScale
        self.colorBar = colorBar
        self.colorAxis = colorAxis
        self.xCalendar = xCalendar
        self.yCalendar = yCalendar
        self.xAxis = xAxis
        self.yAxis = yAxis
    }
    
    /// Encodes the object in a format compatible with Plotly.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(animatable, forKey: .animatable)
        try container.encodeIfPresent(visible, forKey: .visible)
        try container.encodeIfPresent(showLegend, forKey: .showLegend)
        try container.encodeIfPresent(legendGroup, forKey: .legendGroup)
        try container.encodeIfPresent(opacity, forKey: .opacity)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(uid, forKey: .uid)
        try container.encodeIfPresent(ids, forKey: .ids)
        try container.encodeIfPresent(customData, forKey: .customData)
        try container.encodeIfPresent(meta, forKey: .meta)
        try container.encodeIfPresent(hoverInfo, forKey: .hoverInfo)
        try container.encodeIfPresent(hoverLabel, forKey: .hoverLabel)
        try container.encodeIfPresent(stream, forKey: .stream)
        try container.encodeIfPresent(transforms, forKey: .transforms)
        try container.encodeIfPresent(uiRevision, forKey: .uiRevision)
        try container.encodeIfPresent(marker, forKey: .marker)
        try container.encodeIfPresent(normalization, forKey: .normalization)
        try container.encodeIfPresent(binningFunction, forKey: .binningFunction)
        try container.encodeIfPresent(xNumBins, forKey: .xNumBins)
        try container.encodeIfPresent(xBins, forKey: .xBins)
        try container.encodeIfPresent(yNumBins, forKey: .yNumBins)
        try container.encodeIfPresent(yBins, forKey: .yBins)
        try container.encodeIfPresent(xAutoBin, forKey: .xAutoBin)
        try container.encodeIfPresent(yAutoBin, forKey: .yAutoBin)
        try container.encodeIfPresent(binGroup, forKey: .binGroup)
        try container.encodeIfPresent(xBinGroup, forKey: .xBinGroup)
        try container.encodeIfPresent(yBinGroup, forKey: .yBinGroup)
        try container.encodeIfPresent(autoContour, forKey: .autoContour)
        try container.encodeIfPresent(nContours, forKey: .nContours)
        try container.encodeIfPresent(contours, forKey: .contours)
        try container.encodeIfPresent(line, forKey: .line)
        try container.encodeIfPresent(zHoverFormat, forKey: .zHoverFormat)
        try container.encodeIfPresent(hoverTemplate, forKey: .hoverTemplate)
        try container.encodeIfPresent(zAuto, forKey: .zAuto)
        try container.encodeIfPresent(zMin, forKey: .zMin)
        try container.encodeIfPresent(zMax, forKey: .zMax)
        try container.encodeIfPresent(zMiddle, forKey: .zMiddle)
        try container.encodeIfPresent(colorScale, forKey: .colorScale)
        try container.encodeIfPresent(autoColorScale, forKey: .autoColorScale)
        try container.encodeIfPresent(reverseScale, forKey: .reverseScale)
        try container.encodeIfPresent(showScale, forKey: .showScale)
        try container.encodeIfPresent(colorBar, forKey: .colorBar)
        try container.encodeIfPresent(colorAxis, forKey: .colorAxis)
        try container.encodeIfPresent(xCalendar, forKey: .xCalendar)
        try container.encodeIfPresent(yCalendar, forKey: .yCalendar)
        try container.encodeIfPresent(xAxis, forKey: .xAxis)
        try container.encodeIfPresent(yAxis, forKey: .yAxis)
    
        if let x = self.x {
            let xEncoder = container.superEncoder(forKey: .x)
            try x.encode(toPlotly: xEncoder)
        }
    
        if let y = self.y {
            let yEncoder = container.superEncoder(forKey: .y)
            try y.encode(toPlotly: yEncoder)
        }
    
        if let z = self.z {
            let zEncoder = container.superEncoder(forKey: .z)
            try z.encode(toPlotly: zEncoder)
        }
    }
    
}