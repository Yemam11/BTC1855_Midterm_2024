Report Findings
================
Youssef Emam
2024-08-04

## Data Overview

------------------------------------------------------------------------

## EDA

### Station Data

Once I loaded the data the next step was to look at it. To do this I
completed a basic exploratory data analysis. I created plots that
summarized the data to get an idea of the distribution across the
different data sets.

Firstly I summarized each station by the amount of traffic that it gets.
In this case I defined traffic as how many times a trip starts or stops
at a station. The plot can be seen below:

![](report_findings_files/figure-gfm/traffic-1.png)<!-- -->

It can be seen that there is quite a large variance in how much traffic
each station gets.

### Trip Data

Next I summarized the trip data by identifying the average cycling
duration over the course of each month. The plot can be seen below:

![](report_findings_files/figure-gfm/trips-1.png)<!-- -->

Unexpectedly, the highest mean duration occurs during December. This is
likely due to the presence of an outlier which we will investigate
later. Aside from this, as expected the usage seems to increase in the
summer months and decrease slightly in the winter months.

### Weather data

To summarize the weather data, I identified how the precipitation levels
change over the course of the year with respect to each city represented
in the data:

![](report_findings_files/figure-gfm/weather-1.png)<!-- -->

As expected, the precipitation peaks in the winter months, and becomes
insignificant during the summer months.

------------------------------------------------------------------------

## Data Cleaning

As seen earlier, the data contains outliers and requires significant
amounts of preprocessing.

This is a list of changes that were made to each dataset, and the
reasons behind them:

### Stations

Dates were converted to POSIXct format ~ Enables easier manipulation and
comparison later on

### Trips

Dates were converted to POSIXct format ~ Enables easier manipulation and
comparison later on

Character fields were converted to factors ~ Enables grouping, and
allows us to compare trends later on

Zip Code outliers were removed ~ Any value beyond the valid zip code
range of 00501- 99950 was removed. Any blank values were converted to
NAs, and the column was turned into integer data

Cancelled trips were identified ~ Any trip that lasted less than 3
minutes and started/ended at the same station was considered cancelled.
These trips were removed from the data set and stored in a separate
file. A snapshot of this file can be seen below (see the HTML version of
this document to use an interactive version of the complete table):

<div id="fyxobdngzy" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#fyxobdngzy table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#fyxobdngzy thead, #fyxobdngzy tbody, #fyxobdngzy tfoot, #fyxobdngzy tr, #fyxobdngzy td, #fyxobdngzy th {
  border-style: none;
}
&#10;#fyxobdngzy p {
  margin: 0;
  padding: 0;
}
&#10;#fyxobdngzy .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#fyxobdngzy .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#fyxobdngzy .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#fyxobdngzy .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#fyxobdngzy .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#fyxobdngzy .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#fyxobdngzy .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#fyxobdngzy .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#fyxobdngzy .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#fyxobdngzy .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#fyxobdngzy .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#fyxobdngzy .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#fyxobdngzy .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#fyxobdngzy .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#fyxobdngzy .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#fyxobdngzy .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#fyxobdngzy .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#fyxobdngzy .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#fyxobdngzy .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#fyxobdngzy .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#fyxobdngzy .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#fyxobdngzy .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#fyxobdngzy .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#fyxobdngzy .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#fyxobdngzy .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#fyxobdngzy .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#fyxobdngzy .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#fyxobdngzy .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#fyxobdngzy .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#fyxobdngzy .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#fyxobdngzy .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#fyxobdngzy .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#fyxobdngzy .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#fyxobdngzy .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#fyxobdngzy .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#fyxobdngzy .gt_left {
  text-align: left;
}
&#10;#fyxobdngzy .gt_center {
  text-align: center;
}
&#10;#fyxobdngzy .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#fyxobdngzy .gt_font_normal {
  font-weight: normal;
}
&#10;#fyxobdngzy .gt_font_bold {
  font-weight: bold;
}
&#10;#fyxobdngzy .gt_font_italic {
  font-style: italic;
}
&#10;#fyxobdngzy .gt_super {
  font-size: 65%;
}
&#10;#fyxobdngzy .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#fyxobdngzy .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#fyxobdngzy .gt_indent_1 {
  text-indent: 5px;
}
&#10;#fyxobdngzy .gt_indent_2 {
  text-indent: 10px;
}
&#10;#fyxobdngzy .gt_indent_3 {
  text-indent: 15px;
}
&#10;#fyxobdngzy .gt_indent_4 {
  text-indent: 20px;
}
&#10;#fyxobdngzy .gt_indent_5 {
  text-indent: 25px;
}
&#10;#fyxobdngzy .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#fyxobdngzy div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="12" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Cancelled Trips</td>
    </tr>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="X">X</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="id">id</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="duration">duration</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="start_date">start_date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="start_station_name">start_station_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="start_station_id">start_station_id</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="end_date">end_date</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="end_station_name">end_station_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="end_station_id">end_station_id</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="bike_id">bike_id</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="subscription_type">subscription_type</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="zip_code">zip_code</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="X" class="gt_row gt_right">1</td>
