require 'bio'

remote_blast_factory =  Bio::Blast.local('blastp', '/home/kevin/Desktop/ex2/swissprot')

seq = Bio::Sequence::AA.new('ASHEMAHAFIAILMFLMAKVLRKSL*IHVIS*QSETS*GLKGQVEVIIIV*IHSPCIELLIFALMLQAIEREKAEKFRKLQDASRSAQALVEQMVNGNYTS*FR*SS*GFDKHIGSYLSAELYQTSTC*IQI*IKRCLYVFYYSFFNAKEIIRRNSTLSSLEENGMW*NILSVCSREINFNANLLEFIQII*EIRLTEIETLTVKY')

# run the actual BLAST by querying the factory
report = remote_blast_factory.query(seq)

# Then, to parse the report, see Bio::Blast::Report
report.each do |hit|
    puts '-------------'
    puts hit.evalue           # E-value
    puts hit.identity         # % identity
    puts hit.overlap          # length of overlapping region
    puts hit.query_id         # identifier of query sequence
    puts hit.query_def        # definition(comment line) of query sequence
    puts hit.query_len        # length of query sequence
    puts hit.query_seq        # sequence of homologous region
    puts hit.target_id        # identifier of hit sequence
    puts hit.target_def       # definition(comment line) of hit sequence
    puts hit.target_len       # length of hit sequence
    puts hit.target_seq       # hit of homologous region of hit sequence
    puts hit.query_start      # start position of homologous
                              # region in query sequence
    puts hit.query_end        # end position of homologous region
                              # in query sequence
    puts hit.target_start     # start position of homologous region
                              # in hit(target) sequence
    puts hit.target_end       # end position of homologous region
                              # in hit(target) sequence
    puts hit.lap_at           # array of above four numbers
end
