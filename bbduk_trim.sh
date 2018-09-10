for i in `ls -1 *_R1_001.fastq.gz | sed 's/_R1_001.fastq.gz//'`
do
~/work/bbmap/bbduk.sh -Xmx1g in1=$i\_R1_001.fastq.gz in2=$i\_R2_001.fastq.gz out1=$i\_bbduk_R1_001.fastq.gz out2=$i\_bbduk_R2_001.fastq.gz qtrim=rl trimq=20  minlen=250
done
