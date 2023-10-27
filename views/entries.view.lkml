# The name of this view in Looker is "Entries"
view: entries {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: public.entries ;;
  drill_fields: [content]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: content {
    primary_key: yes
    type: string
    sql: ${TABLE}."content" ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Entryid" in Explore.

  dimension: entryid {
    type: number
    value_format_name: id
    sql: ${TABLE}."entryid" ;;
  }

  dimension: guestname {
    type: string
    sql: ${TABLE}."guestname" ;;
  }
  measure: count {
    type: count
    drill_fields: [content, guestname]
  }
}
