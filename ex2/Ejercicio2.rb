#!/usr/bin/env ruby

require 'bio'

if ARGV.length != 3
  puts 'Parametros: <ARCHIVO_ENTRADA> <ARCHIVO_SALIDA> <--local || --remoto>'
  exit
end

puts ARGV[2]

if ARGV[2].eql?('--local')
  blast = Bio::Blast.local('blastp', '/home/kevin/Desktop/ex2/swissprot')
elsif ARGV[2].eql?('--remoto')
  blast = Bio::Blast.remote('blastp', 'swissprot', '-e 0.0001', 'genomenet')
else 
  puts 'No es valido'
  exit
end

entries = Bio::FlatFile.open(Bio::FastaFormat, ARGV[0])

File.open(ARGV[1], 'w') do |f|
  entries.each_entry do |entry|

    report = blast.query(entry.seq)

    report.hits.each_with_index do |hit, hit_index|
      f.puts '------------------------------------------------'
      f.puts "Hit #{hit_index}"
      f.puts hit.accession  
      f.puts hit.definition
      f.puts " - Query length: #{hit.len}"
      f.puts " - Number of identities: #{hit.identity}"
      f.puts " - Length of Overlapping region: #{hit.overlap}"
      f.puts " - % Overlapping: #{hit.percent_identity}"
      f.puts " - Query sequence: #{hit.query_seq}"
      f.puts " - Subject sequence: #{hit.target_seq}"
      hit.hsps.each_with_index do |hsps, hsps_index|
        f.puts " - Bit score: #{hsps.bit_score}"
        f.puts " - Gaps: #{hsps.gaps}"
      end
    end

  end
end
