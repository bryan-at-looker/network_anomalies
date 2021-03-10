- dashboard: security_analytics__anomaly_detection
  title: Security Analytics & Anomaly Detection
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 15 seconds
  elements:
  - title: Anomalies
    name: Anomalies
    model: anomaly_detection
    explore: outlier_data
    type: single_value
    fields: [outlier_data.anomaly_count, outlier_data.transaction_time_hour]
    filters:
      outlier_data.transaction_time_date: 3 days
      outlier_data.transaction_time_hour: 1 days
    sorts: [outlier_data.transaction_time_hour desc]
    limit: 500
    dynamic_fields: [{table_calculation: hour_over_hour_change, label: Hour over hour
          change, expression: "(${outlier_data.anomaly_count} - offset(${outlier_data.anomaly_count},1))/offset(${outlier_data.anomaly_count},1)",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: vs Last Hour
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 8
    col: 0
    width: 6
    height: 2
  - title: Bytes Received Box Plot
    name: Bytes Received Box Plot
    model: anomaly_detection
    explore: netflow_log_raw_data
    type: looker_boxplot
    fields: [netflow_log_raw_data.geo_country, netflow_log_raw_data.p20_bytes_received,
      netflow_log_raw_data.p30_bytes_received, netflow_log_raw_data.median_bytes_received,
      netflow_log_raw_data.p70_bytes_received, netflow_log_raw_data.p80_bytes_received,
      netflow_log_raw_data.count]
    filters:
      netflow_log_raw_data.partition_date: 7 days
      netflow_log_raw_data.start_time_minute: 360 minutes
      netflow_log_raw_data.geo_country: "-NULL,-United States"
      netflow_log_raw_data.count: ">500"
    sorts: [netflow_log_raw_data.p80_bytes_received desc]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    color_application:
      collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5
      palette_id: 0c5264fb-0681-4817-b9a5-d3c81002ce4c
      options:
        steps: 5
        reverse: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [netflow_log_raw_data.count]
    title_hidden: true
    listen:
      Is Risky Country (Yes / No): netflow_log_raw_data.is_risky_country
      Protocol Type: netflow_log_raw_data.protocol_name
    row: 10
    col: 13
    width: 11
    height: 6
  - title: Total Volume
    name: Total Volume
    model: anomaly_detection
    explore: netflow_log_raw_data
    type: single_value
    fields: [netflow_log_raw_data.count, netflow_log_raw_data.start_time_hour]
    fill_fields: [netflow_log_raw_data.start_time_hour]
    filters:
      netflow_log_raw_data.partition_date: 7 days
      netflow_log_raw_data.start_time_minute: 5 hours ago for 5 hours
    sorts: [netflow_log_raw_data.start_time_hour desc]
    limit: 75
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "(${netflow_log_raw_data.count}\
          \ - offset(${netflow_log_raw_data.count},1))/offset(${netflow_log_raw_data.count},1)",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Event Volume
    value_format: '#,,.00"M"'
    comparison_label: vs last Hour
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Log Event Frequency, orientation: left, series: [{axisId: netflow_log_raw_data.count,
            id: netflow_log_raw_data.count, name: Event Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: "%I:%M%p"
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    defaults_version: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Is Risky Country (Yes / No): netflow_log_raw_data.is_risky_country
      Protocol Type: netflow_log_raw_data.protocol_name
    row: 8
    col: 6
    width: 6
    height: 2
  - title: High Risk Voume
    name: High Risk Voume
    model: anomaly_detection
    explore: netflow_log_raw_data
    type: single_value
    fields: [netflow_log_raw_data.count, netflow_log_raw_data.start_time_hour]
    fill_fields: [netflow_log_raw_data.start_time_hour]
    filters:
      netflow_log_raw_data.partition_date: 7 days
      netflow_log_raw_data.start_time_minute: 5 hours ago for 5 hours
    sorts: [netflow_log_raw_data.start_time_hour desc]
    limit: 75
    dynamic_fields: [{table_calculation: high_risk_geo_change, label: High Risk Geo
          Change, expression: "(${netflow_log_raw_data.count} - offset(${netflow_log_raw_data.count},1))/offset(${netflow_log_raw_data.count},1)",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: event_difference, label: Event Difference,
        expression: "${netflow_log_raw_data.count} - offset(${netflow_log_raw_data.count},1)",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: High Risk Geo (Inc/Desc)
    value_format: ''
    comparison_label: vs last Hour
    conditional_formatting: [{type: greater than, value: 0, background_color: '',
        font_color: "#CB1F47", color_application: {collection_id: comcast, palette_id: comcast-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 0, background_color: '', font_color: "#00B345", color_application: {
          collection_id: comcast, palette_id: comcast-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Log Event Frequency, orientation: left, series: [{axisId: netflow_log_raw_data.count,
            id: netflow_log_raw_data.count, name: Event Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: "%I:%M%p"
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    defaults_version: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [netflow_log_raw_data.count]
    listen:
      Is Risky Country (Yes / No): netflow_log_raw_data.is_risky_country
      Protocol Type: netflow_log_raw_data.protocol_name
    row: 8
    col: 12
    width: 6
    height: 2
  - title: IP Volume
    name: IP Volume
    model: anomaly_detection
    explore: netflow_log_raw_data
    type: single_value
    fields: [netflow_log_raw_data.start_time_hour, netflow_log_raw_data.count_source_ips]
    fill_fields: [netflow_log_raw_data.start_time_hour]
    filters:
      netflow_log_raw_data.partition_date: 7 days
      netflow_log_raw_data.start_time_minute: 5 hours ago for 5 hours
    sorts: [netflow_log_raw_data.start_time_hour desc]
    limit: 75
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "(\
          \ ${netflow_log_raw_data.count_source_ips} - offset(${netflow_log_raw_data.count_source_ips},1))/offset(${netflow_log_raw_data.count_source_ips},1)",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total IPs
    value_format: '#,,.00"M"'
    comparison_label: vs last Hour
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Log Event Frequency, orientation: left, series: [{axisId: netflow_log_raw_data.count,
            id: netflow_log_raw_data.count, name: Event Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: "%I:%M%p"
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    defaults_version: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Is Risky Country (Yes / No): netflow_log_raw_data.is_risky_country
      Protocol Type: netflow_log_raw_data.protocol_name
    row: 8
    col: 18
    width: 6
    height: 2
  - title: Location
    name: Location
    model: anomaly_detection
    explore: netflow_log_raw_data
    type: looker_map
    fields: [netflow_log_raw_data.geo_location, netflow_log_raw_data.count_dest_ips]
    filters:
      netflow_log_raw_data.partition_date: 7 days
    sorts: [netflow_log_raw_data.count_dest_ips desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_proportional_scale_type: log
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 44.628183546821305
    map_longitude: 9.923143386840822
    map_zoom: 3
    series_types: {}
    defaults_version: 1
    title_hidden: true
    listen:
      Is Risky Country (Yes / No): netflow_log_raw_data.is_risky_country
      Protocol Type: netflow_log_raw_data.protocol_name
    row: 10
    col: 0
    width: 13
    height: 6
  - name: Event Volume
    title: Event Volume
    merged_queries:
    - model: anomaly_detection
      explore: netflow_log_raw_data
      type: looker_line
      fields: [netflow_log_raw_data.start_time_minute, netflow_log_raw_data.count]
      fill_fields: [netflow_log_raw_data.start_time_minute]
      filters:
        netflow_log_raw_data.partition_date: 7 days
        netflow_log_raw_data.start_time_minute: 60 minutes ago for 75 minutes
      sorts: [netflow_log_raw_data.start_time_minute desc]
      limit: 75
      query_timezone: America/Los_Angeles
      x_axis_gridlines: true
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: false
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: false
      interpolation: monotone
      y_axes: [{label: Log Event Frequency, orientation: left, series: [{axisId: netflow_log_raw_data.count,
              id: netflow_log_raw_data.count, name: Event Count}], showLabels: true,
          showValues: true, valueFormat: '#,"k"', unpinAxis: false, tickDensity: default,
          tickDensityCustom: 5, type: linear}]
      series_types: {}
      x_axis_datetime_label: "%I:%M%p"
      defaults_version: 1
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
    - model: anomaly_detection
      explore: outlier_data
      type: looker_line
      fields: [outlier_data.anomaly_count, outlier_data.transaction_time_minute]
      fill_fields: [outlier_data.transaction_time_minute]
      filters:
        outlier_data.transaction_time_minute: 60 minutes ago for 75 minutes
      sorts: [outlier_data.transaction_time_minute desc]
      limit: 500
      query_timezone: America/Los_Angeles
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: true
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: ''
      limit_displayed_rows: false
      legend_position: center
      point_style: none
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      show_null_points: false
      interpolation: linear
      color_application:
        collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
        palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
        options:
          steps: 5
      series_types: {}
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      defaults_version: 1
      join_fields:
      - field_name: outlier_data.transaction_time_minute
        source_field_name: netflow_log_raw_data.start_time_minute
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Event Volume, orientation: left, series: [{axisId: netflow_log_raw_data.count,
            id: netflow_log_raw_data.count, name: Event Count}], showLabels: true,
        showValues: true, valueFormat: '#,"k"', unpinAxis: false, tickDensity: default,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: outlier_data.anomaly_count,
            id: outlier_data.anomaly_count, name: Anomaly Count}], showLabels: true,
        showValues: false, maxValue: 10, unpinAxis: false, tickDensity: default, type: log}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: ''
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hidden_series: []
    legend_position: center
    series_types:
      outlier_data.anomaly_count: scatter
    point_style: circle
    series_colors:
      outlier_data.anomaly_count: "#CB1F47"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    x_axis_datetime_label: "%I:%M%p"
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    discontinuous_nulls: false
    type: looker_line
    listen:
    - Is Risky Country (Yes / No): netflow_log_raw_data.is_risky_country
      Protocol Type: netflow_log_raw_data.protocol_name
    -
    row: 0
    col: 0
    width: 24
    height: 8
  - title: Anomaly Details (last 1 hour)
    name: Anomaly Details (last 1 hour)
    model: anomaly_detection
    explore: outlier_data
    type: looker_grid
    fields: [outlier_data.transaction_time_second, outlier_data.dst_subnet, outlier_data.duration_anomaly,
      outlier_data.rx_bytes_anomaly, outlier_data.tx_bytes_anomaly, outlier_data.actions]
    filters:
      outlier_data.transaction_time_date: 1 days
    sorts: [outlier_data.transaction_time_second desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      outlier_data.duration_anomaly: Duration Anomaly?
      outlier_data.rx_bytes_anomaly: Bytes Rx Anomaly?
      outlier_data.tx_bytes_anomaly: Bytes Tx Anomaly?
      outlier_data.number_of_unique_ips: Number of Unique IPs
    series_column_widths:
      outlier_data.dst_subnet: 138
      outlier_data.transaction_time_second: 140
      outlier_data.duration_anomaly: 152
      outlier_data.rx_bytes_anomaly: 153
    series_cell_visualizations:
      outlier_data.avg_rx_bytes:
        is_active: true
        palette:
          palette_id: c7bfb268-656e-7213-33db-67222b2e44fb
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#f9fa30"
          - "#FBB555"
          - "#E57947"
      outlier_data.avg_tx_bytes:
        is_active: true
        palette:
          palette_id: 719915e8-375d-8591-9a28-d1b98dcf6041
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#f9fa30"
          - "#FBB555"
          - "#E57947"
    series_text_format:
      outlier_data.duration_anomaly:
        align: center
      outlier_data.rx_bytes_anomaly:
        align: center
      outlier_data.tx_bytes_anomaly:
        align: center
    truncate_column_names: false
    defaults_version: 1
    hidden_fields: []
    series_types: {}
    title_hidden: true
    listen: {}
    row: 16
    col: 0
    width: 16
    height: 6
  - title: Country Breakdown
    name: Country Breakdown
    model: anomaly_detection
    explore: netflow_log_raw_data
    type: looker_pie
    fields: [netflow_log_raw_data.count, netflow_log_raw_data.geo_country]
    filters:
      netflow_log_raw_data.partition_date: 7 days
      netflow_log_raw_data.start_time_minute: 60 minutes
      netflow_log_raw_data.geo_country: "-EMPTY"
    sorts: [netflow_log_raw_data.count desc]
    limit: 10
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: count, label: Count, expression: "if(\n#\
          \ For rows other than the last row\n row() != max(row()) \n# Display event\
          \ count\n ,${netflow_log_raw_data.count}\n# For the last row, display total\
          \ event count from all rows above this one\n , ${netflow_log_raw_data.count:total}\
          \ - sum( if(row()= max(row()) , 0 , ${netflow_log_raw_data.count}) )\n)",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: country, label: Country, expression: "if(\n\
          # For rows other than the last row\n row() != max(row()) \n# Display event\
          \ name\n ,${netflow_log_raw_data.geo_country}\n# For the last row, display\
          \ \"Other\"\n , \"Other\"\n)", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, _type_hint: string}]
    value_labels: labels
    label_type: labPer
    inner_radius: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    defaults_version: 1
    series_types: {}
    hidden_fields: [netflow_log_raw_data.geo_country, netflow_log_raw_data.count]
    listen:
      Is Risky Country (Yes / No): netflow_log_raw_data.is_risky_country
      Protocol Type: netflow_log_raw_data.protocol_name
    row: 16
    col: 16
    width: 8
    height: 6
  filters:
  - name: Protocol Type
    title: Protocol Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: anomaly_detection
    explore: netflow_log_raw_data
    listens_to_filters: []
    field: netflow_log_raw_data.protocol_name
  - name: Is Risky Country (Yes / No)
    title: Is Risky Country (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: radio_buttons
      display: inline
      options: []
    model: anomaly_detection
    explore: netflow_log_raw_data
    listens_to_filters: []
    field: netflow_log_raw_data.is_risky_country