<td headers="id" class="gt_row gt_right">139945</td>
<td headers="duration" class="gt_row gt_right">73</td>
<td headers="start_date" class="gt_row gt_right">2014-01-01 17:57:00</td>
<td headers="start_station_name" class="gt_row gt_left">5th at Howard</td>
<td headers="start_station_id" class="gt_row gt_right">57</td>
<td headers="end_date" class="gt_row gt_right">2014-01-01 17:59:00</td>
<td headers="end_station_name" class="gt_row gt_left">5th at Howard</td>
<td headers="end_station_id" class="gt_row gt_right">57</td>
<td headers="bike_id" class="gt_row gt_right">509</td>
<td headers="subscription_type" class="gt_row gt_left">Subscriber</td>
<td headers="zip_code" class="gt_row gt_right">94103</td></tr>
    <tr><td headers="X" class="gt_row gt_right">2</td>
<td headers="id" class="gt_row gt_right">139967</td>
<td headers="duration" class="gt_row gt_right">160</td>
<td headers="start_date" class="gt_row gt_right">2014-01-01 19:11:00</td>
<td headers="start_station_name" class="gt_row gt_left">California Ave Caltrain Station</td>
<td headers="start_station_id" class="gt_row gt_right">36</td>
<td headers="end_date" class="gt_row gt_right">2014-01-01 19:13:00</td>
<td headers="end_station_name" class="gt_row gt_left">California Ave Caltrain Station</td>
<td headers="end_station_id" class="gt_row gt_right">36</td>
<td headers="bike_id" class="gt_row gt_right">51</td>
<td headers="subscription_type" class="gt_row gt_left">Customer</td>
<td headers="zip_code" class="gt_row gt_right">6877</td></tr>
    <tr><td headers="X" class="gt_row gt_right">3</td>
<td headers="id" class="gt_row gt_right">140179</td>
<td headers="duration" class="gt_row gt_right">63</td>
<td headers="start_date" class="gt_row gt_right">2014-01-02 08:32:00</td>
<td headers="start_station_name" class="gt_row gt_left">2nd at Folsom</td>
<td headers="start_station_id" class="gt_row gt_right">62</td>
<td headers="end_date" class="gt_row gt_right">2014-01-02 08:33:00</td>
<td headers="end_station_name" class="gt_row gt_left">2nd at Folsom</td>
<td headers="end_station_id" class="gt_row gt_right">62</td>
<td headers="bike_id" class="gt_row gt_right">632</td>
<td headers="subscription_type" class="gt_row gt_left">Subscriber</td>
<td headers="zip_code" class="gt_row gt_right">94107</td></tr>
    <tr><td headers="X" class="gt_row gt_right">4</td>
<td headers="id" class="gt_row gt_right">140429</td>
<td headers="duration" class="gt_row gt_right">126</td>
<td headers="start_date" class="gt_row gt_right">2014-01-02 11:49:00</td>
<td headers="start_station_name" class="gt_row gt_left">San Francisco Caltrain (Townsend at 4th)</td>
<td headers="start_station_id" class="gt_row gt_right">70</td>
<td headers="end_date" class="gt_row gt_right">2014-01-02 11:51:00</td>
<td headers="end_station_name" class="gt_row gt_left">San Francisco Caltrain (Townsend at 4th)</td>
<td headers="end_station_id" class="gt_row gt_right">70</td>
<td headers="bike_id" class="gt_row gt_right">321</td>
<td headers="subscription_type" class="gt_row gt_left">Customer</td>
<td headers="zip_code" class="gt_row gt_right">61801</td></tr>
    <tr><td headers="X" class="gt_row gt_right">5</td>
<td headers="id" class="gt_row gt_right">140484</td>
<td headers="duration" class="gt_row gt_right">114</td>
<td headers="start_date" class="gt_row gt_right">2014-01-02 12:49:00</td>
<td headers="start_station_name" class="gt_row gt_left">Harry Bridges Plaza (Ferry Building)</td>
<td headers="start_station_id" class="gt_row gt_right">50</td>
<td headers="end_date" class="gt_row gt_right">2014-01-02 12:51:00</td>
<td headers="end_station_name" class="gt_row gt_left">Harry Bridges Plaza (Ferry Building)</td>
<td headers="end_station_id" class="gt_row gt_right">50</td>
<td headers="bike_id" class="gt_row gt_right">407</td>
<td headers="subscription_type" class="gt_row gt_left">Subscriber</td>
<td headers="zip_code" class="gt_row gt_right">94131</td></tr>
    <tr><td headers="X" class="gt_row gt_right">6</td>
