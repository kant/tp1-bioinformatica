#!/usr/bin/env ruby

require 'bio'

if ARGV.length != 2
  puts 'Parametros: <NOMBRE.gb> <SALIDA>'
  exit
end

entries = Bio::GenBank.open(ARGV[0])

File.open(ARGV[1], 'w') do |f|
entries.each_entry do |entry|
  definition = "#{entry.definition}"
  #puts entry.naseq.to_fasta(definition, 60)

  val = entry.seq.translate
  f.puts val.to_fasta(definition)
end
end
