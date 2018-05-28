from Bio import SeqIO
from Bio.Alphabet import generic_dna, generic_protein

input_handle = open("example.fasta", "rU")
output_handle = open("test.gb", "w")

sequences = list(SeqIO.parse(input_handle, "fasta"))

#asign generic_dna or generic_protein
for seq in sequences:
  seq.seq.alphabet = generic_dna

count = SeqIO.write(sequences, output_handle, "genbank")

output_handle.close()
input_handle.close()
print "Coverted %i records" % count