<td headers="id" class="gt_row gt_right">140715</td>
<td headers="duration" class="gt_row gt_right">69</td>
<td headers="start_date" class="gt_row gt_right">2014-01-02 16:25:00</td>
<td headers="start_station_name" class="gt_row gt_left">Mountain View City Hall</td>
<td headers="start_station_id" class="gt_row gt_right">27</td>
<td headers="end_date" class="gt_row gt_right">2014-01-02 16:26:00</td>
<td headers="end_station_name" class="gt_row gt_left">Mountain View City Hall</td>
<td headers="end_station_id" class="gt_row gt_right">27</td>
<td headers="bike_id" class="gt_row gt_right">98</td>
<td headers="subscription_type" class="gt_row gt_left">Subscriber</td>
<td headers="zip_code" class="gt_row gt_right">94102</td></tr>
    <tr><td headers="X" class="gt_row gt_right">7</td>
<td headers="id" class="gt_row gt_right">140734</td>
<td headers="duration" class="gt_row gt_right">64</td>
<td headers="start_date" class="gt_row gt_right">2014-01-02 16:32:00</td>
<td headers="start_station_name" class="gt_row gt_left">South Van Ness at Market</td>
<td headers="start_station_id" class="gt_row gt_right">66</td>
<td headers="end_date" class="gt_row gt_right">2014-01-02 16:33:00</td>
<td headers="end_station_name" class="gt_row gt_left">South Van Ness at Market</td>
<td headers="end_station_id" class="gt_row gt_right">66</td>
<td headers="bike_id" class="gt_row gt_right">525</td>
<td headers="subscription_type" class="gt_row gt_left">Subscriber</td>
<td headers="zip_code" class="gt_row gt_right">94612</td></tr>
    <tr><td headers="X" class="gt_row gt_right">8</td>
<td headers="id" class="gt_row gt_right">141227</td>
<td headers="duration" class="gt_row gt_right">123</td>
<td headers="start_date" class="gt_row gt_right">2014-01-03 08:02:00</td>
<td headers="start_station_name" class="gt_row gt_left">South Van Ness at Market</td>
<td headers="start_station_id" class="gt_row gt_right">66</td>
<td headers="end_date" class="gt_row gt_right">2014-01-03 08:04:00</td>
<td headers="end_station_name" class="gt_row gt_left">South Van Ness at Market</td>
<td headers="end_station_id" class="gt_row gt_right">66</td>
<td headers="bike_id" class="gt_row gt_right">368</td>
<td headers="subscription_type" class="gt_row gt_left">Customer</td>
<td headers="zip_code" class="gt_row gt_right">94114</td></tr>
    <tr><td headers="X" class="gt_row gt_right">9</td>
<td headers="id" class="gt_row gt_right">141388</td>
<td headers="duration" class="gt_row gt_right">66</td>
<td headers="start_date" class="gt_row gt_right">2014-01-03 09:15:00</td>
<td headers="start_station_name" class="gt_row gt_left">Powell Street BART</td>
<td headers="start_station_id" class="gt_row gt_right">39</td>
<td headers="end_date" class="gt_row gt_right">2014-01-03 09:16:00</td>
<td headers="end_station_name" class="gt_row gt_left">Powell Street BART</td>
<td headers="end_station_id" class="gt_row gt_right">39</td>
<td headers="bike_id" class="gt_row gt_right">424</td>
<td headers="subscription_type" class="gt_row gt_left">Subscriber</td>
<td headers="zip_code" class="gt_row gt_right">94116</td></tr>
    <tr><td headers="X" class="gt_row gt_right">10</td>
<td headers="id" class="gt_row gt_right">142332</td>
<td headers="duration" class="gt_row gt_right">64</td>
<td headers="start_date" class="gt_row gt_right">2014-01-04 10:02:00</td>
<td headers="start_station_name" class="gt_row gt_left">Mechanics Plaza (Market at Battery)</td>
<td headers="start_station_id" class="gt_row gt_right">75</td>
<td headers="end_date" class="gt_row gt_right">2014-01-04 10:03:00</td>
<td headers="end_station_name" class="gt_row gt_left">Mechanics Plaza (Market at Battery)</td>
<td headers="end_station_id" class="gt_row gt_right">75</td>
<td headers="bike_id" class="gt_row gt_right">573</td>
<td headers="subscription_type" class="gt_row gt_left">Subscriber</td>
<td headers="zip_code" class="gt_row gt_right">94105</td></tr>
  </tbody>
  &#10;  
</table>
</div>

Outliers were removed from the duration field ~ Any trip lasting longer
than 1 day were removed from the data. It is assumed that any trip
lasting longer than 1 day likely means that the customer forgot to
return the bike.

### Weather

Date ~ Converted to POSIXct. This enables easier manipulation and
comparison later on, as well as enables us to join to other data sets
using date values as a common column

Events ~ Converted to factor

