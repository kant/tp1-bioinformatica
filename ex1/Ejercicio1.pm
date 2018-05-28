use Bio::SeqIO;

$seqio_obj = Bio::SeqIO->new(-file => "<sequence.gb", 
                             -format => "genbank" ); 
$seq_obj = $seqio_obj->next_seq;

$prot_obj = $seq_obj->translate;

$seqio_obj2 = Bio::SeqIO->new(-file => ">sequence-out.fasta",
				-format => "fasta");
$seqio_obj2->write_seq($prot_obj);


#print $seq_obj->seq;
#print $prot_obj->seq;
