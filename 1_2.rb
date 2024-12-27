#!/usr/bin/env ruby


## command line parameters
first_arg, *rest_arg = ARGV
puts "[1. ARGV]\t" + first_arg

## read file
file = File.open(first_arg)
file_lines = file.read.split("\n")

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


# sort array
row1.sort.each { |r|
  # find equal in second row
  puts "[LEFT]\t" + r.to_s
  
  # count number of appearances of left row in right low
  puts "[COUNTING RIGHT]\t" +  row2.count(r).to_s
  
  # calculate Product
  sum = sum + (r * row2.count(r))
}

# print out total sum
puts '[SUM] ' + sum.to_s