City ~ Converted to factor

Cloud_Cover~ Converted to factor

Precipitation ~ Replaced trace values denoted by “T” with a small
numeric value (0.005). Converted the column to be an integer field. This
enables us to identify and compare precipitation trends.

------------------------------------------------------------------------

## Rush Hour Analysis

### Identifying Rush Hours:

To identify rush hour, the frequency of trips in each hour was plotted.
In order to prevent biasing the “rush hour” to earlier or later times,
the midpoint between the start and end time of each trip was calculated.
This was chosen to give a representative estimate of peak hours.
Further, rush hour can be defined as times of the day where trip
frequency is above average. As such the mean frequency of trips was
calculated (black line) and added to the plot for comparison’s sake, as
well as a means for objective identification of rush hours. Plotting the
the frequency of trips by hour of the day shows us:

![](report_findings_files/figure-gfm/plot_results-1.png)<!-- -->

Analyzing the plot, it is evident that the first set of rush hours are
in the morning hours of 7am - 10:30pm. These hours see a large uptick in
trip frequency, followed by the lunch rush from 11:30am - 1:30pm. The
evening rush hour spans from about 6pm - 8pm.

### Busiest Stations During Rush Hours:

To identify the busiest stations during rush hours the data can be
grouped by station, filtered by time (within rush hour boundaries
established above), and the frequency of trips beginning at that station
can be counted. These results can be visualized below:

<div id="xhekagklbh" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#xhekagklbh table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#xhekagklbh thead, #xhekagklbh tbody, #xhekagklbh tfoot, #xhekagklbh tr, #xhekagklbh td, #xhekagklbh th {
  border-style: none;
}
&#10;#xhekagklbh p {
  margin: 0;
  padding: 0;
}
&#10;#xhekagklbh .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#xhekagklbh .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#xhekagklbh .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#xhekagklbh .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#xhekagklbh .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#xhekagklbh .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#xhekagklbh .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#xhekagklbh .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#xhekagklbh .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#xhekagklbh .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#xhekagklbh .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#xhekagklbh .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#xhekagklbh .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#xhekagklbh .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#xhekagklbh .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#xhekagklbh .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#xhekagklbh .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#xhekagklbh .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#xhekagklbh .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xhekagklbh .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#xhekagklbh .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#xhekagklbh .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#xhekagklbh .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xhekagklbh .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#xhekagklbh .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#xhekagklbh .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#xhekagklbh .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xhekagklbh .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#xhekagklbh .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#xhekagklbh .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#xhekagklbh .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#xhekagklbh .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#xhekagklbh .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xhekagklbh .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#xhekagklbh .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xhekagklbh .gt_left {
  text-align: left;
}
&#10;#xhekagklbh .gt_center {
  text-align: center;
}
&#10;#xhekagklbh .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#xhekagklbh .gt_font_normal {
  font-weight: normal;
}
&#10;#xhekagklbh .gt_font_bold {
  font-weight: bold;
}
&#10;#xhekagklbh .gt_font_italic {
  font-style: italic;
}
&#10;#xhekagklbh .gt_super {
  font-size: 65%;
}
&#10;#xhekagklbh .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#xhekagklbh .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#xhekagklbh .gt_indent_1 {
  text-indent: 5px;
}
&#10;#xhekagklbh .gt_indent_2 {
  text-indent: 10px;
}
&#10;#xhekagklbh .gt_indent_3 {
  text-indent: 15px;
}
&#10;#xhekagklbh .gt_indent_4 {
  text-indent: 20px;
}
&#10;#xhekagklbh .gt_indent_5 {
  text-indent: 25px;
}
&#10;#xhekagklbh .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#xhekagklbh div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="2" class="gt_heading gt_title gt_font_normal" style>Most Frequent Starting Locations</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="2" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>During Rush Hours</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="start_station_name">start_station_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="number">number</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="start_station_name" class="gt_row gt_center">San Francisco Caltrain (Townsend at 4th)</td>
<td headers="number" class="gt_row gt_right">19804</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">San Francisco Caltrain 2 (330 Townsend)</td>
<td headers="number" class="gt_row gt_right">11412</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Temporary Transbay Terminal (Howard at Beale)</td>
<td headers="number" class="gt_row gt_right">10093</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Harry Bridges Plaza (Ferry Building)</td>
<td headers="number" class="gt_row gt_right">8511</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">2nd at Townsend</td>
<td headers="number" class="gt_row gt_right">7938</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Steuart at Market</td>
<td headers="number" class="gt_row gt_right">7865</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Market at Sansome</td>
<td headers="number" class="gt_row gt_right">7456</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Townsend at 7th</td>
<td headers="number" class="gt_row gt_right">7184</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Market at 10th</td>
<td headers="number" class="gt_row gt_right">6181</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Embarcadero at Sansome</td>
<td headers="number" class="gt_row gt_right">6024</td></tr>
  </tbody>
  &#10;  
