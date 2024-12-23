#!/usr/bin/env ruby

## gems
#require 'net/http'
#require 'uri'


## command line parameters
#print(ARGF.argv)
#weblink = ARGF.argv[1]
first_arg, *rest_arg = ARGV
print('[1. ARGV]\t' + first_arg)

## no option because you have to log into git during grapping
# read input list
# 37033   48086
#def open(url)
#  Net::HTTP.get(URI.parse(url))
#end

#page_content = open(first_arg)
#puts page_content
file = File.open(first_arg)
file_lines = file.read.split("\n")

## parsing input file
#file_lines.each{ |line|
#  print(c)  
#  puts line.split("\t")
#}

## define empty arrays for rows
row1 = []
row2 = []

## parse file content
file_lines.each {|x| 
  #puts '[row 1]' + x.split(/\s+/, 0)[0].to_s
  row1.push(x.split(/\s+/, 0)[0].to_i)
  #puts '[row 2]' + x.split(/\s+/, 0)[1].to_s
  row2.push(x.split(/\s+/, 0)[1].to_i)
}

## sort firs row and finde for each number the possible smalles equal in second row
sum = 0 # sum for total distance


row2 = row2.sort
#puts row2
#row2.shift
#puts '-----------------------------------'
#puts row2

# sort array
row1.sort.each { |r|
  # find equal in second row
  #puts "[LEFT]\t" + r.to_s
  
  row2.each do |s|
    puts "[RIGHT]\t" + s.to_s
    
    if s.to_i > r.to_i then
      sum = sum + (s.to_i - r.to_i)
      puts "[DISTANCE]\t" + (s.to_i - r.to_i).to_s
    else
      sum = sum + (r.to_i - s.to_i)
      puts "[DISTANCE]\t" + (r.to_i - s.to_i).to_s
    end
    row2.shift
    break
  end
}

# print out total sum
puts '[SUM] ' + sum.to_s
