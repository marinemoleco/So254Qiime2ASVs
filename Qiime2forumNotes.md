**DADA2, truncation lengths and features number**

https://forum.qiime2.org/t/dada2-truncation-lengths-and-features-number/1940

*My suspicion is that because of the way DADA2 handles chimeras, by running each set of time points separately, you’re getting different sequences that survive chimera handling stochastically. It may be that if you denoise your data together, or use a secondary chimera handling approach (don’t use the built-in chimera handling in DADA2, and then use vsearch), you get fewer singletons because more sequences will survive the chimera filtering.*

*We went back and were a little more aggressive with truncating and trimming this time, and I think it helped a little. We still have lots of singletons (and we haven’t combined any time points yet), but we figured that if they ARE noise/errors, they won’t match to anything when we do the taxonomy strings, and many of them might land in the “unassigned” category. We plan to filter out the “unassigned” taxa strings anyway, so we’d be getting rid of them eventually.*




**Too many singletons after Dada2 with paired-end reads**

https://forum.qiime2.org/t/too-many-singletons-after-dada2-with-paired-end-reads/7718

*Unfortunately looking at your reverse primers, the quality seems to drop rather early which in my opinion will make it harder to merge properly. In that case I think using the forward reads only (which seem to be in much better shape anyways) would be your best bet.*

*Deblur works on one direction of reads only, meaning you can provide it paired-end reads but it will simply ignore the reverse reads. If you merge the forward and reverse reads prior to deblur, let’s say with q2-vsearch, it will denoise the full length. I should mention however that in this method the high quality scores of the overlap regions (as produced by consensus methods) are wasted since deblur doesn’t use those scores, instead uses its own error model which assumes that the quality scores continuously reduce as the length increases.*



**Dada2: 90% read drop after filering and merging**

https://forum.qiime2.org/t/dada2-90-read-drop-after-filering-and-merging/6071

(hint: look at the plots & compare these results with the statement below)

*Deblur works on one direction of reads only, meaning you can provide it paired-end reads but it will simply ignore the reverse reads. If you merge the forward and reverse reads prior to deblur, let’s say with q2-vsearch, it will denoise the full length. I should mention however that in this method the high quality scores of the overlap regions (as produced by consensus methods) are wasted since deblur doesn’t use those scores, instead uses its own error model which assumes that the quality scores continuously reduce as the length increases.*