</table>
</div>
<div id="wunnojjqmm" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#wunnojjqmm table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#wunnojjqmm thead, #wunnojjqmm tbody, #wunnojjqmm tfoot, #wunnojjqmm tr, #wunnojjqmm td, #wunnojjqmm th {
  border-style: none;
}
&#10;#wunnojjqmm p {
  margin: 0;
  padding: 0;
}
&#10;#wunnojjqmm .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#wunnojjqmm .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#wunnojjqmm .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#wunnojjqmm .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#wunnojjqmm .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#wunnojjqmm .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#wunnojjqmm .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#wunnojjqmm .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#wunnojjqmm .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#wunnojjqmm .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#wunnojjqmm .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#wunnojjqmm .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#wunnojjqmm .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#wunnojjqmm .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#wunnojjqmm .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#wunnojjqmm .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#wunnojjqmm .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#wunnojjqmm .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#wunnojjqmm .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wunnojjqmm .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#wunnojjqmm .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#wunnojjqmm .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#wunnojjqmm .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wunnojjqmm .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#wunnojjqmm .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#wunnojjqmm .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#wunnojjqmm .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wunnojjqmm .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#wunnojjqmm .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#wunnojjqmm .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#wunnojjqmm .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#wunnojjqmm .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#wunnojjqmm .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wunnojjqmm .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#wunnojjqmm .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#wunnojjqmm .gt_left {
  text-align: left;
}
&#10;#wunnojjqmm .gt_center {
  text-align: center;
}
&#10;#wunnojjqmm .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#wunnojjqmm .gt_font_normal {
  font-weight: normal;
}
&#10;#wunnojjqmm .gt_font_bold {
  font-weight: bold;
}
&#10;#wunnojjqmm .gt_font_italic {
  font-style: italic;
}
&#10;#wunnojjqmm .gt_super {
  font-size: 65%;
}
&#10;#wunnojjqmm .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#wunnojjqmm .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#wunnojjqmm .gt_indent_1 {
  text-indent: 5px;
}
&#10;#wunnojjqmm .gt_indent_2 {
  text-indent: 10px;
}
&#10;#wunnojjqmm .gt_indent_3 {
  text-indent: 15px;
}
&#10;#wunnojjqmm .gt_indent_4 {
  text-indent: 20px;
}
&#10;#wunnojjqmm .gt_indent_5 {
  text-indent: 25px;
}
&#10;#wunnojjqmm .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#wunnojjqmm div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="2" class="gt_heading gt_title gt_font_normal" style>Most Frequent Ending Stations</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="2" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>During Rush Hours</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="end_station_name">end_station_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="number">number</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="end_station_name" class="gt_row gt_center">San Francisco Caltrain (Townsend at 4th)</td>
<td headers="number" class="gt_row gt_right">25520</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">San Francisco Caltrain 2 (330 Townsend)</td>
<td headers="number" class="gt_row gt_right">11252</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">2nd at Townsend</td>
<td headers="number" class="gt_row gt_right">9073</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">Market at Sansome</td>
<td headers="number" class="gt_row gt_right">9055</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">Temporary Transbay Terminal (Howard at Beale)</td>
<td headers="number" class="gt_row gt_right">8590</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">Harry Bridges Plaza (Ferry Building)</td>
<td headers="number" class="gt_row gt_right">8363</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">Townsend at 7th</td>
<td headers="number" class="gt_row gt_right">8251</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">Steuart at Market</td>
<td headers="number" class="gt_row gt_right">7842</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">Embarcadero at Sansome</td>
<td headers="number" class="gt_row gt_right">5980</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">2nd at South Park</td>
<td headers="number" class="gt_row gt_right">5433</td></tr>
  </tbody>
  &#10;  
</table>
</div>

The same methodology can be employed to identify the busiest stations on
weekends:

