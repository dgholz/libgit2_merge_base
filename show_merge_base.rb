#!/bin/env ruby

require 'rugged'

repo = Rugged::Repository.new('.')
base_ref = ARGV[1] || 'master'
head_ref = ARGV[2] || 'HEAD'

puts repo.merge_base(head_ref, base_ref)
