view: netflow_log_raw_data {
  sql_table_name: netflow_log_data ;;
  #sql_table_name: `anomaly_detection.netflow_log_raw_data`;;

  dimension_group: partition {
    type: time
    timeframes: [
      raw,
      second,
      minute,
      minute10,
      time,
      hour,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}._PARTITIONTIME AS TIMESTAMP) ;;
  }

  dimension: dst_ip {
    group_label: "Destination"
    label: "Destination IP"
    group_item_label: "IP"
    type: string
    sql: ${TABLE}.dstIP ;;
  }

  dimension: dst_port {
    group_label: "Destination"
    label: "Destination Port"
    group_item_label: "Port"
    type: number
    sql: ${TABLE}.dstPort ;;
    value_format_name: id
  }

  dimension: dest_full_tcp {
    group_label: "Destination"
    label: "Destination Full TCP"
    group_item_label: "Full TCP"
    type: string
    sql: CONCAT(${dst_ip},':',${dst_port::string}) ;;
    value_format_name: id
  }

  dimension_group: end_time {
    label: "Connection End"
    type: time
    timeframes: [raw, date, time]
    sql: TIMESTAMP_MILLIS(cast(${TABLE}.endTime AS INT64))  ;;
  }

  dimension: protocol_name {
    label: "Protocol Type"
    type: string
    sql: UPPER(${TABLE}.protocolName) ;;
  }

  dimension: protocol_number {
    hidden: yes
    type: number
    sql: ${TABLE}.protocolNumber ;;
  }

  dimension: bytes_received {
    type: number
    sql: ${TABLE}.rxBytes ;;
  }

  dimension: src_ip {
    group_label: "Source"
    label: "Source IP"
    group_item_label: "IP"
    type: string
    sql: ${TABLE}.srcIP ;;
  }

  dimension: src_port {
    group_label: "Source"
    label: "Source Port"
    group_item_label: "Port"
    type: number
    sql: ${TABLE}.srcPort ;;
    value_format_name: id
  }

  dimension: src_full_tcp {
    group_label: "Source"
    label: "Source Full TCP"
    group_item_label: "Full TCP"
    type: string
    sql: CONCAT(${src_ip},':',${src_port::string}) ;;
    value_format_name: id
  }

  dimension_group: start_time {
    label: "Connection Start"
    type: time
    timeframes: [raw, minute, date, time, hour_of_day, hour, minute15, hour6]
    sql: TIMESTAMP_MILLIS(cast(${TABLE}.startTime  AS INT64))  ;;
  }

  dimension: subscriber_id {
    type: string
    sql: ${TABLE}.subscriberId ;;
  }

  dimension: tcp_flag {
    type: number
    sql: ${TABLE}.tcpFlag ;;
  }

  dimension: bytes_transferred {
    type: number
    sql: ${TABLE}.txBytes ;;
  }

  ### geography

  dimension: geo_city {
    view_label: "Geography"
    type: string
    sql: ${TABLE}.geoCity ;;
  }

  dimension: geo_country {
    view_label: "Geography"
    type: string
    sql: ${TABLE}.geoCountry ;;
  }

  dimension: is_risky_country {
    view_label: "Geography"
    type: yesno
    sql: ${geo_country} IN ('Russia', 'China', 'North Korea', 'Iran') ;;
  }

  dimension: latitude {
    # hidden: yes
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    # hidden: yes
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: geo_location_detail {
    view_label: "Geography"
    type: location
    sql_latitude: ${latitude};;
    sql_longitude: ${longitude} ;;
  }

  dimension: geo_location {
    view_label: "Geography"
    type: location
    sql_latitude: round(${latitude},0) ;;
    sql_longitude: round(${longitude},0) ;;
  }

  measure: count {
    label: "Event Count"
    type: count
    drill_fields: [detail*]
  }

  measure: count_source_ips {
    group_label: "Source"
    group_item_label: "Count IP"
    label: "Source Count IP"
    type: count_distinct
    sql: ${src_ip} ;;
    drill_fields: [detail*]
  }

  measure: count_source_full_tcp {
    group_label: "Source"
    group_item_label: "Count Full TCP"
    label: "Source Count Full TCP"
    type: count_distinct
    sql: ${src_full_tcp} ;;
    drill_fields: [detail*]
  }

  measure: count_dest_ips {
    group_label: "Destination"
    group_item_label: "Count IP"
    label: "Count Destination IP"
    type: count_distinct
    sql: ${dst_ip} ;;
    drill_fields: [detail*]
  }


  measure: count_dest_full_tcp {
    group_label: "Destination"
    group_item_label: "Count Full TCP"
    label: "Destination Count Full TCP"
    type: count_distinct
    sql: ${dst_ip} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [ partition_time, geo_country, src_ip, src_port, dst_ip, dst_port, bytes_transferred]
  }
}