<div id="xbpsdugsxr" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#xbpsdugsxr table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#xbpsdugsxr thead, #xbpsdugsxr tbody, #xbpsdugsxr tfoot, #xbpsdugsxr tr, #xbpsdugsxr td, #xbpsdugsxr th {
  border-style: none;
}
&#10;#xbpsdugsxr p {
  margin: 0;
  padding: 0;
}
&#10;#xbpsdugsxr .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#xbpsdugsxr .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#xbpsdugsxr .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#xbpsdugsxr .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#xbpsdugsxr .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#xbpsdugsxr .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#xbpsdugsxr .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#xbpsdugsxr .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#xbpsdugsxr .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#xbpsdugsxr .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#xbpsdugsxr .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#xbpsdugsxr .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#xbpsdugsxr .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#xbpsdugsxr .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#xbpsdugsxr .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#xbpsdugsxr .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#xbpsdugsxr .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#xbpsdugsxr .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#xbpsdugsxr .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xbpsdugsxr .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#xbpsdugsxr .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#xbpsdugsxr .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#xbpsdugsxr .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xbpsdugsxr .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#xbpsdugsxr .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#xbpsdugsxr .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#xbpsdugsxr .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xbpsdugsxr .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#xbpsdugsxr .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#xbpsdugsxr .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#xbpsdugsxr .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#xbpsdugsxr .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#xbpsdugsxr .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xbpsdugsxr .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#xbpsdugsxr .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#xbpsdugsxr .gt_left {
  text-align: left;
}
&#10;#xbpsdugsxr .gt_center {
  text-align: center;
}
&#10;#xbpsdugsxr .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#xbpsdugsxr .gt_font_normal {
  font-weight: normal;
}
&#10;#xbpsdugsxr .gt_font_bold {
  font-weight: bold;
}
&#10;#xbpsdugsxr .gt_font_italic {
  font-style: italic;
}
&#10;#xbpsdugsxr .gt_super {
  font-size: 65%;
}
&#10;#xbpsdugsxr .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#xbpsdugsxr .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#xbpsdugsxr .gt_indent_1 {
  text-indent: 5px;
}
&#10;#xbpsdugsxr .gt_indent_2 {
  text-indent: 10px;
}
&#10;#xbpsdugsxr .gt_indent_3 {
  text-indent: 15px;
}
&#10;#xbpsdugsxr .gt_indent_4 {
  text-indent: 20px;
}
&#10;#xbpsdugsxr .gt_indent_5 {
  text-indent: 25px;
}
&#10;#xbpsdugsxr .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#xbpsdugsxr div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="2" class="gt_heading gt_title gt_font_normal" style>Most Frequent Starting Stations</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="2" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Weekends</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="start_station_name">start_station_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="number">number</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="start_station_name" class="gt_row gt_center">Harry Bridges Plaza (Ferry Building)</td>
<td headers="number" class="gt_row gt_right">3178</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Embarcadero at Sansome</td>
<td headers="number" class="gt_row gt_right">3134</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Market at 4th</td>
<td headers="number" class="gt_row gt_right">1667</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Embarcadero at Bryant</td>
<td headers="number" class="gt_row gt_right">1608</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">2nd at Townsend</td>
<td headers="number" class="gt_row gt_right">1556</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Powell Street BART</td>
<td headers="number" class="gt_row gt_right">1499</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">San Francisco Caltrain (Townsend at 4th)</td>
<td headers="number" class="gt_row gt_right">1368</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Grant Avenue at Columbus Avenue</td>
<td headers="number" class="gt_row gt_right">1303</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Market at Sansome</td>
<td headers="number" class="gt_row gt_right">1101</td></tr>
    <tr><td headers="start_station_name" class="gt_row gt_center">Powell at Post (Union Square)</td>
<td headers="number" class="gt_row gt_right">1096</td></tr>
  </tbody>
  &#10;  
</table>
</div>
<div id="qdwtceywlx" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#qdwtceywlx table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#qdwtceywlx thead, #qdwtceywlx tbody, #qdwtceywlx tfoot, #qdwtceywlx tr, #qdwtceywlx td, #qdwtceywlx th {
  border-style: none;
}
&#10;#qdwtceywlx p {
  margin: 0;
  padding: 0;
}
&#10;#qdwtceywlx .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#qdwtceywlx .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#qdwtceywlx .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#qdwtceywlx .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#qdwtceywlx .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#qdwtceywlx .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#qdwtceywlx .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#qdwtceywlx .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#qdwtceywlx .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#qdwtceywlx .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#qdwtceywlx .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#qdwtceywlx .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#qdwtceywlx .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#qdwtceywlx .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#qdwtceywlx .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#qdwtceywlx .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#qdwtceywlx .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#qdwtceywlx .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#qdwtceywlx .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#qdwtceywlx .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#qdwtceywlx .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#qdwtceywlx .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#qdwtceywlx .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#qdwtceywlx .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#qdwtceywlx .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#qdwtceywlx .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#qdwtceywlx .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#qdwtceywlx .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#qdwtceywlx .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#qdwtceywlx .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#qdwtceywlx .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#qdwtceywlx .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#qdwtceywlx .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#qdwtceywlx .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#qdwtceywlx .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#qdwtceywlx .gt_left {
  text-align: left;
}
&#10;#qdwtceywlx .gt_center {
  text-align: center;
}
&#10;#qdwtceywlx .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#qdwtceywlx .gt_font_normal {
  font-weight: normal;
}
&#10;#qdwtceywlx .gt_font_bold {
  font-weight: bold;
}
&#10;#qdwtceywlx .gt_font_italic {
  font-style: italic;
}
&#10;#qdwtceywlx .gt_super {
  font-size: 65%;
}
&#10;#qdwtceywlx .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#qdwtceywlx .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#qdwtceywlx .gt_indent_1 {
  text-indent: 5px;
}
&#10;#qdwtceywlx .gt_indent_2 {
  text-indent: 10px;
}
&#10;#qdwtceywlx .gt_indent_3 {
  text-indent: 15px;
}
&#10;#qdwtceywlx .gt_indent_4 {
  text-indent: 20px;
}
&#10;#qdwtceywlx .gt_indent_5 {
  text-indent: 25px;
}
&#10;#qdwtceywlx .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#qdwtceywlx div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="2" class="gt_heading gt_title gt_font_normal" style>Most Frequent Starting Stations</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="2" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Weekends</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="end_station_name">end_station_name</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="number">number</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="end_station_name" class="gt_row gt_center">Embarcadero at Sansome</td>
<td headers="number" class="gt_row gt_right">3386</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">Harry Bridges Plaza (Ferry Building)</td>
<td headers="number" class="gt_row gt_right">3190</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">Market at 4th</td>
<td headers="number" class="gt_row gt_right">1885</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">Powell Street BART</td>
<td headers="number" class="gt_row gt_right">1690</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">San Francisco Caltrain (Townsend at 4th)</td>
<td headers="number" class="gt_row gt_right">1664</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">2nd at Townsend</td>
<td headers="number" class="gt_row gt_right">1603</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">Embarcadero at Bryant</td>
<td headers="number" class="gt_row gt_right">1390</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">Steuart at Market</td>
<td headers="number" class="gt_row gt_right">1226</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">Market at Sansome</td>
<td headers="number" class="gt_row gt_right">1114</td></tr>
    <tr><td headers="end_station_name" class="gt_row gt_center">Grant Avenue at Columbus Avenue</td>
