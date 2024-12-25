#!/usr/bin/env ruby

## command line parameters
#print(ARGF.argv)
#weblink = ARGF.argv[1]
first_arg, *rest_arg = ARGV
puts "[1. ARGV]\t" + first_arg


## read file with raw data
file = File.open(first_arg)

# parse data
file_lines = file.read.split("\n")

report_cnt = 0
file_lines.each {|x|
  puts "[row]\t" + x.split(/\s+/, 0).to_s
  report = x.split(/\s+/, 0)

  first = ''
  op = '' # increasing? decreasing?

  ## check if report is save
  report.each{|l|
    puts "[CHECKING]\t" + l
    if first == '' then
      first = l
      report_cnt = report_cnt.to_i + 1
      next
    end
    puts "[COMPARING]\t" + first + " vs " + l
    puts "[OP]\t" + op
    dec_dist = l.to_i - first.to_i 
    puts "[DECREASING DISTANCE]\t" + dec_dist.to_s
    inc_dist = first.to_i - l.to_i
    puts "[INCREASING DISTANCE]\t" + inc_dist.to_s

    # check if gradually increasing and distance between levels in [1,3]
    #if first.to_i > l.to_i and op != "i" and (l.to_i - first.to_i > 0) then
    if dec_dist in (1..3) and op != "i" then
      op = "d"
      puts "increasing!"
    # check if graudally decreasing and distance between levels in [1,3]
    elsif inc_dist in (1..3) and op != "d" then
      op = "i"
      puts "decreasing!"
    # discarge unsafe report
    else
      puts "not worth looking at!"
      report_cnt = report_cnt.to_i - 1
      break
    end
    puts "[REPORT]\t" + report_cnt.to_s   
    puts "[FIRST]\t" + first
    first = l
  }
}
# count
puts "[SAFE]\t" + report_cnt.to_s
