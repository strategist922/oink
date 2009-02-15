#!/usr/bin/env ruby

require 'benchmark'

require File.expand_path(File.dirname(__FILE__) + "/../lib/oink_for_memory")

Benchmark.bmbm(15) do |x|
  x.report("Running Oink") { 
    f = File.open(File.expand_path(File.dirname(__FILE__) + "/../logs/production.log"))
    OinkForMemory.new([f], 75*1024).each_line do |line|
    end
    f.close
  }
end