<td headers="number" class="gt_row gt_right">1102</td></tr>
  </tbody>
  &#10;  
</table>
</div>

------------------------------------------------------------------------

### Utilization

In order to identify the degree of utilization of bikes, I decided to
represent utilization as a percentage of the systems total utilization.
This is calculated by identifying the total duration of rides in a month
and expressing it as a proportion of the maximum duration the system can
support. It should be noted that to calculate the total number of bikes
in the system at a given time, the number of unique bike IDs in the
trips data set were counted. This assumes that any bike that is not in
use does not contribute to the total capacity of the system. It is
likely that if a bike is not used at all in a given month, it is either
broken, or being serviced. Another way to identify the number of bikes
is to sum the number of docks at each station. The downside of this
method is that it assumes that each station has as many bikes as there
are docks, and that each of the bikes is used every month. For this
reason I opted to calculate the value using the former method. The
results of this analysis are visualized below:

![](report_findings_files/figure-gfm/utilization-1.png)<!-- -->

From this figure it is evident that the system is more than capable of
supporting the biking needs of it’s population, as the maximum
utilization is less than 2% of the total which occurs in the August.
Consistent with the EDA data seen above, utilization peaks in the summer
months and decreases in the winter months. To identify specifically how
much each bike is used, I created an interactive table which summarizes
each bike by the total duration of use (This can be accessed by cloning
the repo and interacting with the table through the HTML file, otherwise
the table below will just be a snapshot image). A specific ID can be
searched and the usage per month can be identified. The table can also
be sorted by pressing on the headers to identify bikes with the lowest
usage that might be broken, lost or need servicing:

<div id="mjgjkmeugi" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#mjgjkmeugi table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#mjgjkmeugi thead, #mjgjkmeugi tbody, #mjgjkmeugi tfoot, #mjgjkmeugi tr, #mjgjkmeugi td, #mjgjkmeugi th {
  border-style: none;
}
&#10;#mjgjkmeugi p {
  margin: 0;
  padding: 0;
}
&#10;#mjgjkmeugi .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#mjgjkmeugi .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#mjgjkmeugi .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#mjgjkmeugi .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#mjgjkmeugi .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#mjgjkmeugi .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#mjgjkmeugi .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#mjgjkmeugi .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#mjgjkmeugi .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#mjgjkmeugi .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#mjgjkmeugi .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#mjgjkmeugi .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#mjgjkmeugi .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#mjgjkmeugi .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#mjgjkmeugi .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#mjgjkmeugi .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#mjgjkmeugi .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#mjgjkmeugi .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#mjgjkmeugi .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mjgjkmeugi .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#mjgjkmeugi .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#mjgjkmeugi .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#mjgjkmeugi .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mjgjkmeugi .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#mjgjkmeugi .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#mjgjkmeugi .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#mjgjkmeugi .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mjgjkmeugi .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#mjgjkmeugi .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#mjgjkmeugi .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#mjgjkmeugi .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#mjgjkmeugi .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#mjgjkmeugi .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mjgjkmeugi .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#mjgjkmeugi .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#mjgjkmeugi .gt_left {
  text-align: left;
}
&#10;#mjgjkmeugi .gt_center {
  text-align: center;
}
&#10;#mjgjkmeugi .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#mjgjkmeugi .gt_font_normal {
  font-weight: normal;
}
&#10;#mjgjkmeugi .gt_font_bold {
  font-weight: bold;
}
&#10;#mjgjkmeugi .gt_font_italic {
  font-style: italic;
}
&#10;#mjgjkmeugi .gt_super {
  font-size: 65%;
}
&#10;#mjgjkmeugi .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#mjgjkmeugi .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#mjgjkmeugi .gt_indent_1 {
  text-indent: 5px;
}
&#10;#mjgjkmeugi .gt_indent_2 {
  text-indent: 10px;
}
&#10;#mjgjkmeugi .gt_indent_3 {
  text-indent: 15px;
}
&#10;#mjgjkmeugi .gt_indent_4 {
  text-indent: 20px;
}
&#10;#mjgjkmeugi .gt_indent_5 {
  text-indent: 25px;
}
&#10;#mjgjkmeugi .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#mjgjkmeugi div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="3" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Total Bike Usage</td>
    </tr>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="bike_id">bike_id</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="month">month</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Usage">Usage</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="bike_id" class="gt_row gt_right">9</td>
<td headers="month" class="gt_row gt_center">Mar</td>
<td headers="Usage" class="gt_row gt_right">38818</td></tr>
    <tr><td headers="bike_id" class="gt_row gt_right">9</td>
<td headers="month" class="gt_row gt_center">Apr</td>
<td headers="Usage" class="gt_row gt_right">5276</td></tr>
    <tr><td headers="bike_id" class="gt_row gt_right">9</td>
<td headers="month" class="gt_row gt_center">May</td>
<td headers="Usage" class="gt_row gt_right">3323</td></tr>
    <tr><td headers="bike_id" class="gt_row gt_right">9</td>
<td headers="month" class="gt_row gt_center">Jun</td>
<td headers="Usage" class="gt_row gt_right">9201</td></tr>
    <tr><td headers="bike_id" class="gt_row gt_right">9</td>
<td headers="month" class="gt_row gt_center">Jul</td>
<td headers="Usage" class="gt_row gt_right">30238</td></tr>
    <tr><td headers="bike_id" class="gt_row gt_right">9</td>
<td headers="month" class="gt_row gt_center">Aug</td>
<td headers="Usage" class="gt_row gt_right">15484</td></tr>
    <tr><td headers="bike_id" class="gt_row gt_right">9</td>
<td headers="month" class="gt_row gt_center">Sep</td>
<td headers="Usage" class="gt_row gt_right">7168</td></tr>
    <tr><td headers="bike_id" class="gt_row gt_right">9</td>
<td headers="month" class="gt_row gt_center">Oct</td>
<td headers="Usage" class="gt_row gt_right">7298</td></tr>
    <tr><td headers="bike_id" class="gt_row gt_right">9</td>
<td headers="month" class="gt_row gt_center">Nov</td>
<td headers="Usage" class="gt_row gt_right">4485</td></tr>
    <tr><td headers="bike_id" class="gt_row gt_right">9</td>
<td headers="month" class="gt_row gt_center">Dec</td>
<td headers="Usage" class="gt_row gt_right">6472</td></tr>
  </tbody>
  &#10;  
</table>
</div>

------------------------------------------------------------------------

## Weather Analysis

To identify how the weather might impact ride patterns, data from the
weather data set was joined to the trip data. For each city and date for
which trip data exists, I joined with the weather conditions for that
date/city. I then summarized each city/date with the total number of
trips on that day as well as the total ride duration. I then created
correlation matrices to identify how changes in weather conditions
affected the total ride duration and total number of trips on a given
day. These correlation plots identify the strength of linear correlation
between 2 variables. A correlation may exist but this does not imply
that it is statistically significant. For each correlation matrix, a
p-value matrix was calculated to determine if a given correlation was
statistically significant. Any results that were found to be
insignificant (p \> 0.05 were removed from the plot. The results can be
visualized for each city:  

![](report_findings_files/figure-gfm/corplot-1.png)<!-- -->![](report_findings_files/figure-gfm/corplot-2.png)<!-- -->![](report_findings_files/figure-gfm/corplot-3.png)<!-- -->![](report_findings_files/figure-gfm/corplot-4.png)<!-- -->![](report_findings_files/figure-gfm/corplot-5.png)<!-- -->

The general trends that can be observed from the data are as follows:  
Total trip time and number of trips tend to correlate positively with
better weather conditions. (i.e higher temperatures, better visibility
and lower wind speeds). There seems to be a negative correlation between
trip time, and trip frequency and precipitation. This is consistent with
expectations as more rain likely discourages people from biking as
opposed to other methods of transportation. It should be noted that the
question marks on some of the plots represent correlations that could
not be calculated. Notably the max visibility index often had a standard
deviation of 0 preventing any meaningful correlation from being
determined.
